float centX, centY;
color bg = color(255,0,0);
int direction = 0;
int menu = 1;//The current position of the player if it is 1 and goes 0 by player pressing ESC, the game is "Paused" :)
int sMenu = -1;//to show the highlight of the mouse

ArrayList<Entities> entities = new ArrayList<Entities>();
//a PVector to hold the number of enemies both on x-axis and y-axis for future use.
PVector CountEnem;
//to hold a state for the game to be running (If false the game is reset and entities re-created after being deleted
boolean gameRunning = false;
  
//to hold names of the entities so I can easily distinguish them amongst the ArrayList without the need for a "instance of" case and makes it easier for me to compare;
String[] names = {"Player", "Ball", "Enemy"};

int count = 0;
void setup()  {
  size(500,500);

  smooth();
  centX = width/2;
  centY = height/2;
  CountEnem = new PVector();
  //Considering removing this so ignore the green it is a possible black/green retro look currently this is in idea to be REMOVED
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






