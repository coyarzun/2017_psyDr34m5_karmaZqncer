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
    pushMatrix();
    //translate(zero.x, zero.y);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        cells[i][j].draw(random(255));
      }
    }
    popMatrix();
  }
  
  void draw(PImage img) {
    
    try{
      buffer.copy(img,0,0,img.width,img.height,0,0,buffer.width,buffer.height);
    }catch(Exception e){}
    
    pushMatrix();
    //translate(zero.x, zero.y);
    image(buffer,0,0);
    int k=0;
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        //int k=buffer.pixels[j+i*rows];
        
        cells[i][j].draw(hue(buffer.pixels[k]));
        k++;
      }
    }
    popMatrix();
  }
}

