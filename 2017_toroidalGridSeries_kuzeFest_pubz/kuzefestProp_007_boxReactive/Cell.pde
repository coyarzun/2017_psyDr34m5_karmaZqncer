class Cell{
  PVector leftTopCorner, center;
  float w, h;
  
  Cell(float l, float t, float r, float b){
    leftTopCorner = new PVector(l,r);
    w = r-l; h = b-t;
    center = new PVector(l+w/2.0,t+h/2.0);
  }
  void draw(float h){
    gridBuffer.fill(h,255,255);gridBuffer.noStroke();
    doDraw();
  }
  void draw(float h, float d){
    gridBuffer.fill(h,255,255);gridBuffer.noStroke();
    do3Draw(d);
  }
  void draw(){
    gridBuffer.fill(255);gridBuffer.stroke(0);
    doDraw();
  }
  void doDraw(){
    gridBuffer.pushMatrix();
    gridBuffer.translate(center.x,center.y);
    gridBuffer.rectMode(CENTER);
    if(doPadding)gridBuffer.scale(0.8);
    gridBuffer.rect(0,0,w,h);
    gridBuffer.popMatrix();
  }
  void do3Draw(float d){
    gridBuffer.pushMatrix();
    gridBuffer.translate(center.x,center.y);
    //gridBuffer.rotateZ(PI/4);
    //fill(random(255));
    if(doPadding)gridBuffer.scale(0.8);
    gridBuffer.box(w,h,doPadding?2*d:d);
    gridBuffer.popMatrix();
  }
}
