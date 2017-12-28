void setupRsrcs(){
  gridBuffer = createGraphics(width,height,P3D);
  guidesBuffer = createGraphics(width,height,P3D);
  ringGuidesBuffer = createGraphics(width,height,P3D);
  gridFxBuffer = createGraphics(width,height,P3D);
  textBuffer = createGraphics(width,height,P3D);
  
  
  pgrid = loadImage("MNBA_Grilla2D.png");
  pmask = loadImage("MNBA_MASCARA.png");
  
}
void setupSizes(){
  realSize = false;
  realWidth = 4096;
  realHeight = 1698;
  int f = realSize?1:2;
  size(realWidth/f, realHeight/f, P3D);
  colorMode(HSB);
  textureWrap(REPEAT);
  
}
void setupColors() {
  colorMode(HSB);
  guideColor = color(128, 255, 255, 196);//, 128);
}
void setupZeroes(){
  zero = new PVector(width/2, 2*height/3);
  left   = zero.x-width/2;
  right  = zero.x+width/2;
  top    = zero.y-2*height/3; 
  bottom = zero.y+height/3; 
}

void setupGuides() {
  guides = new ArrayList<Guide>();
  //guides.add( new Guide(-width/2, -height/2, width/2, height/2) );
  //guides.add( new Guide(left, top, right, bottom ));//diagonal
  //horizontales
  
  guides.add( new Guide(left, zero.y-2*height/3, right, zero.y-2*height/3) );//top
  guides.add( new Guide(left, zero.y-2*height/3+16, right, zero.y-2*height/3+16) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48, right, zero.y-2*height/3+16+48) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8, right, zero.y-2*height/3+16+48+8) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8+8, right, zero.y-2*height/3+16+48+8+8) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8+8+10, right, zero.y-2*height/3+16+48+8+8+10) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8+8+10+10, right, zero.y-2*height/3+16+48+8+8+10+10) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8+8+10+10+8, right, zero.y-2*height/3+16+48+8+8+10+10+8) );
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8+8+10+10+8+10, right, zero.y-2*height/3+16+48+8+8+10+10+8+10) );//upper oval center
  guides.add( new Guide(left, zero.y-2*height/3+16+48+8+8+10+10+8+10+12, right, zero.y-2*height/3+16+48+8+8+10+10+8+10+12) );
  float top2 =  zero.y-2*height/3+16+48+8+8+10+10+8+10+12+4;
  guides.add( new Guide(left,top2, right, top2) );//secon top
  guides.add( new Guide(left,top2+4, right, top2+4) );//
  guides.add( new Guide(left,top2+4+12, right, top2+4+12) );//
  guides.add( new Guide(left,top2+4+12+4, right, top2+4+12+4) );//
  guides.add( new Guide(left,top2+4+12+4+4, right, top2+4+12+4+4) );//
  guides.add( new Guide(left,top2+4+12+4+4+6, right, top2+4+12+4+4+6) );//<--
  guides.add( new Guide(left,top2+4+12+4+4+6+6, right, top2+4+12+4+4+6+6) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6, right, top2+4+12+4+4+6+6+6) );//<--
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6, right, top2+4+12+4+4+6+6+6+6) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10, right, top2+4+12+4+4+6+6+6+6+10) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4, right, top2+4+12+4+4+6+6+6+6+10+4) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4+4, right, top2+4+12+4+4+6+6+6+6+10+4+4) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4+4+6, right, top2+4+12+4+4+6+6+6+6+10+4+4+6) );//<--
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4+4+6+6, right, top2+4+12+4+4+6+6+6+6+10+4+4+6+6) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4, right, top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4, right, top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4) );//
  guides.add( new Guide(left,top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4+10, right, top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4+10) );//
  suntop = top2+4+12+4+4+6+6+6+6+10+4+4+6+6+4+10+10;
  guides.add( new Guide(left,suntop, right, suntop) );//<--SUN TOP
  guides.add( new Guide(left,suntop+36, right, suntop+36) );//
  //guides.add( new Guide(left,suntop+36+8, right, suntop+36+8) );//
  guides.add( new Guide(left, zero.y, right, zero.y) );//horizon
  guides.add( new Guide(left, zero.y+4, right, zero.y+4) );//
  guides.add( new Guide(left, zero.y+4+10, right, zero.y+4+10) );//<--technical horizon
  guides.add( new Guide(left, zero.y+4+10+6, right, zero.y+4+10+6) );//
  guides.add( new Guide(left, zero.y+4+10+6+8, right, zero.y+4+10+6+8) );//
  guides.add( new Guide(left, zero.y+4+10+6+8+16, right, zero.y+4+10+6+8+16) );//
  guides.add( new Guide(left, zero.y+4+10+6+8+16+8, right, zero.y+ 4+10+6+8+16+8) );//
  guides.add( new Guide(left, zero.y+4+10+6+8+16+8+44, right, zero.y+4+10+6+8+16+8+44) );//
  guides.add( new Guide(left, zero.y+4+10+6+8+16+8+44+6, right, zero.y+4+10+6+8+16+8+44+6) );//
  guides.add( new Guide(left, zero.y+4+10+6+8+16+8+44+6+8, right, zero.y+4+10+6+8+16+8+44+6+8) );//
  guides.add( new Guide(left, zero.y+4+10+6+8+16+8+44+6+8+8, right, zero.y+4+10+6+8+16+8+44+6+8+8) );//
  guides.add( new Guide(left, bottom, right, bottom) );//bottom
  
  //verticales
  //left
  float v1 = zero.x-48-16-12-14-16-14-8-8-16-16;
  float v2 = v1-8-12-10-12-8-4-16-8;//v1-8-12-10-12-8-4-16;
  float v3 = v2-8-12-10-12-16-4-12;
  guides.add( new Guide(left, top, left, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10-16, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10-16, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12, top, v3-8-12-10-12-16-10-6-4-16-6-12-12, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12, top, v3-8-12-10-12-16-10-6-4-16-6-12, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6, top, v3-8-12-10-12-16-10-6-4-16-6, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16, top, v3-8-12-10-12-16-10-6-4-16, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4, top, v3-8-12-10-12-16-10-6-4, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10-6, top, v3-8-12-10-12-16-10-6, bottom) );
  guides.add( new Guide(v3-8-12-10-12-16-10, top, v3-8-12-10-12-16-10, bottom) );//<--pilar
  guides.add( new Guide(v3-8-12-10-12-8, top, v3-8-12-10-12-8, bottom) );
  guides.add( new Guide(v3-8-12-10-12, top, v3-8-12-10-12, bottom) );
  guides.add( new Guide(v3-8-12-10, top, v3-8-12-10, bottom) );
  guides.add( new Guide(v3-8-12, top, v3-8-12, bottom) );
  guides.add( new Guide(v3-8, top, v3-8, bottom) );  
  guides.add( new Guide(v3, top, v3, bottom) );
  guides.add( new Guide(v2-8-12-10-12-16-4, top, v2-8-12-10-12-16-4, bottom) );
  guides.add( new Guide(v2-8-12-10-12-8, top, v2-8-12-10-12-8, bottom) );
  guides.add( new Guide(v2-8-12-10-12, top, v2-8-12-10-12, bottom) );
  guides.add( new Guide(v2-8-12-10, top, v2-8-12-10, bottom) );
  guides.add( new Guide(v2-8-12, top, v2-8-12, bottom) );
  guides.add( new Guide(v2-8, top, v2-8, bottom) );
  guides.add( new Guide(v2, top, v2, bottom) );
  guides.add( new Guide(v1-8-12-10-12-8-4-16, top, v1-8-12-10-12-8-4-16, bottom) );
  guides.add( new Guide(v1-8-12-10-12-8-4, top, v1-8-12-10-12-8-4, bottom) );
  guides.add( new Guide(v1-8-12-10-12-8, top, v1-8-12-10-12-8, bottom) );
  guides.add( new Guide(v1-8-12-10-12, top, v1-8-12-10-12, bottom) );
  guides.add( new Guide(v1-8-12-10, top, v1-8-12-10, bottom) );
  guides.add( new Guide(v1-8-12, top, v1-8-12, bottom) );
  guides.add( new Guide(v1-8, top, v1-8, bottom) );
  guides.add( new Guide(v1, top, v1, bottom) );
  
  guides.add( new Guide(zero.x-48-16-12-14-16-14-8-8-16, top, zero.x-48-16-12-14-16-14-8-8-16, bottom) );
  guides.add( new Guide(zero.x-48-16-12-14-16-14-8-8, top, zero.x-48-16-12-14-16-14-8-8, bottom) );
  guides.add( new Guide(zero.x-48-16-12-14-16-14-8, top, zero.x-48-16-12-14-16-14-8, bottom) );
  guides.add( new Guide(zero.x-48-16-12-14-16-14, top, zero.x-48-16-12-14-16-14, bottom) );
  guides.add( new Guide(zero.x-48-16-12-14-16, top, zero.x-48-16-12-14-16, bottom) );
  guides.add( new Guide(zero.x-48-16-12-14, top, zero.x-48-16-12-14, bottom) );
  guides.add( new Guide(zero.x-48-16-12, top, zero.x-48-16-12, bottom) );
  guides.add( new Guide(zero.x-48-16, top, zero.x-48-16, bottom) );
  guides.add( new Guide(zero.x-48, top, zero.x-48, bottom) );
  
  
  guides.add( new Guide(zero.x, top, zero.x, bottom) );//center
  
  //right
  
  guides.add( new Guide(zero.x-48, top, zero.x-48, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16, top, zero.x-48-16, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12, top, zero.x-48-16-12, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12-14, top, zero.x-48-16-12-14, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12-14-16, top, zero.x-48-16-12-14-16, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12-14-16-14, top, zero.x-48-16-12-14-16-14, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12-14-16-14-8, top, zero.x-48-16-12-14-16-14-8, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12-14-16-14-8-8, top, zero.x-48-16-12-14-16-14-8-8, bottom, "flipH") );
  guides.add( new Guide(zero.x-48-16-12-14-16-14-8-8-16, top, zero.x-48-16-12-14-16-14-8-8-16, bottom, "flipH") );
  guides.add( new Guide(v1, top, v1, bottom, "flipH") );  
  guides.add( new Guide(v1-8, top, v1-8, bottom, "flipH") );
  guides.add( new Guide(v1-8-12, top, v1-8-12, bottom, "flipH") );
  guides.add( new Guide(v1-8-12-10, top, v1-8-12-10, bottom, "flipH") );
  guides.add( new Guide(v1-8-12-10-12, top, v1-8-12-10-12, bottom, "flipH") );
  guides.add( new Guide(v1-8-12-10-12-8, top, v1-8-12-10-12-8, bottom, "flipH") );
  guides.add( new Guide(v1-8-12-10-12-8-4, top, v1-8-12-10-12-8-4, bottom, "flipH") );
  guides.add( new Guide(v1-8-12-10-12-8-4-16, top, v1-8-12-10-12-8-4-16, bottom, "flipH") );
  guides.add( new Guide(v2, top, v2, bottom, "flipH") );  
  guides.add( new Guide(v2-8, top, v2-8, bottom, "flipH") );
  guides.add( new Guide(v2-8-12, top, v2-8-12, bottom, "flipH") );
  guides.add( new Guide(v2-8-12-10, top, v2-8-12-10, bottom, "flipH") );
  guides.add( new Guide(v2-8-12-10-12, top, v2-8-12-10-12, bottom, "flipH") );
  guides.add( new Guide(v2-8-12-10-12-8, top, v2-8-12-10-12-8, bottom, "flipH") );
  guides.add( new Guide(v2-8-12-10-12-16-4, top, v2-8-12-10-12-16-4, bottom, "flipH") );  
  guides.add( new Guide(v3, top, v3, bottom, "flipH") );
  guides.add( new Guide(v3-8, top, v3-8, bottom, "flipH") );
  guides.add( new Guide(v3-8-12, top, v3-8-12, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10, top, v3-8-12-10, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12, top, v3-8-12-10-12, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-8, top, v3-8-12-10-12-8, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10, top, v3-8-12-10-12-16-10, bottom, "flipH") );//<--pilar
  guides.add( new Guide(v3-8-12-10-12-16-10-6, top, v3-8-12-10-12-16-10-6, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4, top, v3-8-12-10-12-16-10-6-4, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16, top, v3-8-12-10-12-16-10-6-4-16, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6, top, v3-8-12-10-12-16-10-6-4-16-6, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12, top, v3-8-12-10-12-16-10-6-4-16-6-12, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12, top, v3-8-12-10-12-16-10-6-4-16-6-12-12, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10, bottom, "flipH") );
  guides.add( new Guide(v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10-16, top, v3-8-12-10-12-16-10-6-4-16-6-12-12-6-16-4-6-10-16, bottom, "flipH") );
  guides.add( new Guide(right, top, right, bottom) );
  
  classifyGuides();
}

