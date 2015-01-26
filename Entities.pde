class Entities  {
  PVector location;
  PVector velocity;
  PVector size;

  String name;
  color colour;
  int lives;
  
  void Entities(float x, float y, float w, float h)  {
  }
  
  void display()  {}
  
  void move(){}
  
  //wall collision does not need to exist here as its specific to ball
  //but not done in Player (Obviously)

  boolean hit(){return true;};
  
       
}
