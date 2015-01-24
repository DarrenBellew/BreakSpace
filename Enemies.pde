class Enemy extends Entities {  
  float ratio = 1.2;
  Enemy(float x, float y, float w, float h)  {
    
    location = new PVector(x*w*ratio,y*h*ratio);
    location.x += centX/2;//to keep sync with the translations
    location.y += 10;
    velocity = new PVector(5,0);
    size = new PVector(w,h);
    name = names[2];
    
    lives = 3;
  }
  
  Enemy()  {
    this(width/2-5,width/2-5,20,10);//incase i forget it'll go here
  }
  
  Enemy(int j, int i)  {//i invert the i,j for no reason
    
    this(j,i,20,10);

  }
  
  void display()  {
    
    pushMatrix();
    translate(location.x, location.y);
      rect(0, 0, size.x, size.y);
    popMatrix();
    
  }
  
  void hit(int i)  {
    lives--;
    
    if(lives <= 0)  {
      entities.remove(i);
    }
  }
  
}

