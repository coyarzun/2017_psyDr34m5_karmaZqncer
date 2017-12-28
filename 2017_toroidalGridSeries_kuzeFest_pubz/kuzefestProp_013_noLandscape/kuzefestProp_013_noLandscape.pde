import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

PImage pgrid, pmask;
PGraphics gridBuffer, guidesBuffer, ringGuidesBuffer;
boolean realSize;
int realWidth, realHeight;

color  guideColor;

PVector zero;
float left, right, top, bottom;

ArrayList<Guide> guides; 
ArrayList<RingGuide> ringGuides; 
Guide[] hguides, vguides;
Grid grid;

Movie[]     video;
float[]     videoAspectRatio;
int         wichVideo = 0;

Landscape landscape;

void setup() {  


  resetDoes();
  setupSizes();
  setupRsrcs();
  setupColors();
  setupZeroes();
  setupGuides();
  setupRingGuides();
  setupGrid();
  setupVideo();
  setupLandscape();
  minim = new Minim(this);
  in = minim.getLineIn();

  
  
}

void draw() {
  if(doRandomAll)randomAll();
  videoAspectRatio[wichVideo] = video[wichVideo].width/float(video[wichVideo].height);

  if (doGuides)drawGuides();
  if (doRingGuides)drawRingGuides();
  if (doGrid)drawGrid();
  landscape.draw();

  background(255);
  //if (doGrid)image(gridBuffer, 0, 0);blendMode(MULTIPLY);
  
  
  if (doMuseum)image(pgrid, 0, 0, width, height);
  
  image(landscape.buffer, 0, 0);
  noTint();
  blendMode(NORMAL);
  if (doGuides)image(guidesBuffer, 0, 0);
  //if (doRingGuides)image(ringGuidesBuffer, 0, 0);
  if (doMask)image(pmask, 0, 0, width, height);
}


