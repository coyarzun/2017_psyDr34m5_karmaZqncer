/*
toDoes:
-bug strokes en dream toroid y shockwave
-bug logo invertido voodoo en vez de img buffer
-seleccionar track de audio --> make
-zonas/pantallas/planas vs txtures doScenes? Shots?

*/

import processing.video.*;
import ddf.minim.*;
import oscP5.*;
import netP5.*;

Minim minim;
AudioInput in;
OscP5 oscP5;
NetAddress myRemoteLocation;

PShader    shader;
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
  //setupTextGrid();
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
  //drawTextGrid();
  if(doFX1)gridFXRoutine();

  background(255);
  if (environment.doProcess)shaderStuff();
    else resetShader();
    
  if (doGrid)image(gridBuffer, 0, 0, width, height);
  //if (doGrid)image(textBuffer, 0, 0);
  else 
  {
    
    image(psydreams.buffer, 0, 0, width,height);
  }
  resetShader();
  //blendMode(MULTIPLY);
  if (doGuides)image(guidesBuffer, 0, 0, width, height);
  if (doRingGuides)image(ringGuidesBuffer, 0, 0, width, height);
  if(doFX1)image(gridFxBuffer, 0, 0, width, height);
  
  
  //blendMode(MULTIPLY);
  //if (doMuseum)image(pgrid, 0, 0, width, height);
  //noTint();
  //blendMode(NORMAL);

  if (doMask)image(pmask, 0, 0, width, height);
  
  //updatePixels();
  if(recording)recordingRoutine();
}


