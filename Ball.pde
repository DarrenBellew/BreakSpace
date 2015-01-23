class Ball extends Entities  {//I call it ball but the player doesn't care
  
  
  
  Ball(float x, float y, float w, float h)  {
    location = new PVector(x,y);
    size = new PVector(w,h);//20*20
    velocity = new PVector(1,1);//so it starts off at the middle and slowly going downwards for the player to hit
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
      vCol = false;
    }
    
    if(!hCol && !vCol)  {
      if(l.x < location.x && location.x < l.x+s.x)  {
        if(l.y < location.y && location.y < l.y+s.y)  {
          isContainsCollision = true;
        }
      }
    }
    
    if(hCol && vCol || isContainsCollision)  {
      float wy = (size.x + s.x) * (location.y+size.y/2 -  l.y+s.y/2);
      float hx = (size.y + s.y) * (location.x+size.x/2 -  l.x+s.x/2);
      
      if(wy > hx)  {
        if(wy > -hx)  {
          //top
          velocity.mult(-1,1);
        }
        else  {
          //left
          velocity.mult(1,-1);
        }
        
      }
      else  {
        if(wy > -hx)  {
          //right
          velocity.mult(1,-1);
        }
        else {
          velocity.mult(-1,1);
        }
      }
    }
      //location.add(velocity);//to simuate a move
  }
    
    
    
     //http://gamedev.stackexchange.com/questions/22609/breakout-collision-detecting-the-side-of-collision 
    
    //First detect Collision
    
    
}


