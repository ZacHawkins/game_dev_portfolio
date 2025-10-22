class PowerUp {
  // Member Variables
  int x, y, diam, speed;
  char type;
  //PImage p1;
  color c1;
  // Constructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    diam = 100;
    speed = 5;
    color c1;
    if (random(10)>6.6) {
      // p1 = loadImage("turret.png");
      //type = 't'; //turretCount;
      //c1 = color(0, 0, 255);
    } else if (random(10)>5.0) {
      //  p1 = loadImage("Health.png");
      type = 'h';
      c1 = color(0, 255, 0);
      //  p1 = loadImage("rock3.png");
      // }
       } else if (random(10)>5.0) {
      //  p1 = loadImage("Health.png");
      type = 'a';
      c1 = color(0, 0, 255);
      //  p1 = loadImage("rock3.png");
      // }
    }
  }
  // Member Methods
  void display() {
    fill (c1);
    ellipse(x, y, diam, diam);
    fill(255);
    textAlign(CENTER);
    text(type, x, y);
    // imageMode(CENTER);
    // p1.resize(diam, diam);
    //image(p1, x, y);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spaceship s1) {
    float d = dist(x, y, s1.x, s1.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
