
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
  //"/Users/coyarzun/Documents/Processing/2017_unnamed/seashore_001/data/Breaking Waves - 1 Hour of Beautiful Pacific Ocean Waves in .mp4",
  "/Users/coyarzun/ima/recreative/porn/Hot blonde humps pillow - Pornhub.com.mp4"
  };
