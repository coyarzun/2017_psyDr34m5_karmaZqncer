class Toroid extends Dream {
  int rows, cols;
  float radioMayor, radioMenor;

  Toroid() {
  }
  void updateValues() {
    cols = environment.modelCols;
    rows = environment.modelRows;
    radioMayor  = environment.modelR1;
    radioMenor  = environment.modelR2;
  }
  void draw(PGraphics pg) {
    pg.background(240, 255, 255);
    pg.colorMode(HSB);
    pg.translate(pg.width/2.0, pg.height/2.0);
    updateValues();
    pg.pushMatrix();
    //pg.translate(pg.width/2, 1*pg.height/4+28);
    pg.scale(environment.scaleModel);
    pg.rotateX(environment.rotateXSpeed+frameCount*environment.rotateXSpeedMultiplicator);
    pg.rotateY(radians(frameCount*environment.rotateYSpeedMultiplicator));
    float da = TWO_PI/cols;
    float db = TWO_PI/rows;
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pg.pushMatrix();
        pg.rotateY(i*da);
        pg.translate(radioMayor, 0, 0);
        float dx = radioMenor*cos(4*j*db);
        float dy = radioMenor*sin(j*db);
        pg.rotateZ(j*db);
        pg.rotateZ(map((i)%cols, 0, cols, 0, TWO_PI));
        pg.translate(radioMenor, 0, 0);
        float cellsize = 20*(1+in.left.get((i+j*cols)%1024)*4*environment.audioScaleFactor*2);//

        pg.fill(   ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 255:0);
        pg.stroke(0);
        pg.box(cellsize);
        pg.box(cellsize*4, cellsize/5, cellsize/5);
        pg.popMatrix();
      }
    }
    pg.popMatrix();
  }
}
//////////////////////////////////////////////////////////
class Dust3 extends Dream {

  int       rows, cols;
  float     radioMayor, radioMenor;
  PShape s; 

  Dust3() {
    cols = 36*2*5;
    rows = 18*2*5;
    radioMayor  = 100;
    radioMenor  = 90;
    s  = createShape();
    drawToroid(s);
  }
  void drawToroid(PShape s) {
    float da = TWO_PI/cols;
    float db = TWO_PI/rows;
    s.beginShape(POINTS);
    s.colorMode(HSB);
    s.stroke(240, 255, 255);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pushMatrix();
        rotateY(i*da);
        translate(radioMayor, 0, 0);
        rotateZ(j*db);
        rotateZ(map((i)%cols, 0, cols, 0, TWO_PI));
        float radioMenorsss = radioMenor*cos(0.5*i*da);
        //radioMenorsss += random(100);
        translate(radioMenorsss, 0, 0);
        float cellsize = 20;
        float x = modelX(0, 0, 0);
        float y = modelY(0, 0, 0);
        float z = modelZ(0, 0, 0);
        popMatrix();
        //s.stroke( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
        s.vertex(x, y, z);
      }
    }
    s.endShape(CLOSE);
  }

  void draw(PGraphics pg) {
    //drawToroid(s);
    pg.colorMode(HSB);
    pg.background(0);
    pg.pushMatrix();
    pg.translate(pg.width/2, 1*pg.height/4+28);
    pg.rotateY(PI/2);
    pg.rotateZ(-PI/2);
    pg.rotateX(radians(frameCount*1*1));
    pg.scale(4*(1+4*environment.audioScaleFactor)*in.left.get(0));

    pg.shape(s, 0, 0);
    pg.popMatrix();
  }
}
//////////////////////////////////////////////////////////
class Dust4 extends Dream {

  int       rows, cols;
  float     radioMayor, radioMenor;
  PShape[] s; 
  Dust4() {

    cols = 36*2*2;
    rows = 18*2*2;
    radioMayor  = 100;
    radioMenor  = 90;

    s = new PShape[10];
    for (int i=0; i<s.length; i++) {
      s[i]  = createShape();
      drawToroid(s[i], i);
    }
  }
  void drawToroid(PShape s, float maxo) {
    float da = TWO_PI/cols;
    float db = TWO_PI/rows;
    s.beginShape(POINTS);
    s.colorMode(HSB);
    s.stroke(240, 255, 255);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pushMatrix();
        rotateY(i*da);
        translate(radioMayor, 0, 0);
        rotateZ(j*db);
        rotateZ(map((i)%cols, 0, cols, 0, TWO_PI));
        float radioMenorsss = radioMenor*cos(0.5*i*da);
        radioMenorsss += random(maxo*maxo);
        translate(radioMenorsss, 0, 0);
        float cellsize = 20;
        float x = modelX(0, 0, 0);
        float y = modelY(0, 0, 0);
        float z = modelZ(0, 0, 0);
        popMatrix();
        //s.stroke( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
        s.vertex(x, y, z);
      }
    }
    s.endShape(CLOSE);
  }

  void draw(PGraphics pg) {
    //drawToroid(s);
    pg.colorMode(HSB);
    pg.background(0);
    pg.pushMatrix();
    pg.translate(pg.width/2, 1*pg.height/4+28);
    pg.rotateY(PI/2);
    pg.rotateZ(-PI/2);
    pg.rotateX(radians(frameCount*1*1));
    pg.scale(1*(1+4*environment.audioScaleFactor)*in.left.get(0));

    pg.shape(s[int(random(s.length))], 0, 0);
    pg.popMatrix();
  }
}
//////////////////////////////////////////////////////////
class Dust7 extends Dream {

