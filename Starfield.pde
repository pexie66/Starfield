Particle [] one = new Particle [50];
void setup()
{
  size(600, 600);
  for (int i = 0; i < one.length; i++)
  {
    one [i] = new NormalParticle();
    one [0] = new OddballParticle(150, 300);
    one [1] = new JumboParticle();
  }
}

void draw()
{
  background(0);
  noStroke();
  for (int i = 0; i < one.length; i ++)
  {
    one[i].show();
    one[i].move();
  }
}

//1st implementation of Particle Interface
class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  int myColor, mySize;

  NormalParticle()
  {
    myColor = color ((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = (int)(Math.random()*30);
    myX = 300;
    myY = 300;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = 50;
  }

  public void move()
  { 
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);  
    myAngle = mySpeed + myAngle;
  }

  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}

class OddballParticle implements Particle
{
  int myX1, myY1, myColor2;
  OddballParticle(int x, int y)
  {
    myX1 = x;
    myY1 = y;
  }

  public void move()
  {
    myX1 += 1;
    if (myX1 > width-300)
      myX1 = 150;

    if (myX1 == 300)
      background((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }    

  public void show()
  {
    fill(255);
    rect(myX1, myY1, 10, 10);
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    ellipse((float)myX, (float)myY, 50, 50);
  }
}  
interface Particle
{
  public void show();
  public void move();
}