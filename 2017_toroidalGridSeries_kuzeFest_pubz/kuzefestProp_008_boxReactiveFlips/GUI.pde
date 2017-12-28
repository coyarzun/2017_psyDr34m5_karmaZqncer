boolean doGuides = true, doGrid = true, doMuseum = true, doMask = true, doBoxes = true;
boolean doLights, doPadding, doFlipH, doFlipV;
boolean doFX1, doFX2;

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
}
