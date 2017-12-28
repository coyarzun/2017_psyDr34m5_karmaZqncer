class Landscape{
  PGraphics buffer;
  
  Landscape(){
    buffer = createGraphics(width,height,P3D);
  }
  void  draw(){
    buffer.beginDraw();
    buffer.background(0,0);
    buffer.translate(zero.x,zero.y);
    buffer.rotateX(radians(10));
    
    //doXBox(0,0,0,48,48,radians(4*frameCount),0);//columna izq
    
    
    
    
    
    buffer.endDraw();
  }
  void doXBox(float x, float y, float z, float w, float h, float ry, float rx){
    buffer.pushMatrix();
    buffer.translate(x,y,z);
    buffer.translate(0,-h/2,0);
    
    buffer.rotateX(rx);
    buffer.rotateY(ry);
    buffer.box(w,h,w);
    buffer.popMatrix();
  }
}
