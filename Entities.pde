
//Base Class for the other class that I have in my program (Excluding Menu)

class Entities  {
  PVector location;
  PVector velocity;
  PVector size;

  color colour;
  int lives;
  
  void Entities(float x, float y, float w, float h)  {}
  
  void display()  {}
  
  void move(){}
  
  //wall collision does not need to exist here as its specific to ball
  //but not done in Player (Obviously)
  //I return just TRUE here, otherwise it complains.
  boolean hit(){return true;};
  
       
}
