class Guide {
  PVector from, to;

  Guide(float x1, float y1, float x2, float y2) {
    from = new PVector(x1, y1);
    to   = new PVector(x2, y2);
  }
  Guide(float x1, float y1, float x2, float y2, String m) {
    if(m.equals("flipH")){
      from = new PVector(width-x1, y1);
      to   = new PVector(width-x2, y2);
    }else if(m.equals("flipV")){
      from = new PVector(x1, height-y1);
      to   = new PVector(x2, height-y2);
    }else if(m.equals("flipHV")){
      from = new PVector(width-x1, height-y1);
      to   = new PVector(width-x2, height-y2);
    }else{
      from = new PVector(x1, y1);
      to   = new PVector(x2, y2);
    }
  }
  void draw() {
    guidesBuffer.stroke(guideColor); 
    guidesBuffer.strokeWeight(2);
    guidesBuffer.line(from.x, from.y, to.x, to.y);
  }
}

