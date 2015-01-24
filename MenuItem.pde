class MenuItem extends Option  {
  
  
  MenuItem(float x, float y, float w, float h, String t, int j)  {
    location.set(centX - w/2, centY/2 + h*j*2);
    size.set(w,h);
    text = t;
    
    active = color(10,200,10);
    unactive = color(10,10,200);
    on = false;
    menNum = j+1;
  }
  MenuItem(float x, float y, String t, int i)  {
    this(x,y,100,50,t, i);
  }
  MenuItem(int i, String t)  {
    this(centX-25, centY - i * 25,50,50,t, i);//this is ever for a simple Center Screen option
  }
  
  void display(int i)  {
    if(mouseX < location.x+size.x && mouseX > location.x && mouseY > location.y && mouseY < location.y+size.y)  {
      fill(active);//if mouse is inside the area highlight it and set Active true
      on = true;
    }
    else  {
      on = false;
      fill(unactive);
    }
    
    
    pushMatrix();
      translate(location.x, location.y);
      
      
        rect(0,0,size.x, size.y);//For all others; the w,h is changed to x,y meaning x width and y width; its just consistency with PVectors :D
        textSize(20);
        fill(0);
        text(
          text, 
          size.x/2 - textWidth(text)/2,
          size.y/2
        );
        
    popMatrix();
  }
  void active()  {
    
  }

}

