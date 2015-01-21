class Ball extends Entities  {//I call it ball but the player doesn't care
  
  
  
  Ball(float x, float y, float w, float h)  {
    location = new PVector(x,y);
    size = new PVector(w,h);//20*20
    velocity = new PVector(2,3);//so it starts off at the middle and slowly going downwards for the player to hit
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
      
        rect(0,0,size.x, size.y);
        
    popMatrix();
  }
  
  void move()  {
    location.add(velocity);
  }
  
  void wallCollision()  {
    
    PVector n = new PVector(1,1);
    PVector l = new PVector(location);
    PVector s = new PVector(size);
    
    
    if(l.x <= 0 || l.x+s.x >= width)  {
      velocity.mult(-1,1);
    }
    if(l.y <= 0 || l.y+s.y >=height)  {
      velocity.mult(1,-1);
    }
  }
  
  void entityCollision(int j)  {
    //println("pre-hello");
    PVector l = new PVector();
    PVector s = new PVector();
    //println(j);
    if(j==101)  {
      println("hey");
      println(++count);
    }
      
  }
}

