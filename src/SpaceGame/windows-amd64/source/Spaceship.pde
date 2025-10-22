class Spaceship {
  // Member Variables
  int x, y, w, health, laserCount, turretCount;
  //PImage ship;

  // Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 100;
    turretCount = 1;
    //ship = loadImage("filename.png");
  }

  // Member Methods
  void display() {
    //imageMode(CENTER);
    //image(ship,x,y);
    fill(127);
    stroke(50, 60, 120);
    ellipse(x, y, 80, 20);
    rectMode(CENTER);
    stroke(20, 50, 167);
    ellipse(x, y, 20, 50);
    stroke(50, 60, 120);
    triangle(x, y-20, x-50, y, x+50, y);
    line(x-30, y+35, x-30, y+10);
    line(x+30, y+35, x+30, y+10);
    fill(20, 50, 127);
    triangle(x, y-17, x-45, y-5, x+45, y-5);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean fire() {
    if(laserCount>0) {
    return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
