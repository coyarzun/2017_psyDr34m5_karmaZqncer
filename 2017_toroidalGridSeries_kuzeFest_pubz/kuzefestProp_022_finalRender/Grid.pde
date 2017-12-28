class Grid {
  Cell[][] cells;
  int cols, rows;
  PImage buffer;

  Grid(int c, int r) {
    cols = c; 
    rows = r;
    cells = new Cell[c][r];

    setup();
  }
  void setup() {
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        Guide l, t, r, b;
        l = vguides[i];
        r = vguides[i+1];
        t = hguides[j];
        b = hguides[j+1];
        add(i, j, new Cell(l.from.x, t.from.y, r.from.x, b.from.y));
      }
    }
    buffer = createImage(cols, rows, RGB);
  }
  void add(int i, int j, Cell c) {
    cells[i][j] = c;
  }
  void draw() {
    gridBuffer.pushMatrix();
    gridBuffer.scale(0.5);
    //translate(zero.x, zero.y);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        cells[i][j].draw(color(random(255)));
      }
    }
    gridBuffer.popMatrix();
  }

  void draw(PImage img) {
    doBufferStuff(img);

    gridBuffer.pushMatrix();
    //translate(zero.x, zero.y);
    //image(buffer,0,0);
    int k=0;
    for (int j=0; j<rows; j++) {
      for (int i=0; i<cols; i++) {
         if(doFX1)
           k = (i+(doFlipV?cols-1-i:0))+(j+(doFlipH?rows-1-j:0))*cols;
         else if(doFX2)
           k = (i+(doFlipV && i>=cols/2?cols-1-i:0))+(j+(doFlipH && j>=rows/2+10?rows-1-j:0))*cols;
         else 
           k = ((doFlipV && i>=cols/2?cols-1-i:i))+((doFlipH && j>=rows/2 +10 ? max(0,rows-1-10-j):j))*cols;
         cells[i][j].draw(color(buffer.pixels[k]));
      }
    }
    gridBuffer.popMatrix();
  }
  void draw(PImage img, AudioInput in) {
    doBufferStuff(img);
    gridBuffer.pushMatrix();
    //gridBuffer.translate(gridBuffer.width/4,3*gridBuffer.height/4);
    if(realSize){
      gridBuffer.translate(gridBuffer.width/8,3*gridBuffer.height/4);
      gridBuffer.scale(0.25);
    }else{
      gridBuffer.translate(gridBuffer.width/2,gridBuffer.height/2);
    }
    int k=0;
    for (int j=0; j<rows; j++) {
      for (int i=0; i<cols; i++) {

        //int k=buffer.pixels[j+i*rows];
        int ii, jj;
        
         if(doFX1)
           k = (i+(doFlipV?cols-1-i:0))+(j+(doFlipH?rows-1-j:0))*cols;
         else if(doFX2)
           k = (i+(doFlipV && i>=cols/2?cols-1-i:0))+(j+(doFlipH && j>=rows/2+10? rows-1-j:0))*cols;
         else 
           k = ((doFlipV && i>=cols/2?cols-1-i:i))+((doFlipH && j>=rows/2 +10 ? max(0,rows-1-10-j):j))*cols;
         
        //cells[i][j].draw(hue(buffer.pixels[k]), abs(in.left.get(k%in.bufferSize()))*100);
        cells[i][j].draw(color(buffer.pixels[k]), abs(in.left.get(k%in.bufferSize()))*100);
        //k++;
      }
    }
    gridBuffer.popMatrix();
  }
  void doBufferStuff(PImage img){
    println(img.width);
    try {
      buffer.copy(img, 0, 0, img.width, img.height, 0, 0, buffer.width, buffer.height);
    }
    catch(Exception e) {
    }
    
  }
}

