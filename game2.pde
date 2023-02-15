import processing.sound.*;
SoundFile death;
SoundFile accept;
SoundFile jump;
SoundFile Point;
SoundFile pacman;
BG bacgro;
String topscore;
Motion motion;
int pac=0;
Press press;
int life=3, y1=25, y2=25, y3=25;           //////////////
boolean standby=true; 
PImage player;
float speed=4, start; 
float speedy; 
int score=0, hscore;
PImage off;
void setup() {
  size(800, 600,P2D); 
  //fullScreen(P2D);
  background(0);
  String[] high = loadStrings("highscore.txt");
  println(high[0]);
  hscore = int(high[0]);
  imageMode(CENTER);
  rectMode(CENTER);
  noStroke();
  player= loadImage("pm.png");
  off=loadImage("standby.jpg");
  bacgro= new BG();
  motion= new Motion();
  press= new Press();
  death = new SoundFile(this, "death.wav");
  accept = new SoundFile(this, "enter.wav");
  jump = new SoundFile(this, "jump.wav");
  Point = new SoundFile(this, "point.wav");
  pacman = new SoundFile(this, "Pacman remix.wav");
  pacman.amp(.1);
}
void draw() {
  if (speedy==-6 && start==1) {
    jump.play();
  }
  bacgro.show();
  motion.jump();
  if (start ==1) {
    motion.collision();
  }
  if (speed <=4)
    speed =4;
  else if (speed >=8)
    speed = 8;
  if (standby==true) {
    image(off, width/2, height/2, width, height);
    start=0;
    pacman.stop();
    pac=1;
  }
  if (pac==1 && standby==false) {
    pacman.loop();
    pac=0;
  }
  if (life==3) { //////////////////
    y1=25;
    y2=25;
    y3=25;
  } else if (life==2)
    y3=-300;
  else if (life ==1)
    y2=-300;
  topscore=str(hscore);
  String[] list = split(topscore, ' ');
  saveStrings("highscore.txt", list);
}


void keyPressed() {
  press.keyPressed();
}
