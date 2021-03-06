//the class for THE player
class Player extends Entities {
  PVector primSize;
  
  char left;
  char right;
  //contructors
  Player(float x, float y, float w, float h, char left, char right)  {
    location = new PVector(x,y);
    
    velocity = new PVector();
    size = new PVector(w,h);
    primSize=new PVector(w,h);//i.e. Primary Size
    
    colour = color(255,255,0);
    lives = 3;
    
    this.left = left;
    this.right = right;
    
  }
  
  Player(float x, float y, XML xml)  {
    this(
      40,
      10,
      x,
      y,
      buttonNameToKey(xml,"left"),
      buttonNameToKey(xml,"right")
    );
  }
  
  Player(XML xml)  {
    this(
      centX-20,
      height-100,
      width/12.5,//for center of screen, 20 is hald the width
      width/50,
      buttonNameToKey(xml,"left"),
      buttonNameToKey(xml,"right")
      
    );
    
  }
  
  
  void display()  {
    fill(colour);
    stroke(colour);
    pushMatrix();
    translate(location.x, location.y);
      rect(0, 0, size.x, size.y);
    
    popMatrix();
  }
  
  void move()  {
    PVector temp = new PVector(location);
    
    
      if(checkKey(left) && temp.x > 0)  {
        velocity.set(-2,0);
      }
      if(checkKey(right) && temp.x+size.x < width)  {
        velocity.set(2,0);
      }
      
      location.add(velocity);
      velocity.set(0,0);
  }
  //if the player is hit, returns true for functionality.
  boolean hit()  {
    lives--;
    return true;
  }
  
  //reset the player to original case because of being created in SETUP to load the controls!
  void reset()  {
    location.set(centX-20,height-100);
    lives = 3;
  }
  //toggle its size for the Power Up (smaller was disregarded as it made it too difficult)
  void sizeToggle()  {
    if(size.x != primSize.x || size.y != primSize.y)  {
      size.set(primSize);
    }
    else  {
      size.set(primSize.x*2, primSize.y*2);
    }
  }
}
