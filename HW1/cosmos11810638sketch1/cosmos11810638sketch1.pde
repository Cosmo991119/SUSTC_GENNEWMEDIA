// 章晴 2019-9-26


PImage img;
int smallPoint, largePoint;

float mx;
float my;
float easing = 0.05;
int radius = 30;
int edge = 100;
int inner = edge + radius;

void setup() {
  size(900, 600);
  img = loadImage("834.jpg");
  smallPoint = 20;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(255);
  //ellipseMode(RADIUS);
  //rectMode(CORNERS);
}

void draw() {  
  if (frameCount%1800==1) {
    fill(78,79,151,int(random(1,150)));
    rect(0,0,900, 600);
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
    rect(295, 480, 310,35);
    fill(208, 16,76);  
    ellipse(mx, my, radius, radius);

    //float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);
    fill(pix, 120);
    ellipse(x, y, (mx-220)/10, (mx-220)/10);
  }
}
