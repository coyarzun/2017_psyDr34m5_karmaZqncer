class Grid {
  Cell[][] cells;
  int cols, rows;

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
}

