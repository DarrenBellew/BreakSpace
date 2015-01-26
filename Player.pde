class Player extends Entities {
  
  Player(float x, float y, float w, float h)  {
    location = new PVector(x,y);
    velocity = new PVector();
    size = new PVector(w,h);
    
    name = names[0];
    colour = color(255,255,0);
    lives = 3;
  }
  
  Player(float x, float y)  {
    this(
      40,
      10,
      x,
      y
    );
  }
  
  Player()  {
    this(
      300,
      400,
      40,//for center of screen, 20 is hald the width
      10
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
    
    
      if(checkKey('A') && temp.x > 0)  {
        velocity.set(-2,0);
      }
      if(checkKey('D') && temp.x+size.x < width)  {
        velocity.set(2,0);
      }
      
      location.add(velocity);
      velocity.set(0,0);
    }
   
   boolean hit()  {
    lives--;
    if(lives <= 0)  {
      return true;
    }
    else  {
      return false;
    }
   } 
  
}
