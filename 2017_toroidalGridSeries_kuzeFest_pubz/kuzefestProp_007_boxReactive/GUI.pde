boolean doGuides = true, doGrid = true, doMuseum = true, doMask = true, doVideo = true;
boolean doLights, doPadding, doFlipH, doFlipV;

void keyPressed(){
  if(key=='g')doGuides=!doGuides;
  if(key=='k')doGrid=!doGrid;
  if(key=='m')doMuseum=!doMuseum;
  if(key=='n')doMask=!doMask;
  if(key=='v')doVideo=!doVideo;
  if(key=='l')doLights=!doLights;
  if(key=='p')doPadding=!doPadding;
  if(key=='h')doFlipH=!doFlipH;
  if(key=='v')doFlipV=!doFlipV;
}
