PVector maxSpeed = new PVector(3, 3);


class Ball extends Entities {//I call it ball but the player doesn't care

  PVector primSize;

  Ball(float x, float y, float w, float h) {
    location = new PVector(x, y);
    size = new PVector(w, h);//20*20
    primSize = new PVector(w, h);
    velocity = new PVector(0, 2);//so it starts off at the middle and slowly going downwards for the player to hit
    name = names[1];
    colour = color(0, 0, 255);
    lives = 1;//so unaffected by CleanUp
  }
  Ball(float x, float y) {
    this(
    x, 
    y, 
    10, 
    10
      );
  }
  Ball() {
    this(
    width/2, 
    height/2, 
    height/50,
    height/50
      );
  }

  void display() {
    fill(colour);
    stroke(colour);
    pushMatrix();
    translate(location.x, location.y);

    rect(0, 0, size.x, size.y);

    popMatrix();
  }

  void move() {

    if (checkKey('O'))
    {
      location.y -= 1;
    } else if (checkKey('L'))
    {
      location.y += 1;
    } else if (checkKey('K'))
    {
      location.x -= 1;
    } else if (checkKey(';'))
    {
      location.x += 1;
    }

    location.add(velocity);
  }

  boolean wallCollision() {
    PVector l = new PVector(location);
    PVector s = new PVector(size);

    //these while loops are to move it out of the edge if it ever glitches past
    if (l.x <= 0) {
      velocity.mult(-1, 1);
      location.x = 0;
    }

    if (l.x+s.x >= width) {
      velocity.mult(-1, 1);
      location.x =  width-size.x;
    }

    if (l.y <= 0) {
      location.y=0;
      velocity.mult(1, -1);
    }

    if (l.y+s.y >=height) {

      return true;
    }
    return false;
  }

  boolean collides(Entities b)
  {
    if (b.location.x + b.size.x < location.x)
    {
      return false;
    }
    if (b.location.x > location.x + size.x)
    {
      return false;
    } 

    if (b.location.y > location.y + size.y)
    {
      return false;
    }

    if (b.location.y + b.size.y < location.y)
    {
      return false;
    }    
    return true;
  }

  boolean checkCollision(Entities e) {
    boolean vCol = false;
    boolean hCol = false;
    // Top Collision
    if ((location.y + size.y + velocity.y >= e.location.y) && (location.y + size.y  <= e.location.y)) {
      // Now check the x's
      if ((location.x >= e.location.x - size.x) && (location.x <= e.location.x + e.size.x)) {
        println(++ count + "Top collision");
        velocity.mult(1, -1);
        vCol = true;
      }
    }


    // Bottom collision
    if ((location.y + velocity.y <= e.location.y + e.size.y) && (location.y >= e.location.y + e.size.y)) {
      if ((location.x >= e.location.x - size.x) && (location.x <= e.location.x + e.size.x)) {
        println(++ count + "Bottom collision");
        velocity.mult(1, -1);
        vCol = true;
      }
    }    


    // Left collision
    if ((location.x + size.x + velocity.x >= e.location.x) && (location.x + size.x  <= e.location.x)) {
      // Now check the y's
      if ((location.y >= e.location.y - size.y) && (location.y <= e.location.y + e.size.y)) {
        println(++ count + "Left  collision");
        velocity.mult(-1, 1);
        hCol = true;
      }
    }

    // Right collision
    if ((location.x + velocity.x <= e.location.x + e.size.x) && (location.x >= e.location.x + e.size.x)) {
      // Now check the y's      
      if ((location.y >= e.location.y - size.y) && (location.y <= e.location.y + e.size.y)) {
        println(++ count + "Right collision");
        velocity.mult(-1, 1);
        hCol = true;
      }
    }
    if (hCol || vCol) {

      if (e instanceof Player) {//I do this so only the PLAYER gets the speed changes!
        //a bit of randomising when the ball hits the player
        if ((int)random(0, 2) == 0) {
          velocity.add(-0.5, -0.5);//speeds up on hitting player, and makes it look more fluid
        } else {
          velocity.add(0.5, 0.5);
        }
        float half;
        float ballCent;
        float entCent;
        float ballOffset;

        if (hCol) {
          half = e.size.x/2;
          ballCent = location.x + size.x/2;
          entCent = e.location.x + half;
          ballOffset = ballCent - entCent;
          velocity.x = ballOffset/half;

          //these are just error check incase it EVER gets too fast
          if (velocity.x > maxSpeed.x) {
            velocity.x = maxSpeed.x;
          } else if (velocity.x < -maxSpeed.x) {
            velocity.x = -maxSpeed.x;
          }
        }
        if (vCol) {
          half = e.size.y/2;
          ballCent = location.y + size.y/2;
          entCent = e.location.y+half;
          ballOffset = ballCent - entCent;
          velocity.y = ballOffset/half * maxSpeed.y;

          if (velocity.y > maxSpeed.y) {
            velocity.y = maxSpeed.y;
          } else if (velocity.y < -maxSpeed.y) {
            velocity.y = -maxSpeed.y;
          }
        }
      }
      return true;
    }
    return false;
  }
  void sizeToggle() {
    if (size.x > primSize.x && size.y > primSize.x) {
      size.set(primSize);
    } else if (size.x < primSize.x && size.y > primSize.y) {
      size.set(primSize);
    } else {
      size.set(size.x/2, size.y/2);
    }
  }
}

