
void classifyGuides() {

  int h=0, v=0;
  for (Guide g : guides) {
    if (g.from.x == g.to.x) v++;//vguides.add(g);
    if (g.from.y == g.to.y) h++;//hguides.add(g);
  }
  sortGuides();

  hguides = new Guide[h];
  vguides = new Guide[v];

  int ix=0, ii=0;
  for (Guide g : guides) {
    if (g.from.x == g.to.x) { 
      vguides[ix]  = g; 
      ix++;
    }
    if (g.from.y == g.to.y) { 
      hguides[ii] = g; 
      ii++;
    }

    //println(vguides.size()+" "+hguides.size());
  }
  
  for(int i=0; i<vguides.length; i++){println(vguides[i].from.x);}
  for(int i=0; i<hguides.length; i++){println(hguides[i].from.y);}
}
void sortGuides() {
}
void loadVideos(int i){
  video[i]    = new Movie(this, urls[i]);
  video[i].loop();
}
void movieEvent(Movie m) {
  m.read();
}

String[]  urls = {
 "/Users/coyarzun/Documents/Processing/2017_unnamed/seashore_001/data/Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4"
  };
  
  
  

boolean[] does = new boolean[12];

void randomAll(){
  does[0]  = doGuides;
  does[1]  = doGrid; 
  does[2]  = doMuseum;
  does[3]  = doMask;
  does[4]  = doBoxes;
  does[5]  = doLights;
  does[6]  = doPadding;
  does[7]  = doFlipH;
  does[8]  = doFlipV;
  does[9]  = doFX1;
  does[10] = doFX2;
  does[11] = doRingGuides;
  
  doGuides =random(100)>50;
  doGrid =random(100)>50;; 
  doMuseum =random(100)>50;;
  //doMask = random(100)>50;;
  doBoxes =random(100)>50;;
  doLights=random(100)>50;
  doPadding=random(100)>50;
  doFlipH=random(100)>50;
  doFlipV=random(100)>50;
  doFX1=random(100)>50;
  doFX2=random(100)>50;
  doRingGuides=random(100)>50;
}
void resetDoes(){
  doGuides = true;
  doGrid   = !true; 
  doMuseum = true;
  doMask   = true;
  doBoxes  = false;
  doLights = false;
  doPadding= false;
  doFlipH  = false;
  doFlipV  = false;
  doFX1    = false;
  doFX2    = false;
  doRandomAll = false;
  doRingGuides = true;
}
void restoreDoes(){
  doGuides = does[0];
  doGrid   = does[1]; 
  doMuseum = does[2];
  doMask   = does[3];
  doBoxes  = does[4];
  doLights = does[5];
  doPadding = does[6];
  doFlipH  = does[7];
  doFlipV  = does[8]; 
  doFX1    = does[9];
  doFX2    = does[10];
  doRingGuides = does[11];
  doRandomAll = false;
}




void gridFXRoutine(){
  gridFxBuffer.beginDraw();
  gridFxBuffer.background(0,0);
  gridFxBuffer.colorMode(HSB);
  gridFxBuffer.noFill();
  
  gridFxBuffer.stroke(guideFXColor);
  gridFxBuffer.strokeWeight(random(1,2));
  int wichRing = int(random(ringGuides.size()));
  int wichRadius = int(random(ringGuides.get(wichRing).radius.length));
  float cx = ringGuides.get(wichRing).center.x;
  float cy = ringGuides.get(wichRing).center.y;
  float cw = ringGuides.get(wichRing).diameters[wichRadius]*ringGuides.get(wichRing).aspectRatio[wichRadius];
  float ch = ringGuides.get(wichRing).diameters[wichRadius];
  gridFxBuffer.ellipse(cx,cy,cw,ch);
  
  gridFxBuffer.stroke(guideFXColor);
  gridFxBuffer.strokeWeight(random(1,2));
  int wichH = int(random(hguides.length));
  int wichV = int(random(vguides.length));
  float cx1 = hguides[wichH].from.x;
  float cy1 = hguides[wichH].from.y;
  float cx2 = hguides[wichH].to.x;
  float cy2 = hguides[wichH].to.y;
  float cx12 = vguides[wichV].from.x;
  float cy12 = vguides[wichV].from.y;
  float cx22 = vguides[wichV].to.x;
  float cy22 = vguides[wichV].to.y;
  gridFxBuffer.line(cx1,cy1,cx2,cy2);
  gridFxBuffer.line(cx12,cy12,cx22,cy22);
  
  gridFxBuffer.endDraw();
}


void shaderStuff() {
    //shader      = loadShader("psyd/psyDrShader_002.glsl");
    //buffer.
    shader(shader);
    shader.set("resolution", float(width), float(height));//psydreams.buffer.
    shader.set("time", frameCount*0.1*.3);  //500.0
    //shader.set("mouse", float(mouseX), float(mouseY));
    shader.set("leftGlitch", environment.leftGlitch);
    shader.set("rightGlitch", environment.rightGlitch);
    shader.set("interlaceF", environment.interlaceF);
    shader.set("hueCyclingF", environment.hueCyclingF);
    shader.set("hShearAmp", environment.hSideShearAmp);
    shader.set("vShearAmp", environment.vSideShearAmp);
    shader.set("micLevel", abs(in.left.get(0)));
    shader.set("doH", float(int(environment.doH)));
}
boolean recording;
void switchRecording(){
  if(recording){
    stopRecording();
  }else{
    startRecording();
  }
}
int maxframes = 15*30, cframe, take = 0;
String recName;

void startRecording(){
  recording = true;
  cframe = 0;
  take++;
  recName = "_render/animationTest/take_"+nf(take,3)+"/";
}
void stopRecording(){
  recording = false;
}
void recordingRoutine(){
  String filename = recName+nf(cframe,3)+".png";
  saveFrame(filename);
  println(filename+" "+cframe/30.0+" secs");
  cframe++;
  if(cframe>=maxframes)stopRecording();
}



