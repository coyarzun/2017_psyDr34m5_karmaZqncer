
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

