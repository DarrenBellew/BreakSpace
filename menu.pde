//The Main Menu

//the options
String[] options;
//arrayList for the menu options
ArrayList<Option> menuOpts = new ArrayList<Option>();
//menu variables
int menu = 0;
int sMenu = -1;//to show the highlight of the mouse
String menuMessage;//introductory message


//the mainMenu functiont o show them on the screen
void mainMenu()  {
  if(menuOpts.size() < options.length)  {
    menuSetup();
  }
  showText(menuMessage, centX, 40, 20);
  for(int i=0; i<menuOpts.size(); i++)  {
    menuOpts.get(i).display(i);
  }
  
}
//setup for the menu
void menuSetup()  {
  
  clearMenu();
  
  for(int i=0; i < options.length; i++)  {
    menuOpts.add(new MenuItem(i, options[i]));
  }
}

//clear the contents of the menu ArrayListS
void clearMenu()  {
  int i=0;
  while(menuOpts.size() != 0) {
    menuOpts.remove(i);
  }
}

//get the options for the menu from the .TXT file!
String[] getMenuOptions(String fileName, String splitString)  {
  String[] read = loadStrings(fileName);
  String[] splittedText = new String[read.length];
  
  for(int i=0; i<read.length; i++)  {
    String[] splitter = split(read[i], splitString);//at end of lign to "Split by Line", and act as a Carriage Return character
    
    splittedText[i] = splitter[0];
  }
  
  return splittedText;
}
