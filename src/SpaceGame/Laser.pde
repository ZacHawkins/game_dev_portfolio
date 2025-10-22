class Laser {
  // Member Variables
  int x, y, w, h, speed;
  PImage l1;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 10;
    speed = 15;
    l1 = loadImage("laser.png");
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    l1.resize(60, 75);
    image(l1, x, y);
  }

  void move() {
    y = y - speed;
  }

  boolean reachedTop() {
    if (y<0-10) {
      return true;
    } else {
      return false;
    }
  }
  
   boolean intersect(Rock r, Boss b1) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
