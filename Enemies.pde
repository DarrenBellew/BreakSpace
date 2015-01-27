//i know i have this elsewhere, its just a constant MAX variable
int maxX = 10;
int maxY = 10;

class Enemy extends Entities {  
  //to dimmen the enemy as it gets hit.
  float dim;
  
  //Constructors
  Enemy(float x, float y, float w, float h) {

    location = new PVector(x-w/2, y);//-w/2 to assist in centering it.
    velocity = new PVector(5, 0);
    size = new PVector(w, h);
    
    lives = 3;
    
    colour = color(125, 125, 125);
    dim = 1;
  }

  Enemy() {
    this(width/2-5, width/2-5, 20, 10);//incase i forget it'll go here
  }

  Enemy(int j, int i) {//i invert the i,j for no reason
    //the X,Y code is pretty complicated; Let's be honest it took a bit of Trial and Error!!
    this(width/(maxX+1) * j, 20*i,  width/25, height/50);
  }
  
  void display() {
    fill(colour);
    stroke(colour);
    pushMatrix();
    translate(location.x, location.y);
    rect(0, 0, size.x, size.y);
    popMatrix();
  }
  //if an enemy was hit, it loses a life, the message is a Testing thing
  boolean hit() {
    lives--;
    //println("I was hit");


    dim = dim/lives;
    colour = color(red(colour) *  dim, green(colour) * dim, blue(colour) * dim);
    //doesn't do anything, its false so it doesn't mess up other functions that use this feature, that require a true output!
    return false;
  }
}

