int ballVar;

Ball ball;
Player player;

void runGame()  {
  fill(255);
  
  int i=0;
  PVector l = new PVector();
  PVector s = new PVector();
  //setup() for the game
  if(gameRunning == false)  {
    newGame();
    gameRunning = true;
  }
  
  int size = entities.size();
  
  while(i<entities.size())  {    
    entities.get(i).display();
    entities.get(i).move();
    
    i++;    
  }  
  // Collision detection bit
  for (i = 0 ; i < size ; i ++)
  {
    Entities e = entities.get(i);
    if (e != ball)
    {
      if (ball.checkCollision(e))
      {
        break;
      }
      ball.wallCollision();
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
  i=0;
  
  
}

void clearEntities()  {
  int i=0;
  while(entities.size() != 0)  {
    entities.remove(0);
  }
}
