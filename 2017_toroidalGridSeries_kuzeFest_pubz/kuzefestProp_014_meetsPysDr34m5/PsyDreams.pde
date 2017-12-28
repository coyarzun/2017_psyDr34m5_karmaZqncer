class PsyDreams {
  PGraphics  buffer;
  PImage     cover;
  PShader    shader;

  Dream[] dreams;
  ArrayList dreamHistory;
  int     cdream, pdream;

  PsyDreams() {
    buffer      = createGraphics(800, 400, P3D);//800, 400, P3D);//800, 400, P3D);
    cover       = loadImage("psyd/psyLive01_cover.png");
    shader      = loadShader("psyd/psyDrShader_002.glsl");
  
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
  void update(){
    if (environment.doProcess)shaderStuff();
    else resetShader();
  }
  void draw() {//PGraphics pg
  
    update();
    buffer.beginDraw();
    dreams[cdream].draw(buffer);
    buffer.endDraw();
    buffer.updatePixels();
    /*buffer.beginDraw();
    buffer.tint(255, environment.coverOpacity);
    buffer.image(cover, 0, 0, buffer.width, buffer.height);
    buffer.endDraw();
    buffer.updatePixels();*/
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
  
  void shaderStuff() {
    shader      = loadShader("psyd/psyDrShader_002.glsl");
    shader(shader);
    shader.set("resolution", float(buffer.width), float(buffer.height));
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
}
