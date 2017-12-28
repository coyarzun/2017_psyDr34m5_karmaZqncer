class Landscape{
  PGraphics buffer;
  
  Landscape(){
    buffer = createGraphics(width,height,P3D);
  }
  void  draw(){
    buffer.beginDraw();
    buffer.translate(zero.x,height);
    buffer.rotateX(radians(10));
    
    doColumn(-96,0,0,48,56,radians(0));//columna izq
    doColumn(-96+12,0,0,12,100,radians(0));//columna izq
    
    
    
    
    buffer.endDraw();
  }
  void doColumn(float x, float y, float z, float w, float h, float r){
    buffer.pushMatrix();
    buffer.translate(x,y,z);
    buffer.translate(0,-h/2,0);
    buffer.rotateY(r);
    buffer.box(w,h,w);
    buffer.popMatrix();
  }
}
