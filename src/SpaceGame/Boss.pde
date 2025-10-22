class Boss {
  // Member Variables
  int x, y, diam, speed;
  PImage b1;
  

  // Constructor
  Boss() {
    x = int(random(width));
    y = -100;
    diam = 250 ;
    speed = int(random(1, 10));
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    b1.resize(diam, diam);
    image(b1, x, y);
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
}
