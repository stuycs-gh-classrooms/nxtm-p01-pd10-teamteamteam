alien[][] grid;
alien player;
int cSize = 50;

void setup () {
  size (600, 600);
  frameRate(30);
  grid = new alien[3][5];
  makeAliens(grid);

  newPlayer(cSize);
}

void draw() {

  background (255);
  drawGrid(grid);

  //processCollisions(projectile, grid);
  player.Pdisplay();
}

void makeAliens(alien[][] g) {
  //make center xcor and ycor, then circle sizle, then a pvector center w=using the xcor and ycor


  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
      int centerX = width/3 + ((cSize)*(c));
      //grid.length/cSize;
      int centerY = height/10 + ((cSize)*(r));
      //grid[r].length/cSize;
      PVector center = new PVector (centerX, centerY);

      g[r][c] = new alien(center, cSize);
    }
  }
}

void drawGrid(alien[][] g) {
  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {

      if (g[r][c] != null) {

        (g[r][c]).display();
      }
      //text("test", width/2, height/2);
    }
  }
}

void newPlayer(int psize) {
  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
      int projX = width/2;
      //grid.length/2;
      int projY =  height/2;
      //grid[r].length;
      PVector projCenter = new PVector (projX, projY);
      fill(255, 0, 0);
      player = new alien (projCenter, psize);
    }
  }
}
