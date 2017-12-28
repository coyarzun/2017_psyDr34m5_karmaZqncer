/*
toDoes:
-mega bug se pega al volver de grid=true !!!<.--ok
-bug se va el zero al pasar de grid a no grid<--ok
-bug strokes en dream toroid y shockwave
-ajustar zero en dreams<..ok
-redo/add because visuals?--< think no
-seleccionar track de audio --> make
-zonas/pantallas/planas vs txtures doScenes? Shots?
guion:
voice Kathy --> luz --> nature / energy
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
PGraphics gridBuffer, guidesBuffer, ringGuidesBuffer, gridFxBuffer, textBuffer;
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
TextGrid textGrid;

Movie[]     video;
float[]     videoAspectRatio;
int         wichVideo = 0;

Environment environment;
PsyDreams   psydreams;

PFont font;

void setup() {  
  resetDoes();
  setupSizes();
  setupRsrcs();
  setupColors();
  setupZeroes();
  setupGuides();
  setupRingGuides();
  setupGrid();
  setupTextGrid();
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
  //drawGrid();
  drawTextGrid();
  gridFXRoutine();

  background(255);
  //if (doGrid)image(gridBuffer, 0, 0);
  if (doGrid)image(textBuffer, 0, 0);
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


