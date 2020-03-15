// 章晴 2019-9-26
//会显示当前时间 没1000frmeCount 刷新一次
//想想实现北京椭圆的无规则运动，这个还没处理成功
import java.util.Calendar; 

int wth=600;
int leng=900;
int smallPoint, largePoint;

float mx;
float my;
float easing = 0.05;
int radius = 30;
int edge = 100;
int inner = edge + radius;

void setup() {
  size(1000, 700);
  smooth();
  smallPoint = 20;
  largePoint = 40;
  noStroke();
  background(255);

}

void draw() {
    int x = int(random(width));
    int y = int(random(leng));
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

      if (abs(mouseX - mx) > 0.1) {
        mx = mx + (mouseX - mx)*easing;
      }
      if (abs(mouseY - my) > 0.1) {
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
