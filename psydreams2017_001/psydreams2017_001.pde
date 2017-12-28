import ddf.minim.*;
import oscP5.*;
import netP5.*;

Minim       minim;
AudioInput  in;
OscP5 oscP5;
NetAddress myRemoteLocation;

Environment environment;
PsyDreams   psydreams;

PGraphics  buffer;
PImage     cover;
PShader    shader;

boolean    fs = !true;

void setup() {
  if (fs)size(1280,720,P3D);//displayWidth, displayHeight, P3D);
  //else  size(768, 620, P3D);
  else  size(800, 600, P3D);
  colorMode(HSB);
  textureWrap(REPEAT);

  minim = new Minim(this);
  in = minim.getLineIn();

  buffer      = createGraphics(800, 400, P3D);//800, 400, P3D);//800, 400, P3D);
  cover       = loadImage("../_data/psyLive01_cover.png");
  shader      = loadShader("../_data/psyDrShader_002.glsl");
  environment = new Environment();
  psydreams   = new PsyDreams();

  oscSetup();
}

void draw() {
  background(0);
  noCursor();
  drawBuffer();
  if (environment.doProcess)shaderStuff();
  else resetShader();
  image(buffer, 0, (height-width/2)/2, width, width/2);//0,width,height);//
}