void setupVideo(){
  video = new Movie[urls.length];
  videoAspectRatio = new float[urls.length];
  for(int i=0; i<video.length; i++){
    loadVideos(i);
  }
}

void setupGrid(){
  grid = new Grid(vguides.length-1, hguides.length-1);
}
void setupTextGrid(){
  textGrid = new TextGrid(vguides.length-1, hguides.length-1);
  font = loadFont("CoyarzunAtarinormal-100.vlw");
  
}
void setupRingGuides() {
  ringGuides = new ArrayList<RingGuide>();
  //float[] d = {96, 200};
  float[] r = {48, 1,
               48+20, 1,
               48+20+8, 1, 
               48+20+8+14, 1, 
               48+20+8+14+16, 1, 
               48+20+8+14+16+14, 1, 
               48+20+8+14+16+14+30, 1, 
               48+20+8+14+16+14+30+16, 1.035,
               48+20+8+14+16+14+30+16+8, 1.05, 
               48+20+8+14+16+14+30+16+8+28, 1.09, 
               48+20+8+14+16+14+30+16+8+28+8, 1.09, 
               48+20+8+14+16+14+30+16+8+28+8+12, 1.11, 
               48+20+8+14+16+14+30+16+8+28+8+12+44, 1.4, 
               48+20+8+14+16+14+30+16+8+28+8+12+44+16, 1.4, 
             };
  
  
  float top2 =  zero.y-2*height/3+16+48+8+8+10+10+8+10+12+4;
  float[] r2 = {6+48, 1.35,
               6+48+10, 1.35,
               48+20+8, 1.3, 
               48+20+8+14, 1.2, 
               48+20+8+14+16, 1.1, 
               48+20+8+14+16+14, 1.15, 
               48+20+8+14+16+14+30, 1, 
               48+20+8+14+16+14+30+16, 1.035,
               48+20+8+14+16+14+30+16+8, 1.05, 
               48+20+8+14+16+14+30+16+8+28, 1.09, 
               48+20+8+14+16+14+30+16+8+28+8, 1.09, 
               48+20+8+14+16+14+30+16+8+28+8+12, 1.11, 
               48+20+8+14+16+14+30+16+8+28+8+12+44, 1.4, 
               48+20+8+14+16+14+30+16+8+28+8+12+44+16, 1.4, 
             };
  
  float top3 = zero.y+4+10+30;
  float v1 = zero.x-48-16-12-14-16-14-8-8-16-16-25;
  float v2 = v1-8-12-10-12-8-4-16-8;//v1-8-12-10-12-8-4-16;
  float v3 = v2-8-12-10-12-16-4-12;
  
  float[] rv = {
                18, 1,
                24, 1,
                30, 1,
                36, 1
              };
              
  ringGuides.add( new RingGuide(zero.x, zero.y, r) );//center             
  ringGuides.add( new RingGuide(zero.x, top2, r2) );//up center

  ringGuides.add( new RingGuide(v1, top3, rv) );//v1  
  ringGuides.add( new RingGuide(v2, top3, rv) );//v2
  ringGuides.add( new RingGuide(v3, top3, rv) );//v3  
              
  ringGuides.add( new RingGuide(width-v1, top3, rv) );//v1  
  ringGuides.add( new RingGuide(width-v2, top3, rv) );//v2
  ringGuides.add( new RingGuide(width-v3, top3, rv) );//v3 
}






