class Cell{
  PVector leftTopCorner, center;
  float w, h;
  
  Cell(float l, float t, float r, float b){
    leftTopCorner = new PVector(l,r);
    w = r-l; h = b-t;
    center = new PVector(l+w/2.0,t+h/2.0);
  }
  void draw(color h){
    gridBuffer.fill(h);gridBuffer.noStroke();//,255,255
    doDraw();
  }
  void draw(color h, float d){
    gridBuffer.fill(h);gridBuffer.noStroke();
    do3Draw(d);
  }
  /*void draw(float c, float d){
    gridBuffer.fill(c);gridBuffer.noStroke();
    do3Draw(d);
  }*/
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
    if(realSize)gridBuffer.translate(-gridBuffer.width/2,0);//-gridBuffer.height/2);
    else gridBuffer.translate(-gridBuffer.width/2,-gridBuffer.height/2);
    //gridBuffer.rotateZ(PI/4);
    //fill(random(255));
    if(doPadding)gridBuffer.scale(0.8);
    gridBuffer.box(w,h,doPadding?2*d:d);
    gridBuffer.popMatrix();
  }
}
