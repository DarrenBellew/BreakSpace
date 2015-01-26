class Ball extends Entities  {//I call it ball but the player doesn't care
  
  
  
  Ball(float x, float y, float w, float h)  {
    location = new PVector(x,y);
    size = new PVector(w,h);//20*20
    velocity = new PVector(2,3);//so it starts off at the middle and slowly going downwards for the player to hit
    name = names[1];
    colour = color(0,0,255);
    lives = 1;//so unaffected by CleanUp
  }
  Ball(float x, float y)  {
    this(
      x,
      y,
      10,
      10
    );
  }
  Ball()  {
    this(
      width/2,
      height/2,
      10,
      10
    ); 
  }
  
  void display()  {
    fill(colour);
    stroke(colour);
    pushMatrix();
      translate(location.x, location.y);
      
        rect(0,0,size.x, size.y);
        
    popMatrix();
  }
  
  void move()  {
    if(gameRunning || gamePaused)  {
      if (checkKey('O'))
      {
        location.y -= 1;
      }
      else if (checkKey('L'))
      {
        location.y += 1;
      }
      else if (checkKey('K'))
      {
        location.x -= 1;
      }
      else if (checkKey(';'))
      {
        location.x += 1;
      }
        
      location.add(velocity);
    }
  }
  
  boolean wallCollision()  {
    PVector l = new PVector(location);
    PVector s = new PVector(size);
    
    
    if(l.x <= 0 || l.x+s.x >= width)  {
      velocity.mult(-1,1);
    }
    if(l.y-s.y <= 0 || l.y+s.y >=height)  {
      velocity.mult(1,-1);
      if(l.y+s.y >= height)  {
        return true;
      }
    }
    return false;
  }
  
  boolean collides(Entities b)
  {
    if (b.location.x + b.size.x < location.x)
    {
      return false;
    }
    if (b.location.x > location.x + size.x)
    {
      return false;
    } 
    
    if (b.location.y > location.y + size.y)
    {
      return false;
    }
    
    if (b.location.y + b.size.y < location.y)
    {
      return false;
    }    
    return true;    
  }
  
  boolean checkCollision(Entities e)
  {
    boolean vCol = false;
    boolean hCol = false;
    // Top Collision
    if ((location.y + size.y + velocity.y >= e.location.y) && (location.y + size.y  <= e.location.y))
    {
      // Now check the x's
      if ((location.x >= e.location.x - size.x) && (location.x <= e.location.x + e.size.x))
      {
        println(++ count + "Top collision");
        velocity.mult(1,-1);
        hCol = true;
      }
    }
    
    
    // Bottom collision
    if ((location.y + velocity.y <= e.location.y + e.size.y) && (location.y >= e.location.y + e.size.y))
    {
      if ((location.x >= e.location.x - size.x) && (location.x <= e.location.x + e.size.x))
      {
        println(++ count + "Bottom collision");
        velocity.mult(1,-1);
        hCol = true;
      } 
    }    
    
    
    // Left collision
    if ((location.x + size.x + velocity.x >= e.location.x) && (location.x + size.x  <= e.location.x))
    {
      // Now check the y's
      if ((location.y >= e.location.y - size.y) && (location.y <= e.location.y + e.size.y))
      {
        println(++ count + "Left  collision");
        velocity.mult(-1,1);
        vCol = true; 
      }
    }
    
    // Right collision
    if ((location.x + velocity.x <= e.location.x + e.size.x) && (location.x >= e.location.x + e.size.x))
    {
      // Now check the y's      
      if ((location.y >= e.location.y - size.y) && (location.y <= e.location.y + e.size.y))
      {
        println(++ count + "Right collision");
        velocity.mult(-1,1);
        vCol = true;
      }
    }
    if(hCol || vCol)  {
      return true;
    }

    
    return false;
  }

}

