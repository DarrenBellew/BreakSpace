

//General Global Variables that dont have a specific location to be in
float centX, centY;
color bg = color(255,255,255);

//development ONLY
//int count = 0;

//Development only things!
boolean devMode = true;

boolean sketchFullScreen() {
  return ! devMode;
}

void setup()
{
  if (devMode)
  {
    size(800, 600);
  }
  else
  {
    size(displayWidth, displayHeight);
  }

  smooth();//smoother on the ball moving.
  centX = width/2;
  centY = height/2;
  //CountEnem = new PVector();
  
  stroke(0,255,0);
  frameRate(fps);
  //get the player keys and set them up
  setupPlayer();
  //setup the menu options.
  options = getMenuOptions("menuOpts.txt", "~");//found at top of menu.pde
  
  //done here to profit from the setupPlayer();
  menuMessage = "\n\nWelcome to BreakSpace\nLeft: "+player.left+"\nRight: "+player.right;
}


void draw()  {
  background(bg);
  //switch statement for traversing the menu options available
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

//function to setup the player buttons
void setupPlayer()  {
  XML xml = loadXML("breakSpace.xml");
  XML[] children = xml.getChildren("player");
  
  for(int i=0; i<children.length; i++)  {
    XML playerXML = children[i];
    
    player = new Player(
      playerXML
    );
  }
}

//to convert the keys written in the XML file into actual "Keys"
char buttonNameToKey(XML xml, String buttonName)  {
  //get the children of which buttonName and get the content.
  String value = xml.getChild(buttonName).getContent();
  //checking strings, ignoring case, and returning if the buttonName Matches
  if("LEFT".equalsIgnoreCase(value))  {
    return LEFT;
  }
  if("RIGHT".equalsIgnoreCase(value))  {
    return RIGHT;
  }
  
  return value.charAt(0);
}


