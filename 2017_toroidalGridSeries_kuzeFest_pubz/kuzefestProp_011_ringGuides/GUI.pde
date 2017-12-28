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
  if(key=='1')doFX1=!doFX1;
  if(key=='2')doFX2=!doFX2;
  
  if(key=='r')doRandomAll=!doRandomAll;
  if(key=='e')resetDoes();
  if(key=='t')restoreDoes();
  
  if(key=='j')doRingGuides=!doRingGuides;
}
