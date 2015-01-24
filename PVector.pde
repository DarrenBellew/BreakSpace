class PVector  {
  float x,y;
  
  PVector(float x, float y)  {
    this.x=x;
    this.y=y;
  }
  PVector()  {
    this(0,0);
  }
  PVector(PVector n)  {
    this(n.x, n.y);
  }
  
  float mag()
  {
    return sqrt((x * x) + (y * y));
  }

  
  void normalise()
  {
    float m = mag();
    x /= mag();
    y /= mag();    
  }
  
  void add(float x, float y)  {
    this.x += x;
    this.y += y;
  }
  
  void add(PVector n)  {
    add(n.x, n.y);
  }
  
  //I can call these the same as they hane different paramaters
  void set(float x, float y)  {
    this.x=x;
    this.y=y;
  }
  
  void set(PVector n)  {
    set(n.x, n.y);
  }
    
    
  void mult(float x, float y)  {
    this.x*=x;
    this.y*=y;
  }
    
  void mult(PVector n)  {
    mult(n.x, n.y);
  }
  
  //this func compares 2 vectors and if they are the same return true otherwise returns 0;
  //returns 1 if the first variable matches, returns 2 if the second variable matches and -1 if neither match
  int comp(float x, float y)  {
    if(this.x == x && this.y == y)  {
      return 0;
    }
    else if(this.x == x)  {
      return 1;
    }
    else if(this.y == y)  {
      return 2;
    }
    return -1;
  }
  int comp(PVector n)  {
    return comp(n.x, n.y);
  }
  
  float get(int i)  {
    
    float[] a = new float[2];
    a[0] = x;
    a[1] = y;
    
    return a[i];
  }
  
  int size()  {
    return 2;
  }
  
}
