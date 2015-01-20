class Ball extends Entities  {
  
  
  
  Ball(float x, float y, float w, float h)  {
    location = new PVector(x,y);
    size = new PVector(w,h);//20*20
    velocity = new PVector(0,3);//so it starts off at the middle and slowly going downwards for the player to hit
    name = names[1];
    hit = false;
  }
  Ball(float x, float y)  {
    this(
      x,
      y,
      20,
      20
    );
  }
  Ball()  {
    this(
      width/2,
      height/2,
      20,
      20
    ); 
  }
  
  void display()  {
    pushMatrix();
      translate(location.x, location.y);
      
        ellipse(0,0,size.x, size.y);
        
    popMatrix();
  }
  
  void move()  {
    location.add(velocity);
  }
  
  void wallCollision()  {
    
    PVector n = new PVector(1,1);
    PVector l = new PVector(location);
    PVector s = new PVector(size);
    
    
    if(l.x-s.x/2 <= 0 || l.x+s.x/2 >= width)  {
      velocity.mult(-1,1);
    }
    if(l.y-s.y/2 <= 0 || l.y+s.y/2 >=height)  {
      velocity.mult(1,-1);
    }
  }
  
  void entityCollision(int x, int y, int w, int h)  {
    PVector l = new PVector(x,y);
    PVector s = new PVector(w,h);
    println(l.x);
    if(location.x + size.x/2 >= l.x && location.x-size.x/2 <= l.x + s.x)  {
      if(location.y + size.y/2 >= l.y + s.x&& location.y - size.y/2 <= l.y)  {
        velocity.mult(-1,-1);
      }
    }
  }
}