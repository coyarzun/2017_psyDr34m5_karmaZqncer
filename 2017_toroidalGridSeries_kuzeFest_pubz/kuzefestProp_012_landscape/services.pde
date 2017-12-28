
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
 "/Users/coyarzun/Documents/Processing/2017_unnamed/seashore_001/data/Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4",
 //"/Users/coyarzun/ima/recreative/porn/Hot blonde humps pillow - Pornhub.com.mp4"
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
  doGrid   = true; 
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






