//a base class for the Menu Items, Its no other real reason/advantage for this; other than it is just so theres less code on that page
class Option  {
  PVector location = new PVector();
  PVector size = new PVector();
  color unactive;
  color active;
  int value;
  String text;
  boolean on;
  int menNum;
  
  void Option(float x, float y, float w, float h, String t){}
  void Option(float x, float y, String t){}
  void Option(int i, String t){}
  
  void display(int i){}
  void active(){}
  void keyCheck(){}
  
}
