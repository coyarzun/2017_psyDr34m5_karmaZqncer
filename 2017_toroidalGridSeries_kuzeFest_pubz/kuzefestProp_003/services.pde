
void classifyGuides() {

  int h=0, v=0;
  for (Guide g : guides) {
    if (g.from.x == g.to.x) v++;//vguides.add(g);
    if (g.from.y == g.to.y) h++;//hguides.add(g);
  }
  sortGuides();

  hguides = new Guide[h];
  vguides = new Guide[v];

  int i=0, ii=0;
  for (Guide g : guides) {
    if (g.from.x == g.to.x) { 
      vguides[i]  = g; 
      i++;
    }
    if (g.from.y == g.to.y) { 
      hguides[ii] = g; 
      ii++;
    }

    //println(vguides.size()+" "+hguides.size());
  }
}
void sortGuides() {
}

