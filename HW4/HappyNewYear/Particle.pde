class Particle {
  PVector location;               //粒子的位置
  PVector velocity;               //粒子的速度
  PVector acceleration;           //粒子的加速度
  float mass;                     //粒子的质量
  float lifespan;   
  int r;//粒子的生命周期


  color A=color(236, 184, 138);         //粒子的颜色
  color B=color(203, 64, 66); 
  color C=color(165, 222, 228); 
  color D=color(193, 105, 60);
  color E=color(208, 90, 110); 
  color F=color(133, 72, 54); 
  //粒子的初始化方式，给定位置的初始化，和随机位置的初始化
  Particle() {
    location = new PVector(displayWidth*random(1), displayHeight*random(1));
    velocity = new PVector(random(-1, 1), random(-2, 0));
    acceleration = new PVector(0, 0);
    mass = 1;
    lifespan =400;
  }
  Particle(PVector l, int life ,int rad) {
    location = l.get();
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    mass = 1;
    lifespan = life;
    r=rad;
  }
  void applyForce(PVector force) {
    acceleration.add(PVector.div(force, mass));
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 40;
  }

  void display() {
    int number=int(random(7));

    if (number==1) {
      stroke(A, lifespan);
      fill(A, lifespan);
    } else if (number==2) {
      stroke(B, lifespan);
      fill(B, lifespan);
    } else if (number==3) {
      stroke(C, lifespan);
      fill(C, lifespan);
    } else if (number==4) {
      stroke(D, lifespan);
      fill(D, lifespan);
    } else if (number==5) {
      stroke(E, lifespan);
      fill(E, lifespan);
    } else if (number==6) {
      stroke(F, lifespan);
      fill(F, lifespan);
    }
    rect(location.x, location.y, r,r);

  }
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  void run() {
    update();
    display();
  }
}
