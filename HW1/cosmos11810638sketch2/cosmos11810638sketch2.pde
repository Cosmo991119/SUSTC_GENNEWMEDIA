// 章晴 2019-9-26

void setup() {
  size(900, 600);
  background(208, 90, 110);
  noStroke();
  noLoop();
}

void draw() {
 
  drawTarget(width*0.5, height*0.3, 240, 10,255,255,255);
  drawTarget(width*0.4, height*0.7, 90, 7,255,255,255);
  drawTarget(width*0.6, height*0.7, 90, 7,255,255,255);
  drawTarget(width*0.4, height*0.3, 140, 7,255,255,255);
  drawTarget(width*0.6, height*0.3, 140, 7,255,255,255);
  drawTarget(width*0.35, height*0.4, 190, 7,255,255,255);
  drawTarget(width*0.65, height*0.4, 190, 7,255,255,255);
  drawTarget(width*0.3, height*0.55, 240, 7,255,255,255);
  drawTarget(width*0.7, height*0.55, 240, 7,255,255,255);
  drawTarget(width*0.5, height*0.5, 340, 10,255,255,255);
  drawTarget(width*0.35, height*0.67, 140, 3,255,255,255);
  drawTarget(width*0.65, height*0.67, 140, 3,255,255,255);
  

  drawTarget(width*0.5, height*0.3, 200, 3,204,84,58);
  drawTarget(width*0.4, height*0.7, 50, 5,108,73,91);
  drawTarget(width*0.6, height*0.7, 50, 5,108,73,91);
  drawTarget(width*0.4, height*0.3, 100, 4,219,77,109);
  drawTarget(width*0.6, height*0.3, 100, 4,219,77,109);
  drawTarget(width*0.35, height*0.4, 150, 4,159,53,58);
  drawTarget(width*0.65, height*0.4, 150, 4,159,53,58);
  drawTarget(width*0.3, height*0.55, 200, 5,203,27,69);
  drawTarget(width*0.7, height*0.55, 200, 5,203,27,69);
  drawTarget(width*0.5, height*0.5, 300,8,208,16,76);
  //drawTarget(width*0.35, height*0.67, 100, 3);
  //drawTarget(width*0.65, height*0.67, 100, 3);


}

void drawTarget(float xloc, float yloc, int size, int num,int r,int g,int b) {
  //float grayvalues = 255/num;
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(r,g,b,i*20);
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}
