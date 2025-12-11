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
boolean startGame = false;
//size of circle
int bSize = 50;
int gridRows = 3;
int gridCols = 5;
int sec = second();

void setup () {
  size (600, 600);
  frameRate(30);
  //establishes alien grid, which in this case is 3x5

  grid = new alien[gridRows][gridCols];
  //player
  test = new player[1];
  makeAliens(grid);
  //automatically set to true since the grid first moves rightward
  alienRite = true;
  newPlayer(bSize);
  newpProjectile(bSize);
  enemyProj(grid);
  //play.playerHit();
  death();
}

void draw() {
  background (#1b1b1b);

  impact(pProjectile, grid);
  drawGrid(grid);
  drawPlayer(test);
  play.Pdisplay();
  pProjectile.Pdisplay();
  //aProjectile.display();
  println(play.lives);
  if (alienRite == true) {
    boolean poo = false;
    for (int r = 0; r <= grid.length - 1; r++) {
      for (int c = 0; c <= grid[r].length - 1; c++) {
        if (poo ==  true) {
          // grid[r-1][c].center.y += 2*bSize;
        }
        //grid bounces back @ right edge
        if (width - grid[r][c].center.x <= bSize/2) {
          //doesnt move first row down?
          //grid[r][c].center.y += bSize;
          alienRite = false;
          poo = true;
        }

        grid[r][c].move();
      }
    }
  }
  if (alienRite == false) {
    boolean poo = false;
    for (int r = 0; r <= grid.length - 1; r++) {
      for (int c = 0; c <= grid[r].length - 1; c++) {
        if (poo ==  true) {
          // grid[r][c].center.y += 3*bSize;
        }

        //grid bounces back @ left edge
        if (grid[r][c].center.x <= bSize/2) {
          //grid[r][c].center.y += bSize;
          alienRite = true;
          poo = true;
        }
        grid[r][c].move();
      }
    }
  }

  //fires player projectile
  if (fire == true) {
    pProjectile.Xmove();
  }
  if (startGame == true) {
    aProjectile.Amove();
    aProjectile.display();
    if (frameCount % 120 == 0) {
      //moves @ angles and appears where the grid isnt ????
      //fixed? i cant tell if its at an angle or not curse ye processing
      enemyProj(grid);
    }
  }
}

void makeAliens(alien[][] g) {

  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
      int centerX = width/3 + ((bSize)*(c));
      int centerY = height/10 + ((bSize)*(r));
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

void drawPlayer (player[] p) {
  if (p[0] != null) {

    (p[0]).Pdisplay();
  }
}

void newPlayer(int bsize) {

  int projX = width/2;
  int projY =  height - height/10;
  PVector PCenter = new PVector (projX, projY);
  fill(255, 0, 0);
  play = new player (PCenter, bsize);
}

void newpProjectile(int psize) {
  float projX = play.Pcenter.x;
  //grid.length/2;
  float projY = play.Pcenter.y;
  //grid[r].length;
  PVector projCenter = new PVector (projX, projY);
  fill(255, 0, 0);
  noStroke();
  pProjectile = new player (projCenter, psize/2);
}

void enemyProj (alien[][] a) {

  int r = int (random(0, gridRows));
  //grid.length/2;
  int c = int(random(0, gridCols));
  //grid[r].length;
  int size = a[r][c].bsize;
  PVector projCenter = new PVector (a[r][c].center.x, a[r][c].center.y);
  //fill(255, 0, 0);
  noStroke();
  aProjectile = new alien (projCenter, size/2);
}//enemyProj



void keyPressed() {
  if (keyPressed == true ) {
    if (key == ' ') {
      fire = true;
    }
    if (key == 's') {
      startGame = true;
    }
    if (key == CODED) {
      if (keyCode == LEFT)
      {
        play.Pcenter.x-=3;
        pProjectile.Pcenter.x-=3;
      }
      if (keyCode == RIGHT) {
        play.Pcenter.x+=3;
        pProjectile.Pcenter.x+=3;
      }
    }
  }
}

void impact (player p, alien[][] g) {
  for (int r = 0; r <= grid.length - 1; r++) {
    for (int c = 0; c <= grid[r].length - 1; c++) {
      //gives same result as dist.. point doesnt wanna go beyond the closest row...
      if ((abs((grid[r][c].center.y - p.Pcenter.y)) < bSize/2) &&
        (abs((grid[r][c].center.x - p.Pcenter.x)) < bSize/2)) {
        fire = false;
        //this doesnt really completely remove the ball, so ig it still processes it getting hit?
        g[r][c].bsize = 0;
        g[r][c].center.y = 0;
        newpProjectile(bSize);
      }
      if (dist(play.Pcenter.x, play.Pcenter.y, aProjectile.center.x, aProjectile.center.y) < bSize/2){
        enemyProj(grid);
        //doesnt proccess hit
        play.playerHit();
    }
    }
  }
  //play.playerHit();
}



void death() {
  if (play.lives == 0) {
    play.bsize = 0;
    startGame = false;
    stroke(255);
    textSize (15);
    text ("GAME OVER", width/2, height/2);
  }
}
