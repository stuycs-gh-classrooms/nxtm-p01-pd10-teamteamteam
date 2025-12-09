//basically copypaste rn
class alien
{

      //instance variables
    PVector center;
    int xspeed;
    int yspeed;
    int bsize;
    color c;

    //default constructor
    alien(PVector p, int s) 
    {
  bsize = s;
  center = new PVector(p.x, p.y);
    }


    boolean collisionCheck(alien other) 
    {
  return ( this.center.dist(other.center)
     <= (this.bsize/2 + other.bsize/2) );
    }//collisionCheck



    //visual behavior
    void display() 
    {
  fill(#DD571C);
  circle(center.x, center.y, bsize);
    }//display
    
    void Pdisplay(){
  fill(#1E2A56);
  triangle(center.x, center.y + height/10, center.x - bsize, center.y+(center.y * 0.35), center.x + bsize,center.y+(center.y * 0.35) );
    }

    //movement behavior
    void move() 
    {
  if (center.x > width - bsize/2 ||
      center.x < bsize/2) {
      xspeed*= -1;
  }
  if (center.y > height - bsize/2 ||
      center.y < bsize/2) {
      yspeed*= -1;
  }
  center.x+= xspeed;
  center.y+= yspeed;
    }//move

}//Ball
