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
  
  void wallCollision()  {
    PVector l = new PVector(location);
    PVector s = new PVector(size);
    
    
    if(l.x <= 0 || l.x+s.x >= width)  {
      velocity.mult(-1,1);
    }
    if(l.y <= 0 || l.y+s.y >=height)  {
      velocity.mult(1,-1);
    }
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
    
    //Check if there was a collsion
    if(vCol || hCol)  {
      PVector change;
      if(vCol)  {
        change = new PVector(offSet(location.y));
      }
      if(hCol)  {
        change = new PVector(offSet(location.x));
      }
      
    }
    
    return false;
  }
  
  void entityCollision(int j)  {
    //println("pre-hello");
    PVector l = new PVector(entities.get(j).location);
    PVector s = new PVector(entities.get(j).size);
    //println(j);
    
    boolean hCol = false;
    boolean vCol = false;
    boolean isContainsCollision = false;
    
    if(location.x < l.x && l.x < location.x+size.x)  {
      hCol = true;
    }
    if(location.x < l.x+s.x && l.x+s.x < location.x+size.x)  {
      hCol = true;
    }
    
    if(location.y < l.y && l.y < location.y+size.y)  {
      vCol = true;
    }
    if(location.y < l.y+s.y && l.y+s.y < location.y+size.y)  {
      vCol = true;
    }
    
    if(!hCol && !vCol)  {
      if(l.x < location.x && location.x < l.x+s.x)  {
        if(l.y < location.y && location.y < l.y+s.y)  {
          isContainsCollision = true;
        }
      }
    }
    
    if(hCol && vCol || isContainsCollision)  {
      if(isContainsCollision)  {
        location.set(centX, centY);//This is a weird bug as it wont happen so its just a soft-reset
      }
      else  {
        if(location.y <= l.y)  {
          velocity.mult(1,-1);
        }
        else if(location.y >= l.y)  {
          velocity.mult(1,-1);
        }
        location.add(velocity);
        if(location.x < l.x)  {
          velocity.mult(-1,1);
        }
        else if(location.x > l.x)  {
          velocity.mult(-1,1);
        }
      }
      //location.add(velocity);//to simuate a move
    }
    
    
    
     //http://gamedev.stackexchange.com/questions/22609/breakout-collision-detecting-the-side-of-collision 
    
    //First detect Collision
    
    
  }
}

