PImage grid, mask;

boolean realSize;
int realWidth, realHeight;

color  guideColor;

PVector zero, left, right, top, bottom;

ArrayList<Guide> guides;

void setup() {  
  setupRsrcs();
  setupSizes();
  setupColors();
  setupZeroes();
  setupGuides();
}
void setupRsrcs(){
  grid = loadImage("MNBA_Grilla2D.png");
  mask = loadImage("MNBA_MASCARA.png");
}
void setupSizes(){
  realSize = false;
  realWidth = 4096;
  realHeight = 1698;
  int f = realSize?1:4;
  size(realWidth/f, realHeight/f, P3D);
}
void setupColors() {
  colorMode(HSB);
  guideColor = color(128, 255, 255);
}
void setupZeroes(){
  zero = new PVector(width/2, height/2);
  /*left  = -zero.x;
  right =  zero.x;
  top   =*/  
}
void setupGuides() {
  guides = new ArrayList<Guide>();
  guides.add( new Guide(-width/2, -height/2, width/2, height/2) );
}
void draw() {
  background(255);
  image(grid, 0, 0, width, height);
  drawGuides();
  image(mask, 0, 0, width, height);
}
void drawGuides() {
  pushMatrix();
  translate(zero.x,zero.y);
  for (Guide g : guides) {
    g.draw();
  }
  popMatrix();
}

class Guide {
  PVector from, to;

  Guide(float x1, float y1, float x2, float y2) {
    from = new PVector(x1, y1);
    to   = new PVector(x2, y2);
  }
  void draw() {
    stroke(guideColor); 
    strokeWeight(1);
    line(from.x, from.y, to.x, to.y);
  }
}

