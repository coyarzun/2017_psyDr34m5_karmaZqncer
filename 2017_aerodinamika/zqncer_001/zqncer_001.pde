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
  song = new Song("test", 120);
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
