boolean[] keys = new boolean[526];

void keyPressed()  {
  
   
  if(key == TAB)  {
    menu = 0;
  }
  keys[keyCode] = true;
}

void keyReleased()  {
  keys[keyCode] = false;
}

boolean checkKey(int k)  {
  return(keys[k]);
}

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
