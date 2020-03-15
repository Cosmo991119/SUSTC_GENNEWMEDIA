// 章晴 2019-9-26

void setup() {
  size(900, 900);
  background(208, 90, 110);
  noStroke();
  noLoop();
}

void draw() {
   stroke(255);
   strokeWeight(10);
   line(width, height*0.3, 0, height*0.7);
  noStroke(); 
  drawTarget(width*0.5, height*0.3, 240, 10, 255, 255, 255);
  drawTarget(width*0.4, height*0.3, 140, 7, 255, 255, 255);
  drawTarget(width*0.6, height*0.3, 140, 7, 255, 255, 255);
  drawTarget(width*0.35, height*0.4, 190, 7, 255, 255, 255);
  drawTarget(width*0.65, height*0.4, 190, 7, 255, 255, 255);
  drawTarget(width*0.3, height*0.55, 240, 7, 255, 255, 255);
  drawTarget(width*0.7, height*0.55, 240, 7, 255, 255, 255);
  drawTarget(width*0.5, height*0.5, 340, 10, 255, 255, 255);
  drawTarget(width*0.35, height*0.67, 140, 3, 255, 255, 255);
  drawTarget(width*0.65, height*0.67, 140, 3, 255, 255, 255);


  drawTarget(width*0.5, height*0.3, 200, 3, 204, 84, 58);
  drawTarget(width*0.4, height*0.3, 100, 4, 219, 77, 109);
  drawTarget(width*0.6, height*0.3, 100, 4, 219, 77, 109);
  drawTarget(width*0.35, height*0.4, 150, 4, 159, 53, 58);
  drawTarget(width*0.65, height*0.4, 150, 4, 159, 53, 58);
  drawTarget(width*0.3, height*0.55, 200, 5, 203, 27, 69);
  drawTarget(width*0.7, height*0.55, 200, 5, 203, 27, 69);
  drawTarget(width*0.5, height*0.5, 300, 8, 208, 16, 76);



  stroke(255, 120);
  strokeWeight(1);
  line(width*0.35, height*0.7, width*0.37, height*0.8);
  line(width*0.65, height*0.7, width*0.63, height*0.8);
  line(width*0.37, height*0.8, width*0.5, height*0.9);
  line(width*0.63, height*0.8, width*0.5, height*0.9);
  line(width*0.35, height*0.7, width*0.39, height*0.73);
  line(width*0.62, height*0.73, width*0.65, height*0.7);
  strokeWeight(20);
  line(0, 0, width, height*0.3);
  line(0, height*0.7, width, height);

  noStroke();
  drawTarget(width*0.3, height*1.1, 300, 10, 255, 255, 255);
  drawTarget(width*0.3, height*1.1, 300, 8, 208, 16, 76);
    drawTarget(width*0.7, height*1.1, 300, 10, 255, 255, 255);
  drawTarget(width*0.7, height*1.1, 300, 8, 208, 16, 76);
  drawTarget(width*0.5, height, 440, 10, 255, 255, 255);
  drawTarget(width*0.5, height, 520, 8, 208, 16, 76);
  

  
}

void drawTarget(float xloc, float yloc, int size, int num, int r, int g, int b) {
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(r, g, b, i*20);
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}
