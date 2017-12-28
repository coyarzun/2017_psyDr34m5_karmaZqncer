/*
toDoes:
-mega bug se pega al volver de grid=true !!!
-bug se va el zero al pasar de grid a no grid
-bug strokes en dream toroid y shockwave
-ajustar zero en dreams<..ok
-redo/add because visuals?
-seleccionar track de audio
-zonas/pantallas/planas vs txtures
guion:
voice Kathy --> nature / energy
math
patterns
adn
dust
hair
cardioid light
gradualmente se va subiendo el centro de gravedad/luz
*/

import processing.video.*;
import ddf.minim.*;
import oscP5.*;
import netP5.*;

Minim minim;
AudioInput in;
OscP5 oscP5;
NetAddress myRemoteLocation;

PImage pgrid, pmask;
PGraphics gridBuffer, guidesBuffer, ringGuidesBuffer, gridFxBuffer;
boolean realSize;
int realWidth, realHeight;

color  guideColor;

PVector zero;
float left, right, top, bottom;
float suntop;
ArrayList<Guide> guides; 
ArrayList<RingGuide> ringGuides; 
Guide[] hguides, vguides;
Grid grid;

Movie[]     video;
float[]     videoAspectRatio;
int         wichVideo = 0;

Environment environment;
PsyDreams   psydreams;

void setup() {  
  resetDoes();
  setupSizes();
  setupRsrcs();
  setupColors();
  setupZeroes();
  setupGuides();
  setupRingGuides();
  setupGrid();
  //setupVideo();
  minim = new Minim(this);
  in = minim.getLineIn();
  environment = new Environment();
  psydreams   = new PsyDreams();
  oscSetup();
  drawGuides();
  drawRingGuides();
}

void draw() {
  if(doRandomAll)randomAll();
  //videoAspectRatio[wichVideo] = video[wichVideo].width/float(video[wichVideo].height);
  psydreams.draw();
  drawGrid();
  gridFXRoutine();

  background(255);
  if (doGrid)image(gridBuffer, 0, 0);
  else 
  image(psydreams.buffer, 0, 0, width,height);
  
  if (doGuides)image(guidesBuffer, 0, 0);
  if (doRingGuides)image(ringGuidesBuffer, 0, 0);
  image(gridFxBuffer, 0, 0);
  blendMode(MULTIPLY);
  if (doMuseum)image(pgrid, 0, 0, width, height);
  noTint();
  blendMode(NORMAL);

  if (doMask)image(pmask, 0, 0, width, height);
}
void gridFXRoutine(){
  gridFxBuffer.beginDraw();
  gridFxBuffer.background(0,0);
  gridFxBuffer.colorMode(HSB);
  gridFxBuffer.noFill();
  
  gridFxBuffer.stroke(random(255),255,255);
  gridFxBuffer.strokeWeight(random(1,4));
  int wichRing = int(random(ringGuides.size()));
  int wichRadius = int(random(ringGuides.get(wichRing).radius.length));
  float cx = ringGuides.get(wichRing).center.x;
  float cy = ringGuides.get(wichRing).center.y;
  float cw = ringGuides.get(wichRing).diameters[wichRadius]*ringGuides.get(wichRing).aspectRatio[wichRadius];
  float ch = ringGuides.get(wichRing).diameters[wichRadius];
  gridFxBuffer.ellipse(cx,cy,cw,ch);
  
  gridFxBuffer.stroke(random(255),255,255);
  gridFxBuffer.strokeWeight(random(1,4));
  int wichH = int(random(hguides.length));
  int wichV = int(random(vguides.length));
  float cx1 = hguides[wichH].from.x;
  float cy1 = hguides[wichH].from.y;
  float cx2 = hguides[wichH].to.x;
  float cy2 = hguides[wichH].to.y;
  float cx12 = vguides[wichV].from.x;
  float cy12 = vguides[wichV].from.y;
  float cx22 = vguides[wichV].to.x;
  float cy22 = vguides[wichV].to.y;
  gridFxBuffer.line(cx1,cy1,cx2,cy2);
  gridFxBuffer.line(cx12,cy12,cx22,cy22);
  
  gridFxBuffer.endDraw();
}

