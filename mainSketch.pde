float centX, centY;
color bg = color(255,255,255);
int direction = 0;
int menu = 0;//The current position of the player if it is 1 and goes 0 by player pressing ESC, the game is "Paused" :)
int sMenu = -1;//to show the highlight of the mouse
float fps = 60;
String menuMessage = "Welcome to BreakSpace";
int gameTime;


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
  frameRate(fps);
  
  setupPlayer();
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

void setupPlayer()  {
  XML xml = loadXML("buttons.xml");
  XML[] children = xml.getChildren("player");
  int gap = width/(children.length+1);
  
  for(int i=0; i<children.length; i++)  {
    XML playerXML = children[i];
    
    player = new Player(
      playerXML
    );
  }
}

char buttonNameToKey(XML xml, String buttonName)  {
  String value = xml.getChild(buttonName).getContent();
  
  if("LEFT".equalsIgnoreCase(value))  {
    return LEFT;
  }
  if("RIGHT".equalsIgnoreCase(value))  {
    return RIGHT;
  }
  
  return value.charAt(0);
}


