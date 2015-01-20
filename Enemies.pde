class Enemy extends Entities {  
  float ratio = 1.2;
  Enemy(float w, float h, float x, float y)  {
    
    location = new PVector(x*w*ratio,y*h*ratio);
    location.x += centX/2;//to keep sync with the translations
    location.y += 10;
    velocity = new PVector(5,0);
    size = new PVector(w,h);
    name = names[2];
    hit = false;
  }
  
  Enemy()  {
    this(20,10,width/2-5,width/2-5);//incase i forget it'll go here
  }
  
  Enemy(int j, int i)  {//i invert the i,j for no reason
    
    this(20,10,j,i);

  }
  
  void display()  {
    
    pushMatrix();
    translate(location.x, location.y);
      rect(0, 0, size.x, size.y);
    popMatrix();
    
  }
  
}

