class Confetti extends Particle {
  color A=color(236, 184, 138);         //粒子的颜色
  color B=color(203, 64, 66); 
  color C=color(165, 222, 228); 
  color D=color(193, 105, 60);
  color E=color(208, 90, 110); 
  color F=color(133, 72, 54); 
  Confetti(PVector l,int life,int rad) {
    super(l,life,rad);
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
    rect(location.x, location.y, r, r);
  }
}
