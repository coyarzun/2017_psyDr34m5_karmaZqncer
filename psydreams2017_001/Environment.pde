class Environment {
  boolean doProcess, doH;
  float   coverOpacity;
  float   leftGlitch, rightGlitch;
  float   hueCyclingF;
  float   interlaceF;
  float   hSideShearAmp, vSideShearAmp;

  int     bgMode;

  int     modelCols, modelRows;
  float   modelR1, modelR2;
  float   scaleModel, rotateXSpeed, rotateXSpeedMultiplicator, rotateYSpeedMultiplicator;
  float   audioScaleFactor;

  Environment() {
    init();
  }
  void init() {
    doProcess                  = false;
    doH                        = false;
    coverOpacity               = 255.0;
    leftGlitch                 = 0;//-0.8;
    rightGlitch                = 0;//-leftGlitch;
    hueCyclingF                = 1.0;
    hSideShearAmp              = 1.0;
    vSideShearAmp              = 1.0;

    bgMode                     = 1;
    interlaceF                 = 1.0;

    modelCols                  = 36;
    modelRows                  = 18;
    modelR1                    = 200;
    modelR2                    = 500;

    scaleModel                 = 1.0;
    rotateXSpeed               = 0.0;
    rotateXSpeedMultiplicator  = 0.1;
    rotateYSpeedMultiplicator  = 0.1;
    audioScaleFactor           = 1.0;
  }

  void setDo(float v)    {      doProcess         = v!=0;  }
  void setDoH(float v)   {      doH               = v!=0;  }
  void setCop(float v)   {      coverOpacity      = map(v, 0.0, 1.0, 0, 255);  }
  void setLG(float v)    {      leftGlitch        = map(v, 0.0, 1.0, -1, 1);  }
  void setRG(float v)    {      rightGlitch       = map(v, 0.0, 1.0, -1, 1);  }
  void setHC(float v)    {      hueCyclingF       = map(v, 0.0, 1.0, 0, 1);  }
  void setInter(float v) {      interlaceF        = map(v, 0.0, 1.0, 0.0, 2.0);  }
  void setHSA(float v)   {      hSideShearAmp     = map(v, 0.0, 1.0, 0, 1);  }
  void setVSA(float v)   {      vSideShearAmp     = map(v, 0.0, 1.0, 0, 1);  }
  void setBgm(float v)   {      bgMode            = (int)map(v, 0.0, 1.0, 0, 16);  }
  void setCols(float v)  {      modelCols         = (int)map(v, 0.0, 1.0, 1, 36);  }
  void setRoWs(float v)  {      modelRows         = (int)map(v, 0.0, 1.0, 1, 18);  }
  void setR1(float v)    {      modelR1           = map(v, 0.0, 1.0, 0, 800);  }
  void setR2(float v)    {      modelR2           = map(v, 0.0, 1.0, 0, 800);  }
  void setSCL(float v)   {      scaleModel        = map(v, 0.0, 1.0, 1.0, 4.0);  }
  void setRXS(float v)   {      rotateXSpeed      = map(v, 0.0, 1.0, 0.0, PI/3.0);  }
  void setRXSM(float v)  {      rotateXSpeedMultiplicator = map(v, 0.0, 1.0, 0, 1);  }
  void setRYSM(float v)  {      rotateYSpeedMultiplicator = map(v, 0.0, 1.0, 0, 1);  }
  void setASF(float v)   {      audioScaleFactor          = map(v, 0.0, 1.0, 0, 1);  }
}
