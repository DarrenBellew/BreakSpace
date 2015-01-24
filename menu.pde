String[] options = {"Play", "Exit"};//I will admit i dont know why this has to be inverted

ArrayList<Option> menuOpts = new ArrayList<Option>();

void mainMenu()  {
  if(menuOpts.size() < options.length)  {
    menuSetup();
  }

  for(int i=0; i<menuOpts.size(); i++)  {
    menuOpts.get(i).display(i);
  }
  
}

void menuSetup()  {
  clearMenu();    

  for(int i=0; i < options.length; i++)  {
    menuOpts.add(new MenuItem(i, options[i]));
  }
}

void clearMenu()  {
  int i=0;
  while(menuOpts.size() != 0) {
    menuOpts.remove(i);
  }
}
