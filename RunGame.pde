int ballVar;

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
    entities.get(i).wallCollision();

    
    
    entities.get(i).entityCollision();
    
    
    i++;
    
  }
  i=0;
}

void newGame()  {
  int i=0;
  clearEntities();
  
  entities.add(new Player());
  entities.add(new Ball());
  
  
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
