class Grid{
  ArrayList<Cell> cells;
  int cols, rows;
  
  Grid(int c, int r){
    cols = c; rows = r;
    cells = new ArrayList<Cell>();
  }
  void add(Cell c){
    cells.add(c);
  }
  void draw(){
    pushMatrix();
    translate(zero.x,zero.y);
    for(Cell c:cells){
      c.draw();
    }
    popMatrix();
  }
}
