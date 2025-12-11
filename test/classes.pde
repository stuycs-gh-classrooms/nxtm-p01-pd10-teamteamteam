
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
    if (alienRite == true) {
      center.x+=1;
    } else if (alienRite != true) {
      center.x-=1;
    }
    center.y+= yspeed;
  }//move
  void Amove()
  {
    if (center.x > width - bsize/2 ||
      center.x < bsize/2) {

      xspeed*= -1;
    }
    if (center.y > height - bsize/2 ||
      center.y < bsize/2) {
      yspeed*= -1;
    }
    /*
    if (alienRite == true) {
      center.x+=1;
    } else if (alienRite != true) {
      center.x-=1;
    }
    */
    center.y+= 8;
  }
}//Ball
