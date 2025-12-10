alien[][] grid;
player[] test;
//actual player
player play;
//player projectile
player pProjectile;
//alien projectile
alien aProjectile;


//checks if the grid is moving right. if it is it continues until it hits the border, then it will move down and change to false (going left)
boolean alienRite;
//if 'fire' == true, the play projectile is launched. 'fire' is set to true when '' is pressed
boolean fire = false;
//size of circle
int bSize = 50;

void setup () {
  size (600, 600);
  frameRate(30);
  //establishes alien grid, which in this case is 3x5
  grid = new alien[3][5];
  //player
  test = new player[1];
  makeAliens(grid);
  //automatically set to true since the grid first moves rightward
  alienRite = true;
  newPlayer(bSize);
  newProjectile(bSize);
}

void draw() {

  background (#1b1b1b);
  drawGrid(grid);
  drawPlayer(test);
  play.Pdisplay();
  pProjectile.Pdisplay();
  println(frameCount);
  if (alienRite == true) {
    //this doesnt mean anything ??
    // if (grid.length < width - bSize ) {
    for (int r = 0; r <= grid.length - 1; r++) {
      for (int c = 0; c <= grid[r].length - 1; c++) {

        grid[r][c].move();

        //grid bounces back @ right edge
        if (width - grid[r][c].center.x <= bSize/2) {
          //only moves one alien down?
          //grid[r][c].center.y += bSize;
          alienRite = false;
        }
      }
    }
  }
  if (alienRite == false) {
    for (int r = 0; r <= grid.length - 1; r++) {
      for (int c = 0; c <= grid[r].length - 1; c++) {

        grid[r][c].move();

        //grid bounces back @ left edge
        if (grid[r][c].center.x <= bSize/2) {
          alienRite = true;
        }
      }
    }
  }

  //fires player projectile
  if (fire == true) {
    pProjectile.Xmove();
  }
}

void makeAliens(alien[][] g) {

  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
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
