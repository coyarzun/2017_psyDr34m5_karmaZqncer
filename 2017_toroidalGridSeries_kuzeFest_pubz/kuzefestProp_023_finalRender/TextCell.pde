class TextCell{
  PVector leftTopCorner, center;
  float w, h;
  
  TextCell(float l, float t, float r, float b){
    leftTopCorner = new PVector(l,r);
    w = r-l; h = b-t;
    center = new PVector(l+w/2.0,t+h/2.0);
  }
  void draw(color h){
    textBuffer.fill(h);textBuffer.noStroke();//,255,255
    doDraw();
  }
  void draw(color h, float d){
    textBuffer.fill(h);textBuffer.noStroke();
    doTxtDraw(char(int(random(65,90))));
  }
  void draw(color h, float d, char c){
    textBuffer.fill(h);textBuffer.noStroke();
    doTxtDraw(c);
  }
  void draw(){
    textBuffer.fill(255);textBuffer.stroke(0);
    doDraw();
  }
  void doDraw(){
    textBuffer.pushMatrix();
    textBuffer.translate(center.x,center.y);
    textBuffer.rectMode(CENTER);
    if(doPadding)textBuffer.scale(0.8);
    textBuffer.rect(0,0,w,h);
    textBuffer.popMatrix();
  }
  void do3Draw(float d){
    textBuffer.pushMatrix();
    textBuffer.translate(center.x,center.y);
    //textBuffer.rotateZ(PI/4);
    //fill(random(255));
    if(doPadding)textBuffer.scale(0.8);
    textBuffer.box(w,h,doPadding?2*d:d);
    textBuffer.popMatrix();
  }
  void doTxtDraw(char c){
    textBuffer.pushMatrix();
    textBuffer.translate(center.x,center.y);
    textBuffer.textMode(CENTER);
    textBuffer.textAlign(CENTER);
    textBuffer.textSize(w);
    if(doPadding)textBuffer.scale(0.8);
    textBuffer.text(c, 0,0, h/2);
    textBuffer.popMatrix();
  }
}
