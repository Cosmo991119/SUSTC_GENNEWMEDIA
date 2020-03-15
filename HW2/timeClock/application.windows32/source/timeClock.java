import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Calendar; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class timeClock extends PApplet {

// 章晴 2019-9-26
//会显示当前时间 没1000frmeCount 刷新一次
//想想实现北京椭圆的无规则运动，这个还没处理成功
 

int wth=600;
int leng=900;
int smallPoint, largePoint;

float mx;
float my;
float easing = 0.05f;
int radius = 30;
int edge = 100;
int inner = edge + radius;

public void setup() {
  
  
  smallPoint = 20;
  largePoint = 40;
  noStroke();
  background(255);

}

public void draw() {
    int x = PApplet.parseInt(random(width));
    int y = PApplet.parseInt(random(leng));
    Bg ellip=new Bg(x,y);
    ellip.mov();
    ellip.display();
  
    Calendar c = Calendar.getInstance();

    int year = c.get(Calendar.YEAR); 
    int month = c.get(Calendar.MONTH); 
    int date = c.get(Calendar.DATE);

    int hour = c.get(Calendar.HOUR_OF_DAY); 
    int minute = c.get(Calendar.MINUTE); 
    int second = c.get(Calendar.SECOND); 


    if (frameCount%1000==0) {
      fill(255);
      rect(0, 0, 1000, 700);
    } else {

      if (abs(mouseX - mx) > 0.1f) {
        mx = mx + (mouseX - mx)*easing;
      }
      if (abs(mouseY - my) > 0.1f) {
        my = my + (mouseY- my)*easing ;
      }

      mx = constrain(mx, 320, 580);
      my = constrain(my, 500, 500);
      fill(255);
      rect(295, 480, 310, 35);
      fill(208, 16, 76);
    }

    ellipse(mx, my, radius, radius);

    TimeLable timeLable=new TimeLable(hour, minute, second, wth, leng, mx);
    timeLable.buildDots();
  
}
class Bg{
  float x;
  float y;
  float w;
  float speed;
  float life= 255;
  
  Bg(float X,float Y){
    this.x=X;
    this.y=Y;

  }
  
  public void mov(){
    y+=PApplet.parseInt(random(1,200));
  }
  
   public void display(){
    fill(78, 79, 151, PApplet.parseInt(random(1, 60)));
    ellipse(x, y, PApplet.parseInt(random(1, 70)), PApplet.parseInt(random(1, 70)));
   }
}
class TimeLable {
  int hour;
  int munite;
  int second;
  int with;
  int lth;
  float mx;

  int xStart;
  int yStart;
  int c;
  int gap;

  int distance=100;


  TimeLable (int hour, int munite, int second, int with, int lth, float mx) {
    this.hour=hour;
    this.munite=munite;
    this.second=second;
    this.with=with;
    this.lth=lth;
    this.mx=mx;
    this.xStart=with/2-140 ;
    this.yStart=lth/2-380;
 
  }

  public void buildDots() {
    int k=hour/10;
    gap=xStart-50;
    buildNum(k, gap);
    int mod=hour%10;
    gap=xStart+150;
    buildNum(mod, gap);

    int km=munite/10;
    gap=xStart+420;
    buildNum(km, gap);
    int modm=munite%10;
    gap=xStart+600;
    buildNum(modm, gap);
  }

  public void buildNum(int getNum, int gap) {
    switch (getNum) {
    case 1:
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      break;

    case 2:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap+90, gap+110, yStart-10, yStart+110);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap-10, gap+10, yStart+90, yStart+210);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      break;
    case 3:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      break;
    case 4:
      productDots(gap-10, gap+10, yStart-10, yStart+110);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      break;

    case 5:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap-10, gap+10, yStart-10, yStart+110);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap+90, gap+110, yStart+90, yStart+210);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      break;

    case 6:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap-10, gap+10, yStart-10, yStart+210);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap+90, gap+110, yStart+90, yStart+210);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      break;

    case 7:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      break; 

    case 8:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap-10, gap+10, yStart-10, yStart+210);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      break; 

    case 9:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap-10, gap+10, yStart-10, yStart+110);
      productDots(gap-10, gap+110, yStart+90, yStart+110);
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      break; 

    default:
      productDots(gap-10, gap+110, yStart-10, yStart+10);
      productDots(gap-10, gap+10, yStart-10, yStart+210);
      productDots(gap+90, gap+110, yStart-10, yStart+210);
      productDots(gap-10, gap+110, yStart+190, yStart+210);
      break;
    }
  }

  public void productDots(int x1, int x2, int y1, int y2) {
    int x = PApplet.parseInt(random(x2-x1))+x1;
    int y = PApplet.parseInt(random(y2-y1))+y1;

    int j = (int)random(0, 2);

    if (j==0) c = color(105,176,172,150);
    if (j==1) c = color(255,120);

    fill(c, 120);
    ellipse(x, y, (mx-320)/10, (mx-320)/10);
  }

  public void buildPointLocation() {
    for (int j=0; j<8; j++) {
      fill(120);
      if (j==2||j==6) {
        xStart+=70;
      } else if (j==4) {
        xStart+=150;
      } else {
        xStart+=100;
      }
    }
  }
}
  public void settings() {  size(1000, 700);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "timeClock" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
