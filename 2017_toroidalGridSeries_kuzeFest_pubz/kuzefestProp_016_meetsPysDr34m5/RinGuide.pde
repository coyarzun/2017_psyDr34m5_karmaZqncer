class RingGuide {
  PVector center;
  float[] radius, diameters, aspectRatio;

  RingGuide(float x1, float y1, float[] k ) {
    center = new PVector(x1, y1);
    radius      = new float[k.length/2];
    diameters   = new float[k.length/2];
    aspectRatio = new float[k.length/2];
    
    int ii = 0;
    for(int i=0; i<k.length; i+=2){
      radius[ii]      =   k[i];
      diameters[ii]   = 2*k[i];
      aspectRatio[ii] =   k[i+1];
      ii++;
    }
    println(radius);
  }
  void draw() {
    ringGuidesBuffer.stroke(guideColor); 
    ringGuidesBuffer.strokeWeight(1);
    ringGuidesBuffer.noFill();
    ringGuidesBuffer.ellipseMode(CENTER);
    for(int i=diameters.length-1; i>=0; i--){
      ringGuidesBuffer.ellipse(center.x, center.y, diameters[i]*aspectRatio[i], diameters[i]);
    }
  }
}

