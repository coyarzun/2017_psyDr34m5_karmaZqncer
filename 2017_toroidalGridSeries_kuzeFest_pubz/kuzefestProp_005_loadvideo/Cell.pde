class Cell{
  PVector leftTopCorner, center;
  float w, h;
  
  Cell(float l, float t, float r, float b){
    leftTopCorner = new PVector(l,r);
    w = r-l; h = b-t;
    center = new PVector(l+w/2.0,t+h/2.0);
  }
  void draw(float h){
    fill(h,255,255);noStroke();
    doDraw();
  }
  void draw(){
    fill(255);stroke(0);
    doDraw();
  }
  void doDraw(){
    pushMatrix();
    translate(center.x,center.y);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}
