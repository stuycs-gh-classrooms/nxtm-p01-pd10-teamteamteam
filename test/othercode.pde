alien[][] grid;
player[] test;
player play;
//alien player;
int bSize = 50;

void setup () {
  size (600, 600);
  frameRate(30);
  grid = new alien[3][5];
  test = new player[1];
  makeAliens(grid);
  makePlayer(test);
}

void draw() {

  background (255);
  drawGrid(grid);
  drawPlayer(test);

  //processCollisions(test, grid);
}

void makeAliens(alien[][] g) {
  //make center xcor and ycor, then circle sizle, then a pvector center w=using the xcor and ycor


  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
      int centerX = width/3 + ((bSize)*(c));
      //grid.length/bSize;
      int centerY = height/10 + ((bSize)*(r));
      //grid[r].length/bSize;
      PVector center = new PVector (centerX, centerY);

      g[r][c] = new alien(center, bSize);
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

void makePlayer(player[] p) {

  int centerX = width/2;
  //grid.length/bSize;
  int centerY = height/2;
  //grid[r].length/bSize;
  PVector center = new PVector (centerX, centerY);

  p[0] = new player(center, bSize);
}

void drawPlayer (player[] p) {
  if (p[0] != null) {

    (p[0]).Pdisplay();
  }
}



void keyPressed() {
  //nullPointer :(((
  if (keyPressed == true ) {
    if (key == ' ') {
      play.Pmove();
      play.yspeed = -1;
    }
    if (key == CODED) {
      if (keyCode == LEFT)
      {
        play.center.x--;
      }
      if (keyCode == RIGHT) {
        play.center.x++;
      }
      
    }
  }
}
