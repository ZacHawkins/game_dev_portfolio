// Zac Hawkins | 18 Sept 2025 | SpaceGame
Spaceship s1;
Boss b1;
import processing.sound.*;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
Timer rockTimer, puTimer;
int score, rocksPassed;
SoundFile fire1;
PImage start, gameover;
//SoundFile fire1;
boolean play;
void setup() {
  size(600, 600);
  background(22);
  s1 = new Spaceship();
  b1 = new Boss();
  rockTimer = new Timer(2000);
  puTimer = new Timer(5000);
  puTimer.start();
  rockTimer.start();
  score = 0;
  start = loadImage("startscreen.png");
  gameover = loadImage("gameover.png");
    gameover.resize(600, 600);
  fire1 = new SoundFile(this, "lasersound.wav");
  play = false;
}

void draw() {
  if (play == false) {
    startScreen();
  } else {
    background(22);

if (score>999) {
  b1.display();
  b1.move();
}

    if (puTimer.isFinished()) {
      powups.add(new PowerUp());
      puTimer.start();
    }
    //this will display and move power ups
    for (int i = 0; i<powups.size(); i++) {
      PowerUp pu = powups.get(i);
      pu.display();
      pu.move();

      // check bottom

      //check ship collection
      if (pu.intersect(s1)) {
        powups.remove(pu);
        if (pu.type == 'h') {
          s1.health+=100;
          //Turret increase
        } else if (pu.type == 't') {
          s1.turretCount+=1;
          if (s1.turretCount>5) {
            s1.turretCount = 5;
          }
        } else if (pu.type == 'a') {
          s1.laserCount+=100;
        }
      }
    }
    //display all stars
    stars.add(new Star());
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }
    //display all stars
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.move();
      star.display();
      if (star.reachedBottom()) {
        stars.remove(star);
        i--;
      }
    }


    //display all rocks and moves
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.move();
      rock.display();

      if (s1.intersect(rock)) {
        rocks.remove(rock);
        s1.health-=10;
      }
      if (rock.reachedBottom()) {
        rocksPassed++;
        rocks.remove(rock);
        i--;
      }
      println(rocks.size());
    }
    // Display and move lasers
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j=0; j<rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r,b1)) {
          lasers.remove(laser);
          score+=r.diam;
          score+=b1.diam;
          r.diam -= 50;
          b1.diam -= 55;
          if (r.diam<5) {
            rocks.remove(r);
          }
          

        }
      }
      laser.display();
      laser.move();
    }

    s1.display();
    s1.move(mouseX, mouseY);

    infoPannel();

    if (s1.health<1) {
      gameOver();
    }
  }
}

  void mousePressed() {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
    fire1.play();
  }

  void infoPannel() {
    rectMode(CENTER);
    fill(127, 127);
    rect(width/2, height-25, width, 50);
    fill(255);
    text("score: " + score, 30, width-20);
    text("rocks passed: " + rocksPassed, width - 200, width-20);
    text("Health: " + s1.health, 30, width);
    text("Ammo: " + s1.laserCount, width - 200, width);
  }

  void startScreen() {
    image(start, 0, 0);
    start.resize(600, 600);
    fill(255);
    if (mousePressed) {
      play = true;
    }
  }

  void gameOver() {
    image(gameover,width/2,height/2);
    gameover.resize(600, 600);
    fill(255);
    noloop();
  }
