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
    Pcenter.y -= 13;
  }
  void playerHit(){
    
 // if (dist(play.Pcenter.x, play.Pcenter.y, aProjectile.center.x, aProjectile.center.y) < bSize/2){
       play.lives--;
      
    // }
    
}
}
//Ball
