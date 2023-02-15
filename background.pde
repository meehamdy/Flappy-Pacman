class BG {                                             // background class
  int x;
  PImage bacgr=loadImage("bg1.jpg");   //the background photo
  PImage gameover = loadImage("gameover.jpg"); 
  PImage select = loadImage("select.jpg");
  void show() {
    if (start==3) {
      image(select, width/2, height/2, width, height);
      fill(0);
      textSize(22);
      text("press 1,2,3,4,5,6 to change player", .28*width, .6*height);
      fill(192);
      rect(width/2, .4*height, 180, 180) ;
      image(player, width/2, .4*height, 150, 150) ;
    } else if (start==1) {
      image(bacgr, (x+width/2), height/2, width, height);
      image(bacgr, (x+width/2)+(width), height/2, width, height);    
      x-=speed;
      if (x<=-width)                          //Note:if condition inside if condition
        x=0;
    } else if (start==2) {
      life=3;
       speed =4;
      image(gameover, width/2, height/2, width, height);
      fill(200, 0, 0);
      text("High Score: "+topscore, .4*width, .7*height);
    }
  }
}
