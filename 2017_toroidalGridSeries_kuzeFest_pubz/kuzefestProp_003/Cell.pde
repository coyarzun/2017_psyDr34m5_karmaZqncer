class Cell{
  PVector leftTopCorner, center;
  float w, h;
  
  Cell(float l, float t, float r, float b){
    leftTopCorner = new PVector(l,r);
    w = r-l; h = b-t;
    center = new PVector(l+w/2.0,t+h/2.0);
  }
  void draw(){
    pushMatrix();
    translate(center.x,center.y);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}
