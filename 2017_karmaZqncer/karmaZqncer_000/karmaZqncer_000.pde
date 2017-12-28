import promidi.*;

MidiIO midiIO;
Sequencer sequencer;

MidiOut drumsOut, bassOut, bassOut2, kboardOut;
Track   drumsTrack, bassTrack, bassTrack2, kboardTrack;

Song song, song2;

int quantization = 32;
int tempo        = 120;

void setup(){
  setupOuts();
  muteAll();
  doSequence();
  setupSong();
}
void setupOuts(){
  sequencer = new Sequencer();
  midiIO    = MidiIO.getInstance(this);
  midiIO.printDevices();
  //midiIO.closeOutput(1);

  midiIO.openInput(1, 0);//port, channel

  drumsOut  = midiIO.getMidiOut(9, 2);//(channel, port)
  bassOut   = midiIO.getMidiOut(1, 2);//(channel, port)
  bassOut2  = midiIO.getMidiOut(1, 3);//(channel, port)
  kboardOut = midiIO.getMidiOut(0, 2);//(channel, port)

  drumsTrack   = new Track("drums", drumsOut);
  bassTrack    = new Track("bass", bassOut);
  bassTrack2   = new Track("bass", bassOut);
  kboardTrack  = new Track("kboard", kboardOut);

  drumsTrack.setQuantization(Q._1_32);
  bassTrack.setQuantization(Q._1_32);
  bassTrack2.setQuantization(Q._1_32);
  kboardTrack.setQuantization(Q._1_32);
}
void setupSong(){  
  song = new Song("test", tempo);
  song.addTrack(drumsTrack);
  song.addTrack(bassTrack);
  song.addTrack(bassTrack2);
  song.addTrack(kboardTrack);

  sequencer.setSong(song);
  sequencer.setLoopStartPoint(0);
  sequencer.setLoopEndPoint(512*1);
  sequencer.setLoopCount(-1);
}
void doSequence(){
  for(int i=0; i<16; i++){
    if(i%4==0){
      drumsTrack.addEvent(new Note(36, 127,1), i*2);
    }
    drumsTrack.addEvent(new Note(42, 100,1), i*2);
    if(i%8==4)drumsTrack.addEvent(new Note(38, 100,1), i*2);
    if(i%4==0 || i%3==0){
      bassTrack.addEvent(new Note(36, 100,1), i*2);
    }
  }
}
void draw(){
}
void playPause(){
  
  if (!sequencer.isRunning()) sequencer.start();
  else {
    sequencer.stop();
    muteAll();
  }
}
void muteAll(){
  for(int i=0; i<127; i++){
      drumsOut.sendNote(new Note(i, 0, 0));
      bassOut.sendNote(new Note(i, 0, 0));
      bassOut2.sendNote(new Note(i, 0, 0));
      kboardOut.sendNote(new Note(i, 0, 0));
  }
}
void keyPressed(){
  if(keyCode==32) playPause();
  if(key=='m')    muteAll();
  
}











void noteOn(
  Note note,
  int deviceNumber,
  int midiChannel
){ 
  println("Note On :"+note.getPitch()+" \t"+deviceNumber+" \t"+midiChannel);
}

void noteOff(
  Note note,
  int deviceNumber,
  int midiChannel
){
  println("Note Off :"+note.getPitch()+" \t"+deviceNumber+" \t"+midiChannel);
}





void doPattern00(){
  for(int i=0; i<16; i++){
    if(i==0 || i==9){
      drumsTrack.addEvent(new Note(36, 127,1), i*2);
    }
    if(i==3 || i==8){
      drumsTrack.addEvent(new Note(36, 96,1), i*2);
    }
    if(i==11){
      drumsTrack.addEvent(new Note(36, 64,1), i*2);
    }
    if(i==4 || i==12){
      drumsTrack.addEvent(new Note(38, 127,1), i*2);
    }
    if(i==15){
      drumsTrack.addEvent(new Note(38, 96,1), i*2);
    }
    if(i==7){
      drumsTrack.addEvent(new Note(38, 64,1), i*2);
      drumsTrack.addEvent(new Note(38, 64,1), i*2+1);
    }
    //if(i%8==4)drumsTrack.addEvent(new Note(38, 100,1), i*2);
    if(i==0 || i==2 || i==6 || i==10 || i==14){
      drumsTrack.addEvent(new Note(42, int(random(96,127)),1), i*2);
    }
    if(i==2 || i==3 || i==6 || i==10 || i==13 || i==14){
      drumsTrack.addEvent(new Note(53, 100,1), i*2);
    }
    //drumsTrack.addEvent(new Note(38, 100,1), (i/4)+i%5);
    //drumsTrack.addEvent(new Note(39, 80,1), i+1/2);
    if(i%2==0 ){//B10
      bassTrack.addEvent(new Note(40-12*0, int(random(96,127)),1), i*1);
      bassTrack.addEvent(new Note(40-12*0, 0,1), i*1+1);
    }
    if(i%3==0 ){//A76
      kboardTrack.addEvent(new Note(40+12+int(random(4))*12, 100,1), i*2);
      kboardTrack.addEvent(new Note(40+12+int(random(1))*12, 80,1), i*2+2);
    }
  }
}

