class Press {
  void keyPressed() {
    if (key == 'm') { ////////////////////////////////////////
      standby=!standby;
    } ///////////////////////////////
    if (key ==ENTER && standby!=true) {
      if (start==3)
        start=1;
      if (start==0)
        start=3;
      if (start==2)
        start=0;
      if (start!=1)
      accept.play();
    }
    if (key ==' ')
      speedy=-6;/////////////////////////////////////////
    if (key=='h') 
      speed+=2 ;//////////////////////////////////////
    if (key =='l') 
    {
      speed -=2;/////////////////////////////////
    }
    if (key =='1' && start==3) {
      player= loadImage("pm.png");
    }
    if (key =='2'&& start==3) {
      player= loadImage("pm2.png");
    }
    if (key =='3'&& start==3) {
      player= loadImage("pm3.png");
    }
    if (key =='4'&& start==3) {
      player= loadImage("pm4.png");
    }
    if (key =='5'&& start==3) {
      player= loadImage("pm5.png");
    }
    if (key =='6'&& start==3) {
      player= loadImage("pm6.png");
    }
  }
}