  int       rows, cols;
  float     radioMayor, radioMenor;

  PShape[] s; 
  Dust7() {

    cols = 36*2*3;
    rows = 18*2*3;
    radioMayor  = 100;
    radioMenor  = 90;

    s = new PShape[10];
    for (int i=0; i<s.length; i++) {
      s[i]  = createShape();
      drawToroid(s[i], i);
    }
  }
  void drawToroid(PShape s, float maxo) {
    float da = TWO_PI/cols;
    float db = TWO_PI/rows;
    s.beginShape(LINES);
    s.colorMode(HSB);
    s.stroke(240, 255, 255);
    s.strokeWeight(1.0);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pushMatrix();
        rotateY(i*da);
        translate(radioMayor, 0, 0);
        rotateZ(j*db);
        rotateZ(map((i)%cols, 0, cols, 0, TWO_PI));
        float radioMenorsss = radioMenor*cos(0.5*i*da);
        radioMenorsss += random(maxo*maxo);//+random(-maxo/3,maxo/3);
        translate(radioMenorsss, 0, 0);
        float cellsize = 20;
        float x = modelX(0, 0, 0);
        float y = modelY(0, 0, 0);
        float z =  modelZ(0, 0, 0);
        popMatrix();
        //s.stroke( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
        s.vertex(x, y, z);
      }
    }
    s.endShape(CLOSE);
  }

  void draw(PGraphics pg) {
    //drawToroid(s);
    pg.colorMode(HSB);
    pg.background(0);
    pg.pushMatrix();
    pg.translate(pg.width/2, 1*pg.height/4+28);
    pg.rotateY(PI/2);
    pg.rotateZ(-PI/2);
    pg.rotateX(radians(frameCount*1*1));
    pg.scale(1*(1+4*environment.audioScaleFactor)*in.left.get(0));
    pg.blendMode(ADD);
    pg.shape(s[int(random(s.length))], 0, 0);
    pg.popMatrix();
  }
}
//////////////////////////////////////////////////////////
class Dust8A extends Dream {

  int       rows, cols;
  float     radioMayor, radioMenor;
  PShape[] s;

  Dust8A() {

    cols = 36*2*3;
    rows = 18*2*3;
    radioMayor  = 100;
    radioMenor  = 90;

    s = new PShape[10];
    for (int i=0; i<s.length; i++) {
      s[i]  = createShape();
      drawToroid(s[i], i);
    }
  }
  void drawToroid(PShape s, float maxo) {
    float da = TWO_PI/cols;
    float db = TWO_PI/rows;
    s.beginShape(LINES);
    s.colorMode(HSB);

    s.strokeWeight(1.0);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pushMatrix();
        rotateY(i*da);
        translate(radioMayor, 0, 0);
        rotateZ(j*db);
        rotateZ(map((i)%cols, 0, cols, 0, TWO_PI));
        float radioMenorsss = radioMenor*cos(0.5*i*da);
        radioMenorsss += random(maxo*maxo);//+random(-maxo/3,maxo/3);
        translate(radioMenorsss, 0, 0);
        float cellsize = 20;
        float x = modelX(0, 0, 0);
        float y = modelY(0, 0, 0);
        float z = modelZ(0, 0, 0);
        popMatrix();
        //s.stroke( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
        s.stroke((i*cols+j)%256, 255, 255);
        s.vertex(x, y, z);
      }
    }
    s.endShape(CLOSE);
  }
  void draw(PGraphics pg) {
    //drawToroid(s);
    pg.colorMode(HSB);
    pg.background(0);
    pg.pushMatrix();
    pg.translate(pg.width/2, 1*pg.height/4+28);
    pg.rotateY(PI/2);
    pg.rotateZ(-PI/2);
    pg.rotateX(radians(frameCount*1*1));
    //scale(2);
    pg.scale(1*(1+4*environment.audioScaleFactor)*in.left.get(0));
    pg.blendMode(ADD);
    pg.shape(s[int(random(s.length))], 0, 0);
    pg.popMatrix();
  }
}
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
class Dust8D extends Dream {
  int       rows, cols;
  float     radioMayor, radioMenor;
  PShape[] s; 

