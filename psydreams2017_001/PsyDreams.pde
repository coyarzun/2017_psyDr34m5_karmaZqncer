class PsyDreams {
  Dream[] dreams;
  ArrayList dreamHistory;
  int     cdream, pdream;

  PsyDreams() {
    init();
  }
  void init() {
    dreams = new Dream[7];
    
    dreams[0] = new Dust3();
    dreams[1] = new Dust4();
    dreams[2] = new Dust7();
    dreams[3] = new Dust8A();
    dreams[4] = new Dust8D();
    dreams[5] = new Toroid();
    dreams[6] = new Shockwaves8e();
    
    dreamHistory = new ArrayList();
    cdream = 0;
  }
  void draw(PGraphics pg) {
    dreams[cdream].draw(pg);
  }
  void goDream0(float v){    goDream(0);  }
  void goDream1(float v){    goDream(1);  }
  void goDream2(float v){    goDream(2);  }
  void goDream3(float v){    goDream(3);  }
  void goDream4(float v){    goDream(4);  }
  void goDream5(float v){    goDream(5);  }
  void goDream6(float v){    goDream(6);  }
  
  void goDream(int i) {
    i+=dreams.length;
    i%=dreams.length;
    pdream = cdream; 
    dreamHistory.add(pdream);
    cdream = i;
  }
  void nextDream() {
    pdream = cdream; 
    dreamHistory.add(pdream);
    cdream++;
    cdream%=dreams.length;
  }
  void prevDream() {
    pdream = cdream; 
    dreamHistory.add(pdream);
    cdream--;
    cdream+=dreams.length;
    cdream%=dreams.length;
  }
}
