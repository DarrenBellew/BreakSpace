class Enemy extends Entities {  
  float ratio = 1.2;
  
  float dim;
  Enemy(float x, float y, float w, float h)  {
    
    location = new PVector(x*w*ratio*1.2,y*h*ratio*1.2);
    location.x += centX/3;//to keep sync with the translations
    location.y += 10;
    velocity = new PVector(5,0);
    size = new PVector(w,h);
    name = names[2];
    lives = 1;
    colour = color(125,125,125);
    dim = 1;
  }
  
  Enemy()  {
    this(width/2-5,width/2-5,20,10);//incase i forget it'll go here
  }
  
  Enemy(int j, int i)  {//i invert the i,j for no reason
    
    this(j,i,20,10);

  }
  
  void display()  {
    fill(colour);
    stroke(colour);
    pushMatrix();
    translate(location.x, location.y);
      rect(0, 0, size.x, size.y);
    popMatrix();
    
  }
  
  void hit()  {
    lives--;
    println("I was hit");

    
    dim = dim/lives;
    colour = color(red(colour) *  dim, green(colour) * dim, blue(colour) * dim);
    
  }
  
}

