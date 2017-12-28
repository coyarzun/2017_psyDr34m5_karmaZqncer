void drawGuides() {
  guidesBuffer.beginDraw();
  guidesBuffer.colorMode(HSB);
  
  guidesBuffer.pushMatrix();
  //translate(zero.x,zero.y);
  for (Guide g : hguides) {
    g.draw();
  }
  for (Guide g : vguides) {
    g.draw();
  }
  guidesBuffer.popMatrix();
  
  guidesBuffer.endDraw();
}
void drawRingGuides() {
  ringGuidesBuffer.beginDraw();
  ringGuidesBuffer.colorMode(HSB);
  
  ringGuidesBuffer.pushMatrix();
  //translate(zero.x,zero.y);
  for (RingGuide g : ringGuides) {
    g.draw();
  }
  ringGuidesBuffer.popMatrix();
  
  ringGuidesBuffer.endDraw();
}
void drawGrid(){
  gridBuffer.beginDraw();
  gridBuffer.colorMode(HSB);
  gridBuffer.background(0);
  if (doLights)gridBuffer.lights();
  grid.draw(psydreams.buffer,in);//
  gridBuffer.endDraw();
}
void drawTextGrid(){
  textBuffer.beginDraw();
  textBuffer.colorMode(HSB);
  textBuffer.background(0);
  textBuffer.textFont(font, 100);
  if (doLights)textBuffer.lights();
  textGrid.draw(psydreams.buffer,in);//
  textBuffer.endDraw();
}
