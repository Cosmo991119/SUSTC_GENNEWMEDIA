// 章晴 2019-9-26
//点击鼠标会产生圆点状烟花。
//底部原点会根据傅里叶变换算出来的高跳跃
import java.util.*;
import processing.sound.*;

SoundFile sample;
FFT fft;
int bands = 128;

float smoothingFactor = 0.2;

float[] sum = new float[bands];
float barWidth;

int scale = 5;
ArrayList<ParticleSystem> systems;
PVector gravity;
Repeller repeller;
int cnt=0;
PImage p1;
PImage p2;

PFont font;

void setup() {

  font=createFont("Segoe Print",displayWidth*0.3);
  textFont(font);
  p1=loadImage("d.png");
  p2=loadImage("a.png");
  barWidth = width/float(bands);

  sample = new SoundFile(this, "newyear.mp3");
  sample.loop();

  fft = new FFT(this, bands);
  fft.input(sample);
  //size(800, 500);
  fullScreen(displayWidth);
  systems = new ArrayList<ParticleSystem>();
  repeller = new Repeller(width/2-20, height/2);
}
void draw() {

  background(254, 223, 225);


  if (mousePressed) {

    image(p1, mouseX-displayWidth*0.075, mouseY-displayWidth*0.075, displayWidth*0.15, displayWidth*0.15);
  }

  image(p2, mouseX-displayWidth*0.015, mouseY-displayWidth*0.015, displayWidth*0.03, displayWidth*0.03);

  if (cnt%40==0)
    systems.add(new ParticleSystem(new PVector( int(400*random(1)+200), int(200*random(1)+50)), 1000, 9));
  cnt=cnt+1;
  fft.analyze();
  for (int i = 0; i < bands; i++) {

    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;

    if ( 1.8*i*barWidth+displayWidth*0.02>displayWidth*0.05 && 1.8*i*barWidth+displayWidth*0.02<displayWidth*0.95) {
      systems.add(new ParticleSystem(new PVector(1.8*i*barWidth+displayWidth*0.02, -sum[i]*height*scale+height*0.9), 80, int(0.007*displayWidth)));

      int number=int(random(7));
      stroke(50);
      if (number==1) {
        fill(201, 152, 51, 150);
      } else if (number==2) {
        fill(173, 161, 66, 150);
      } else if (number==3) {
        fill(193, 138, 38, 150);
      } else if (number==4) {
        fill(112, 100, 154);
      } else if (number==5) {
        fill(159, 53, 58, 150);
      } else if (number==6) {
        fill(181, 73, 91, 150);
      }

      ellipse(1.8*i*barWidth+displayWidth*0.02, -sum[i]*height*scale+height*0.85, int(0.007*displayWidth), int(0.007*displayWidth));
    }
  }
  Iterator<ParticleSystem> it = systems.iterator();


  while (it.hasNext()) {
    ParticleSystem p = it.next();
    gravity = new PVector(random(-0.1, 0.1), random(-0.1, 0.2));
    p.applyRepeller(repeller);
    p.applyForce(gravity);
    p.run();
    p.addParticle();
    if (p.isDead()) {
      it.remove();
    }
  }
  repeller.display();

  textSize(displayWidth*0.02);
  text("by cosmos",displayWidth*0.75,displayHeight*0.95);
}
