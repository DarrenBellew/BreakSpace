float centX, centY;
color bg = color(255,0,0);
int direction = 0;
int menu = 0;
int sMenu = -1;

ArrayList<Entities> entities = new ArrayList<Entities>();
PVector CountEnem;
boolean gameRunning = false;
String[] names = {"Player", "Ball", "Enemy"};

void setup()  {
  size(500,500);
  //smooth();
  centX = width/2;
  centY = height/2;
  CountEnem = new PVector();
  stroke(0,255,0);
}


void draw()  {
  background(bg);
  
  switch(menu)  {
    case 0:  {
      mainMenu();
      break;
    }
    case 1:  {
      runGame();
      break;
    }
    case 2:  {
      exit();
    }
  }
  
  
  //println(entities.get(1).location.y);
}






