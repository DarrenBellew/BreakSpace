//TBA

class PowerUp extends Entities {
  
  
  PowerUp(float x, float y, float w, float h, float ySpeed)  {
    
    location = new PVector(x,y);
    size = new PVector(w,h);
    velocity = new PVector(0,ySpeed);
    colour = color(random(100,200), random(100,200), random(100,200));
    lives=1;//means it'll be removed when hit.
  }
  PowerUp(float x, float y, float ySpeed)  {
    this(x,y,5,5,ySpeed);
  }
  
  PowerUp()  {
    this(
      random(5,width-5),
      0,
      5,
      5,
      1
    );
  }
  
  
  void display()  {
    pushMatrix();
      fill(colour);
      translate(location.x, location.y);
        rect(0,0,size.x,size.y);
        
    popMatrix();
  }
  
  void move()  {
    location.add(velocity);
    if(location.y >= height)  {
      entities.remove(entities.size()-1);
    }
  }
  boolean hit()  {
    int impact = (int)random(0,3);
    
    switch(impact)  {
      case 0:  {
        frameToggle();
        break;
      }
      case 1:  {
        ball.sizeToggle();
        break;
      }
      case 2:  {
        player.sizeToggle();
        break;
      }
    }
    lives--;
    
    return true;//just because of requirements
  }
  
  boolean restart()  {
    int restart = (int)random(0,100);
    lives=1;
    if(restart < 5)  {//1 In 59 Chance, every frame of a power up to appear
      //reset the THIS
      
      location.set(random(5,width-5),0);
      size.set(5,5);
      velocity.set(0,random(0,5));
      
      
      return true;
    }
    
    return false;
  }
}

void frameToggle()  {
  if(fps < 60)  {
    fps = 60;
  }
  else if(fps > 60)  {
    fps = 60;
  }
  else  {
    if((int)random(0,2) == 0)  {
      fps+= fps/2;
    }
    else  {
      fps-=fps/2;
    }
  }
  println(fps);
  frameRate(fps);
}
