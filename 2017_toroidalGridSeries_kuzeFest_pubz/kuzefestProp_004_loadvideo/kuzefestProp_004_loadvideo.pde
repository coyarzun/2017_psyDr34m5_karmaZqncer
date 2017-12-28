import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioInput in;

PImage pgrid, pmask;

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

  
  setupRsrcs();
  setupSizes();
  setupColors();
  setupZeroes();
  setupGuides();
  setupGrid();
  
  setupVideo();
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw() {
  //println("maybeHere?");
  videoAspectRatio[wichVideo] = video[wichVideo].width/float(video[wichVideo].height);
  background(255);
  image(pgrid, 0, 0, width, height);
  grid.draw(video[wichVideo]);
  //drawGuides();
  image(pmask, 0, 0, width, height);
}
void drawGuides() {
  pushMatrix();
  //translate(zero.x,zero.y);
  for (Guide g : hguides) {
    g.draw();
  }
  for (Guide g : vguides) {
    g.draw();
  }
  popMatrix();
}


