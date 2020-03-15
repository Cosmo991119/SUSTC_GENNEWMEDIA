// 章晴 2019-9-26
//移动鼠标可以转动图形，图形会以cos的方式缩小放大，点击左键可以缩小图形，
//图形的颜色方块做了一个呼吸的效果，本来想换颜色，结果出来的效果太鬼畜了
import ComputationalGeometry.*;
IsoSkeleton skeleton;

PVector[] pts = new PVector[100];

void setup() {
  size(900, 900, P3D);
 
  // Create iso-skeleton
  skeleton = new IsoSkeleton(this);

  // Create points to make the network
    
  for (int i=0; i<pts.length; i++) {
    pts[i] = new PVector(random(-100, 100), random(-100, 100), random(-100, 100) );
  }  

  for (int i=0; i<pts.length; i++) {
    for (int j=i+1; j<pts.length; j++) {
      if (pts[i].dist( pts[j] ) < 60) {

        skeleton.addEdge(pts[i], pts[j]);
      }
    }
  }
}

void draw() {
  background(145,152,159);
  lights();

  int pix;
  if (frameCount%40<=20){
    fill(171,59,58,frameCount%40*10);
  }else if(frameCount%40<=40){
    pix=-frameCount%20;
    fill(171,59,58,400-frameCount%40*10);
  }
  
               

  int k=(int) random(0,pts.length);
  pts[k]= new PVector(random(-100, 100), random(-100, 100), random(-100, 100) );
  
    for (int i=0; i<pts.length; i++) {
      if (pts[k].dist( pts[i] ) < 60) {
        skeleton.addEdge(pts[k], pts[i]);
    }
  }
  float zm=200;
  
  if (mousePressed){
    zm+=80;
  };
  
  float sp = 0.005 * frameCount;
  camera(mouseX/100 * cos(sp), zm * sin(sp), zm,0, 0, 0, mouseX/100, mouseY/100, -1);
  
  skeleton.plot(10.f * float(mouseX) / (2.0f*width), float(mouseY) / (2.0*height));  // Thickness as parameter
}
