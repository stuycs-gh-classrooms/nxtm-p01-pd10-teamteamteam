class player
{

      //instance variables
    PVector center;
    int xspeed;
    int yspeed;
    int bsize;
    color c;

    //default constructor
    player(PVector p, int s) 
    {
  bsize = s;
  center = new PVector(p.x, p.y);
    }


    boolean collisionCheck(player other) 
    {
  return ( this.center.dist(other.center)
     <= (this.bsize/2 + other.bsize/2) );
    }//collisionCheck



    //visual behavior
    void Pdisplay() 
    {
  fill(#1E2A56);
  triangle(center.x, center.y + height/10, center.x - bsize, center.y+(center.y * 0.35), center.x + bsize,center.y+(center.y * 0.35) );
    }
    //display
    
    //movement behavior
    void Pmove() 
    {
  if (center.x > 0 &&
      center.x < width) {
      xspeed*= -1;
  }
  if (center.y > 0 &&
      center.y < height) {
      yspeed*= -1;
  }
  center.x+= xspeed;
  center.y+= yspeed;
    }//move

}
//Ball
