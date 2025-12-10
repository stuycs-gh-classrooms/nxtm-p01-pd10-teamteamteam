alien[][] grid;
player[] test;
player play;
player pProjectile;
//checks if the grid is moving right. if it is it continues until it hits the border, then it will move down and change to false (going left)
boolean alienRite;
boolean fire = false;
int bSize = 50;

void setup () {
  size (600, 600);
  frameRate(30);
  grid = new alien[3][5];
  test = new player[1];
  makeAliens(grid);
  alienRite = true;
  //line below not needed
  //makePlayer(test);
  newPlayer(bSize);
  newProjectile(bSize);
}

void draw() {

  background (255);
  drawGrid(grid);
  drawPlayer(test);
  play.Pdisplay();
  pProjectile.Pdisplay();
  println(frameCount);
  if (alienRite) {
    if (grid.length < width - bSize ) {
      
      for (int r = 0; r <= grid.length - 1; r++) {
        for (int c = 0; c <= grid[r].length - 1; c++) {

          grid[r][c].move();
        }
      }
    }
  }
  if (fire == true){
    pProjectile.Xmove();
  }
}

void makeAliens(alien[][] g) {

  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
      //probably change this to originate from the upper lefthand corner
      int centerX = width/3 + ((bSize)*(c));
      int centerY = height/10 + ((bSize)*(r));
      PVector center = new PVector (centerX, centerY);
      g[r][c] = new alien(center, bSize);
      //PVector center = new PVector (centerX, centerY);
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

void drawPlayer (player[] p) {
  if (p[0] != null) {

    (p[0]).Pdisplay();
  }
}

void newPlayer(int bsize) {

  int projX = width/2;
  int projY =  height/2;
  PVector PCenter = new PVector (projX, projY);
  fill(255, 0, 0);
  play = new player (PCenter, bsize);
}

void newProjectile(int psize) {
  float projX = play.Pcenter.x;
  //grid.length/2;
  float projY = play.Pcenter.y;
  //grid[r].length;
  PVector projCenter = new PVector (projX, projY);
  fill(255, 0, 0);
  pProjectile = new player (projCenter, psize/2);
}






void keyPressed() {
  //nullPointer :(((
  if (keyPressed == true ) {
    if (key == ' ') {
      //make it continuously move
      //rn only moves when space bar is held
      //pProjectile.Pcenter.y--;
      //play.yspeed = -1;
      fire = true;
      //play.Pmove();
    }
    if (key == CODED) {
      if (keyCode == LEFT)
      {
        play.Pcenter.x--;
        pProjectile.Pcenter.x--;
      }
      if (keyCode == RIGHT) {
        play.Pcenter.x++;
        pProjectile.Pcenter.x++;
      }
    }
  }
}
