// 章晴 2019-9-26
import processing.pdf.*;
import java.util.Calendar;
  int cnt=0;
color pic;
int cnt2;
color girl;
color tet;
PFont font;
PImage p1;

boolean savePDF = false;

PVector center, topLeft;
color back = #4DB37D;
color fore = #B32515;
color solid = #FF9387;

PVector v1, v2, v3, v4;
int segmentCount = 5 ; // n边形
float radius = 200;
float tight = 0.6;

void setup() {
  //size(800, 950);
  fullScreen(displayWidth);

  font=createFont("Segoe Print", displayWidth*0.3);
  p1=loadImage("tag.png");
  textFont(font);
  textAlign(CENTER);
  pic=color(0, 98, 132);
  girl=color(0, 98, 132);
  tet=color(248, 195, 205);
  
}

void draw() {
  background(248, 195, 205);


  fill(pic);
  stroke(0, 0);
  ellipse(displayWidth*0.5, displayHeight*0.3, displayHeight*0.4, displayHeight*0.4); 
  triangle(displayWidth*0.35, displayHeight*0.58, displayWidth*0.65, displayHeight*0.58, displayWidth*0.5, displayHeight*0.9);
  rect(displayWidth*0.475, displayHeight*0.4, displayWidth*0.05, displayHeight*0.3);


  fill(girl);
  ellipse(displayWidth*0.5, displayHeight*0.35, displayHeight*0.2, displayHeight*0.2); 
  triangle(displayWidth*0.5, displayHeight*0.45, displayWidth*0.48, displayHeight*0.62, displayWidth*0.52, displayHeight*0.62);
  triangle(displayWidth*0.5, displayHeight*0.7, displayWidth*0.4, displayHeight*0.6, displayWidth*0.6, displayHeight*0.6);
  //line(width/2, height/2-150, 180, 180) ;
  triangle(displayWidth*0.47, displayHeight*0.65, displayWidth*0.497, displayHeight*0.65, displayWidth*0.5, displayHeight*0.83);
  triangle(displayWidth*0.53, displayHeight*0.65, displayWidth*0.503, displayHeight*0.65, displayWidth*0.5, displayHeight*0.83);
  //triangle(width/2+50, height/2+150, width/2, height/2+320, width/2+2, height/2+150);
  color c=get(mouseX, mouseY);

  fill(tet);
  textSize(displayWidth*0.2);
  text("R", displayWidth*0.1, displayHeight*0.3);
  text("S", displayWidth*0.14, displayHeight*0.6);
  text("W", displayWidth*0.71, displayHeight*0.54);
  text("B", displayWidth*0.74, displayHeight*0.84);

  textSize(displayWidth*0.09);
  text("ight", displayWidth*0.27, displayHeight*0.3);
  text("oul", displayWidth*0.25, displayHeight*0.6);
  text("rong", displayWidth*0.88, displayHeight*0.54);
  text("ody", displayWidth*0.88, displayHeight*0.84);

  if (c==pic ) {
    textSize(80);
    fill(152, 109, 178);

    textSize(displayWidth*0.05);
    image(p1, displayWidth*0.30, displayHeight*0.22, displayWidth*0.4, displayWidth*0.15 );
    text("Open Me", displayWidth*0.5, displayHeight*0.38);

    if (mousePressed) {
      pic=color(15, 37, 64);
      girl=color(255);
      tet=color(152, 109, 178) ;
    }
  }

  if (!mousePressed) {
    if (frameCount==cnt2+200) {
      pic=color(0, 98, 132);
      girl=color(0, 98, 132);
      tet=color(248, 195, 205);
    }
  }

  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
}

void keyReleased(){
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
