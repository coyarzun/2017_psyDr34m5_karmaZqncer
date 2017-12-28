import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

PImage pgrid, pmask;
PGraphics gridBuffer, guidesBuffer;
boolean realSize;
int realWidth, realHeight;

color  guideColor;

PVector zero;
float left, right, top, bottom;

ArrayList<Guide> guides; 
Guide[] hguides, vguides;
Grid grid;

Movie[]     video;
float[]     videoAspectRatio;
int         wichVideo = 0;

void setup() {  



  setupSizes();
  setupRsrcs();
  setupColors();
  setupZeroes();
  setupGuides();
  setupGrid();
  setupVideo();
  minim = new Minim(this);
  in = minim.getLineIn();

  guidesBuffer.beginDraw();
  guidesBuffer.colorMode(HSB);
  if (doGuides)drawGuides();
  guidesBuffer.endDraw();
}

void draw() {
  //println("maybeHere?");
  videoAspectRatio[wichVideo] = video[wichVideo].width/float(video[wichVideo].height);


  gridBuffer.beginDraw();
  gridBuffer.colorMode(HSB);
  gridBuffer.background(0);
  if (doLights)gridBuffer.lights();
  if (doGrid) {
    if (doVideo)
      grid.draw(video[wichVideo]);
    else
      grid.draw(video[wichVideo], in);
  }
  gridBuffer.endDraw();

  background(255);
  if (doGrid)image(gridBuffer, 0, 0);
  blendMode(MULTIPLY);
  if (doMuseum)image(pgrid, 0, 0, width, height);
  noTint();
  blendMode(NORMAL);
  if (doGuides)image(guidesBuffer, 0, 0);
  if (doMask)image(pmask, 0, 0, width, height);
}
void drawGuides() {
  guidesBuffer.pushMatrix();
  //translate(zero.x,zero.y);
  for (Guide g : hguides) {
    g.draw();
  }
  for (Guide g : vguides) {
    g.draw();
  }
  guidesBuffer.popMatrix();
}