  Dust8D() {
    cols = 36*2*2;
    rows = 18*2*2;
    radioMayor  = 100;
    radioMenor  = 90;
    s = new PShape[10];
    for (int i=0; i<s.length; i++) {
      s[i]  = createShape();
      drawToroid(s[i], 2*i);
    }
  }
  void drawToroid(PShape s, float maxo) {
    float da = TWO_PI/cols;
    float db = TWO_PI/rows;
    s.beginShape(TRIANGLES);
    s.colorMode(HSB);

    s.strokeWeight(1.0);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        pushMatrix();
        rotateY(i*da);
        translate(radioMayor, 0, 0);
        rotateZ(j*db);
        rotateZ(map((i)%cols, 0, cols, 0, TWO_PI));
        float radioMenorsss = radioMenor*cos(0.5*i*da);
        radioMenorsss += random(maxo*maxo);//+random(-maxo/3,maxo/3);
        translate(radioMenorsss, 0, 0);
        float cellsize = 20;
        float x = modelX(0, 0, 0);
        float y = modelY(0, 0, 0);
        float z = modelZ(0, 0, 0);
        popMatrix();
        //s.stroke( ((i%2==0&&j%2!=0)||(i%2!=0&&j%2==0))? 0:255);
        s.fill((i*j)%256, 255, 255);
        s.noStroke();
        s.vertex(x, y, z);
      }
    }
    s.endShape(CLOSE);
  }

  void draw(PGraphics pg) {
    pg.colorMode(HSB);
    pg.background(0);
    pg.pushMatrix();
    pg.translate(pg.width/2, 1*pg.height/4+28);
    pg.rotateY(PI/2);
    pg.rotateZ(-PI/2);
    pg.rotateX(radians(frameCount*1*1));
    //scale(2);
    pg.scale(1*(1+4*environment.audioScaleFactor)*in.left.get(0));
    pg.blendMode(ADD);
    pg.shape(s[int(random(s.length))], 0, 0);
    pg.popMatrix();
  }
}


class Shockwaves8e extends Dream{

  int  hsteps = 36/2;///2;
  int  vsteps = 18/2;///2;

  ArrayList <PVector> [][] p;

  Shockwaves8e() {


    p  = new ArrayList[hsteps][vsteps];
    for (int i=0; i<hsteps; i++) {
      for (int j=0; j<vsteps; j++) {
        p[i][j] = new ArrayList();
      }
    }
  }
  void draw(PGraphics pg) {
    hsteps = environment.modelCols/2;
    vsteps = environment.modelRows/2;
    
    
    
    float amp = 16*1;
    for (int i=0; i<hsteps; i++) {
      for (int j=0; j<vsteps; j++) {
        p[i][j].add( new PVector(0, 0, 2*abs(in.left.get(0)*amp)) );
      }
    }
    pg.colorMode(HSB);
    pg.background(0);
    pg.translate(pg.width/2, 1*pg.height/4+28);
    //scale(0.5);
    //pg.rotateX(radians(60));
    //pg.rotateY(radians(frameCount));
    
    pg.rotateX(environment.rotateXSpeed+60);//frameCount*environment.rotateXSpeedMultiplicator);
    pg.rotateY(radians(frameCount*environment.rotateYSpeedMultiplicator));
    
    for (int i=0; i<hsteps; i++) {
      for (int j=0; j<vsteps; j++) {
        float longa = i*TWO_PI/float(hsteps);
        float lat   = j*TWO_PI/float(vsteps);
        for (int k=0; k<p[i][j].size (); k++) {
          pg.pushMatrix();
          pg.rotateY(longa);
          pg.rotateZ(lat);
          float rrr = p[i][j].get(k).y*sin(0.5*lat);//*cos(1*longa);
          pg.translate( 0, rrr );
          //ellipse(0, 0, p[i][j].get(k).z, p[i][j].get(k).z);
          float cellsize = p[i][j].get(k).z;
          //noFill();
          //stroke(map(cellsize,0,amp,0,255),255,255);fill(0);
          pg.fill(map(cellsize, 0, amp, 0, 255), 255, 255);
          pg.stroke(0);
          pg.box(cellsize);
          //box(cellsize/5,cellsize*4,cellsize/5);
          pg.popMatrix();
          //}
          p[i][j].get(k).y+=8*4;
          if (p[i][j].get(k).y>300*2)p[i][j].remove(k);
        }
      }
    }
  }
}

