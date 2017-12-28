boolean doGuides, doGrid, doMuseum, doMask, doBoxes;
boolean doLights, doPadding, doFlipH, doFlipV;
boolean doFX1, doFX2;
boolean doRandomAll;
boolean doRingGuides;

void keyPressed(){
  
  if(key=='g')doGuides=!doGuides;
  if(key=='k')doGrid=!doGrid;
  if(key=='m')doMuseum=!doMuseum;
  if(key=='n')doMask=!doMask;
  if(key=='b')doBoxes=!doBoxes;
  if(key=='l')doLights=!doLights;
  if(key=='p')doPadding=!doPadding;
  if(key=='h')doFlipH=!doFlipH;
  if(key=='v')doFlipV=!doFlipV;
  if(key=='d')doFX1=!doFX1;
  if(key=='f')doFX2=!doFX2;
  
  if(key=='q')doRandomAll=!doRandomAll;
  if(key=='w')resetDoes();
  if(key=='e')restoreDoes();
  
  if(key=='j')doRingGuides=!doRingGuides;
  
  if(key=='1')psydreams.goDream(0);
  if(key=='2')psydreams.goDream(1);
  if(key=='3')psydreams.goDream(2);
  if(key=='4')psydreams.goDream(3);
  if(key=='5')psydreams.goDream(4);
  if(key=='6')psydreams.goDream(5);
  if(key=='7')psydreams.goDream(6);
  
  //rec!!
  if(key=='r')switchRecording();
}
