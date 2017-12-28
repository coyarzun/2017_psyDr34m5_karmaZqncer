PImage pgrid, pmask;

boolean realSize;
int realWidth, realHeight;

color  guideColor;

PVector zero;
float left, right, top, bottom;

ArrayList<Guide> guides; 
Guide[] hguides, vguides;
Grid grid;

void setup() {  
  setupRsrcs();
  setupSizes();
  setupColors();
  setupZeroes();
  setupGuides();
  setupGrid();
}

void draw() {
  //println("maybeHere?");
  background(255);
  image(pgrid, 0, 0, width, height);
  grid.draw();
  drawGuides();
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


