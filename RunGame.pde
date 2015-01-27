//THE ACTUAL GAME ************ALL HAIL IT***************
//points and balVar (ballVar may no longer be used)
int ballVar;
int points;

//game related variables
float fps = 60;//for dictiating the starting FPS and so i can alter it in the future.
int gameTime;//to record how long the player has been in-game for
ArrayList<Entities> entities = new ArrayList<Entities>();//All of the Entities of the game!

//to hold a state for the game to be running (If false the game is reset and entities re-created after being deleted [when the game is restarted of-course])
boolean gameRunning = false;

//to hold names of the entities so I can easily distinguish them amongst the ArrayList without the need for a "instance of" case and makes it easier for me to compare;


//create these objects so i have both arraylist and direct access to their contents/functions
Ball ball;
Player player;
PowerUp powerUp;

//the actual running game
void runGame()  {
  fill(255);
  
  int i=0;
  PVector l = new PVector();
  PVector s = new PVector();
  //setup() for the game
  if(gameRunning == false)  {
    newGame();
    gameTime=millis();
  }
  //if the player lost
  if(player.lives <= 0)  {
    gameOver("\n\nThank you for playing, but you lost\n");
  }
  //if the player won
  else if(winCond())  {
    gameOver("\n\nThank you for playing! YOU WON!!!\n");
  }
  //ease-of-access variable
  int size = entities.size();
  //show lives at top of screen
  showText("Lives: "+ player.lives, centX,25,15);
  
  //show this if the selected power up has been hit! :D :D :D :D
  if(fps<60 || fps>60)  {
    showText("Bye Bye framerate!!", centX, centY, 15);
  }
  
  //general functions fer almost everything,, displaying and moving
  while(i<size)  {    
    entities.get(i).display();
    entities.get(i).move();
    size = entities.size();//incase for Changes!
    if(! (entities.get(size-1) instanceof PowerUp))  {//if the last entity is not POWER UP
      if(powerUp.restart())  {
        entities.add(powerUp);
      }
    }
    //wall collision moved here ASWELL as it seems to ignore the wall after an enemy dies
    if(ball.wallCollision())  {//returns TRUE if hits BOTTOM of screen
      if(player.hit())  {
        ball.location.set(centX,centY);
        ball.velocity.set(0,1);
      }
    }
    i++;    
  }
  
  // Collision detection bit
  for (i = 0 ; i < size ; i ++)
  {
    Entities e = entities.get(i);
    if (e != ball)
    {
      ball.wallCollision();
      if (ball.checkCollision(e))
      {
        if (!(entities.get(i) instanceof Player))  {
          entities.get(i).hit();
          if(entities.get(i) instanceof Enemy)  {
            points++;
          }
        } 
      } 
    }
  }
    
  //clean up
  for(i=0; i<size; i++)  {
    if(entities.get(i).lives <= 0 && (entities.get(i) instanceof Enemy || entities.get(i) instanceof PowerUp))  {
      entities.remove(i);
      i--;
      size = entities.size();
   }
  }
  i=0;
}

//new game function, like the setup() but for the game.
void newGame()  {
  int i=0;
  clearEntities();
  ball = new Ball();
  player.reset();
  points = 0;
  
  entities.add(player);
  entities.add(ball);
  
  
  for(i=1; i<=maxY; i++)  {
    for(int j=1; j<=maxX; j++)  {
      entities.add(new Enemy(j,i));//J is row, I is column.
      //CountEnem.set(i,j);//by the end itll have the Length and Width of the enemies (Scale: # Enemies);
    }
    
  }
  
  powerUp = new PowerUp();
  entities.add(powerUp);
  
  i=0;
  textAlign(CENTER, CENTER);
  showText("New Game, Press anything to Begin", centX, centY, 15);
  
  
}

//empties the Entities ArrayList
void clearEntities()  {
  int i=0;
  player.reset();
  while(entities.size() != 0)  {
    entities.remove(0);
  }
}

//function to print text onto the screen
void showText(String msg, float x, float y, float size)  {
  textSize(size);
  fill(0,255,0);
  
  text(
    msg,
    x,
    y-15
  );
}
//to check if the player has won
boolean winCond()  {
  for(int i=0; i<entities.size(); i++)  {
    if(entities.get(i) instanceof Enemy)  {
      return false;
    }
  }
  return true;
}

//game over, recieves a message to print on the screen for the splash screen
void gameOver(String message)  {
  
  gameTime = abs(gameTime - millis())/1000;
  message = message+"You lasted: "+ gameTime+" Seconds";
  message = message+"\nScore: "+points;
  
  menuMessage = message;
  clearEntities();
  menu = 0;
  gameRunning = false;
}
