int ballVar;

Ball ball;
Player player;
PowerUp powerUp;
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
  
  if(player.lives <= 0)  {
    gameOver();
  }
  
  
  
  int size = entities.size();
  textAlign(CENTER);
  
  showText("Lives: "+ player.lives, centX,30,15);
  //println(frameRate);
  
  if(fps<60 || fps>60)  {
    showText("Bye Bye framerate!!", centX, centY, 15);
  }
  
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

void newGame()  {
  int i=0;
  clearEntities();
  ball = new Ball();
  player = new Player();
  entities.add(player);
  entities.add(ball);
  
  
  for(i=1; i<=10; i++)  {
    for(int j=1; j<=10; j++)  {
      entities.add(new Enemy(j,i));//J is row, I is column.
      CountEnem.set(i,j);//by the end itll have the Length and Width of the enemies (Scale: # Enemies);
    }
    
  }
  
  powerUp = new PowerUp();
  entities.add(powerUp);
  
  i=0;
  textAlign(CENTER, CENTER);
  showText("New Game, Press x to Begin", centX, centY, 15);
  pause('X');
  
}

void clearEntities()  {
  int i=0;
  while(entities.size() != 0)  {
    entities.remove(0);
  }
}

void showText(String msg, float x, float y, float size)  {
  textSize(size);
  fill(0,255,0);
  
  text(
    msg,
    x,
    y-15
  );
}
void pause(char button)  {
  if(checkKey(button))  {
    gameRunning = true;
  }
}

void gameOver()  {
  menuMessage = "Thank you for playing, but you lost\n";
  gameTime = abs(gameTime - millis())/1000;
  menuMessage = menuMessage+"You lasted: "+ gameTime+" Seconds";
  clearEntities();
  menu = 0;
  gameRunning = false;
}
