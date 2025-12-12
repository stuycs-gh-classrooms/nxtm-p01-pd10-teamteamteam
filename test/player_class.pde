class player
{

  //instance variables
  PVector Pcenter;
  int xspeed;
  int yspeed;
  int bsize;
  color c;
  int lives;

  //default constructor
  player(PVector p, int s)
  {
    lives = 3;
    bsize = s;
    Pcenter = new PVector(p.x, p.y);
  }


  boolean collisionCheck(player other)
  {
    return ( this.Pcenter.dist(other.Pcenter)
      <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck



  //visual behavior
  void Pdisplay()
  {
    fill(255);
    circle(Pcenter.x, Pcenter.y, bsize);
    //maybe make this a triangle?
  }
  //display

  //movement behavior
  void Pmove()
  {
    if (Pcenter.x > width - bsize/2 ||
      Pcenter.x < bsize/2) {
      xspeed*= -1;
    }
    if (Pcenter.y > height - bsize/2 ||
      Pcenter.y < bsize/2) {
      yspeed*= -1;
    }
    Pcenter.x+= xspeed;
    Pcenter.y+= yspeed;
  }//move
  void Xmove()
  {
    if (Pcenter.x > width - bsize/2 ||
      Pcenter.x < bsize/2) {
      xspeed*= -1;
    }
    if (Pcenter.y > height - bsize/2 ||
      Pcenter.y < bsize/2) {
      yspeed*= -1;
    }
    Pcenter.x+= xspeed;
    Pcenter.y -= 14;
  }
  void playerHit(){
    
 // if (dist(play.Pcenter.x, play.Pcenter.y, aProjectile.center.x, aProjectile.center.y) < bSize/2){
       play.lives--;
      
    // }
    
}

void death() {
  if (play.lives == 0) {
    startGame = false;
    
   // stroke(255);
    textSize (25);
    //temporarily stays on screen :(
    text ("GAME OVER", width/2, height/2);
    //text wont show
    delay(1000000000);
    
  
  }
}
/*
void gameOver (){
  if (play.lives == 0) {
   textSize (25);
    //temporarily stays on screen :(
    text ("GAME OVER", width/2, height/2);
  }
}
*/
}
//Ball
