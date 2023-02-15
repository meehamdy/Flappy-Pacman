class Motion {
  PImage starting = loadImage("start2.jpg");  // the starting photo
  PImage Star = loadImage("star.png"); 
  PImage heart = loadImage("heart.png"); ///////////////// 
  PImage boom = loadImage("boom.png");
  float y;
  float [] star = new float[3];
  float [] wy = new float[3];
  float [] wx = new float[3];
  Motion() {
    speedy=0;
    start=0;
  }
  void jump() {
    if (start==1) {
      image(player, width/4, y, 50, 50) ;
      y+=speedy; 
      speedy+=.4;
      fill(0, 100, 0);////////////////////////
      for (int i=0; i< 3; i++) {
        rect (wx[i], wy[i]-(height/2+90), 60, 600);
        rect (wx[i], wy[i]+(height/2+90), 60, 600);
        image (Star, wx[i]-120, star[i], 40, 40);
        if (wx[i] <-50) {
          star[i]=(int)random(100, height-100);
          wx[i]=width+25;
          wy[i]=(int)random(100, height-100);
        }
        //if (wx[i]==width+25) {
        //  score++;
        //}
        wx[i]-=speed;
        hscore=max(score, hscore);
      }
      image(heart, 140, y1, 20, 20); //////////////////////
      image(heart, 165, y2, 20, 20);
      image(heart, 190, y3, 20, 20);
      fill(0); /////////////////
      text("lives left :", 30, 30);////////////////
      text("High Score: "+topscore, width/2-80, 50);
      text("Score: "+score, width/2-50, 100);
    } else if (start ==0) {
      score=0;
      wx[0]=width-25;
      wy[0]=250;
      wx[1]=width+275;
      wy[1]=450;
      wx[2]=width+575;
      wy[2]=200;
      star[0]=(int)random(250, 400);
      star[1]=(int)random(350, 500);
      star[2]=(int)random(150, 350);
      image(starting, width/2, height/2, width, height);
    }
    if (y<25) {
      y=25;
      speedy=0;
    } else if (y>height-25) {
      y=height-25;
      speedy=0;
    }
  }
  void collision() {
    if  (abs(width/4-wx[0])<30  && abs(y-wy[0])>.1*width && abs(y-wy[0])<1000) { ///////////
      life--;
      image(boom, width/4, y, 250, 250) ;
      wy[0]=-5000;
      death.play();
      if (life<=0) 
        start=2;
    }
    if  (abs(width/4-wx[1])<30  && abs(y-wy[1])>.1*width && abs(y-wy[1])<1000) {/////////////////
      life--;
      image(boom, width/4, y, 250, 250) ;
      wy[1]=-5000;
      death.play();
      if (life<=0)
        start=2;
    }
    if  (abs(width/4-wx[2])<30  && abs(y-wy[2])>.1*width && abs(y-wy[2])<1000) {////////////////
      life--;
      image(boom, width/4, y, 250, 250) ;
      wy[2]=-5000;
      death.play();
      if (life<=0)
        start=2;
    }
    if  (dist(width/4, y, (wx[0]-120), star[0])<30 ) {
      score+=1;
      star[0]=width+100;
      Point.play();
      speed+=.1;
    }
    if  (dist(width/4, y, (wx[1]-120), star[1])<30) {
      score+=1;
      star[1]=width+100;
      Point.play();
      speed+=.1;
    }        
    if  (dist(width/4, y, (wx[2]-120), star[2])<30) {
      score+=1;
      star[2]=width+100;
      Point.play();
      speed+=.1;
    }
  }
}
