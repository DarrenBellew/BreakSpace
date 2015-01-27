//boolean array for the keys
boolean[] keys = new boolean[526];
//of any key is pressed
void keyPressed()  {
  
  //dev only (Wont be accessable off a computer)
  if(key == TAB && gameRunning)  {
    gameOver("\n\nThank you for playing, but you lost\n");
  }
  if(!gameRunning && menu == 1)  {
    gameRunning=true;
  }
  
  keys[keyCode] = true;
}
//to work if the player is holding the key down
void keyReleased()  {
  keys[keyCode] = false;
}

boolean checkKey(int k)  {
  return(keys[k]);
}
//if the player clicked (AND MENU IS 0);
void mousePressed()  {
  //main menu
  if(menu == 0)  {
    for(int i=0; i<menuOpts.size(); i++)  {
      if(menuOpts.get(i).on)  {
        println(menuOpts.get(i).on);
        menu = menuOpts.get(i).menNum;
        clearMenu();
      }
      
    }
  }
}
