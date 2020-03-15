class Repeller {
  PVector location;
  float r = 10;
  float G = 100;
  float a;
  float b;
  Repeller(float x, float y) {
    location = new PVector(x, y);
  }
  void display() {
    stroke(0);

    for (int i=0; i<7; i++) {
      if (i<=2) {
        fill(0, 0);
        rect(displayWidth*0.15+displayWidth*0.1*i, displayHeight*0.4, displayHeight*0.03, displayHeight*0.1);
        fill(0);
        rect(displayWidth*0.15+displayWidth*0.1*i, displayHeight*0.4, displayHeight*0.02, displayHeight*0.1);
      } else {
        fill(0, 0);
        rect(displayWidth*0.22+displayWidth*0.1*i, displayHeight*0.4, displayHeight*0.03, displayHeight*0.1);
        fill(0);
        rect(displayWidth*0.22+displayWidth*0.1*i, displayHeight*0.4, displayHeight*0.02, displayHeight*0.1);
      }

      if (i==1 ) {
        a=displayWidth*0.15+displayWidth*0.1*i;
        b=displayHeight*0.4;
      } else if (i==4) {
        a=displayWidth*0.22+displayWidth*0.1*i;
        b=displayHeight*0.4;
      }
      rect(a, b, displayHeight*0.08, displayHeight*0.02);
      rect(a, b+displayWidth*0.025, displayHeight*0.08, displayHeight*0.02);
      rect(a, b+displayWidth*0.048, displayHeight*0.08, displayHeight*0.02);

      fill(0);
      triangle(displayWidth*0.167, displayHeight*0.4, displayWidth*0.167, displayHeight*0.5, displayWidth*0.2, displayHeight*0.5);
      triangle(displayWidth*0.167+displayWidth*0.1*2, displayHeight*0.4, displayWidth*0.167+displayWidth*0.1*2, displayHeight*0.5, displayWidth*0.39, displayHeight*0.4);
      triangle(displayWidth*0.39, displayHeight*0.4, displayWidth*0.422, displayHeight*0.4, displayWidth*0.422, displayHeight*0.5);
      triangle(displayWidth*0.237+displayWidth*0.1*5, displayHeight*0.4, displayWidth*0.237+displayWidth*0.1*5, displayHeight*0.5, displayWidth*0.77, displayHeight*0.5);
      triangle(displayWidth*0.237+displayWidth*0.1*6, displayHeight*0.4, displayWidth*0.237+displayWidth*0.1*6, displayHeight*0.46, displayWidth*0.87, displayHeight*0.4);

      fill(0, 0);
      triangle(displayWidth*0.237+displayWidth*0.1*2.5,  displayHeight*0.4, displayWidth*0.237+displayWidth*0.1*3.2,  displayHeight*0.4, displayWidth*0.237+displayWidth*0.1*2.9,  displayHeight*0.46);
      fill(255);
      rect(displayWidth*0.2, displayHeight*0.4, displayHeight*0.02, displayHeight*0.1);
      rect(displayWidth*0.422, displayHeight*0.4, displayHeight*0.02, displayHeight*0.1);
      ellipse(displayWidth*0.74, displayHeight*0.45,displayWidth*0.02, displayWidth*0.02);
    }

  }
  PVector repel(Particle p) {
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    d = constrain(d, 5, 100);
    dir.normalize();
    float force = -1*G/(d*d);

    dir.mult(force);
    return dir;
  }
}
