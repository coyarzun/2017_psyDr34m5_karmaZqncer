import ddf.minim.*;
import ddf.minim.analysis.*;

Minim        minim;
AudioPlayer  player;
BeatDetect   beat;
BeatListener bl;


int         tFrameRate = 24, tMins = 29, tSecs = 26+1;
int         cFrame, tFrames;
PImage      buffer, beatBuffer;
String      filename;

float kickSize, snareSize, hatSize;

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


void setup(){
  filename = "/Users/coyarzun/ima/artProjects/2016_psyDreams/";
  filename += "20170110_psyDr34m5_master.mp3";
  
  tFrames  = tMins*60+tSecs;
  tFrames *= tFrameRate;
  cFrame   = 0;//tFrames-100;
  
  size(512, 512,P3D);
  
  frameRate(tFrameRate);
  minim = new Minim(this);
  player = minim.loadFile(filename);
  
  buffer     = createImage(player.bufferSize()*2, tFrames, RGB);
  beatBuffer = createImage(1, tFrames, RGB);
  //println(buffer.width+"x"+buffer.height);
  
  
  beat = new BeatDetect(player.bufferSize(), player.sampleRate());

  beat.setSensitivity(150);  
  kickSize = snareSize = hatSize = 0;
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, player);  
  player.play();
}

void draw(){
  doBuffer();
  doBeatDetect();
  image(buffer    , 0      , cFrame<height?0:-cFrame+height,  width/2, buffer.height);
  image(beatBuffer, width/2, cFrame<height?0:-cFrame+height,  width/2  , beatBuffer.height);
  cFrame++;
  println(nf(frameRate,2,2)+"\t"+cFrame+" / "+tFrames);
  if(cFrame>=tFrames){
    doClose();
  }
}
void stop(){
  doClose();
  super.stop();
}
void doClose() {
    println("done");
    buffer.save(savePath("")+"20170110_psyDr34m5_master_amp.png");//
    beatBuffer.save(savePath("")+"20170110_psyDr34m5_master_beat.png");//
    noLoop(); 
}
void doBuffer() {
  buffer.loadPixels();
  for (int i = 0; i <buffer.width/2; i++)
  {
    buffer.set(i,                cFrame, color(player.left.get(i)*255));
    buffer.set(i+buffer.width/2, cFrame, color(player.right.get(i)*255));
  }
  buffer.updatePixels();
}
void doBeatDetect(){
  if ( beat.isKick()  ) kickSize  = 255;
  if ( beat.isSnare() ) snareSize = 255;
  if ( beat.isHat()   ) hatSize   = 255;
  
  kickSize  = constrain(kickSize  * 0.96, 0, 255);
  snareSize = constrain(snareSize * 0.96, 0, 255);
  hatSize   = constrain(hatSize   * 0.96, 0, 255);
  
  beatBuffer.loadPixels();
  //
  color c = color(kickSize,  snareSize,  hatSize);//0,                cFrame,
  beatBuffer.set(0, cFrame, c);
  beatBuffer.updatePixels();
}
