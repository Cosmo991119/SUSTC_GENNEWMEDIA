class TimeLable {
  int hour;
  int munite;
  int second;
  int with;
  int lth;
  float mx;

  int xStart;
  int yStart;
  color c;
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

  void buildDots() {
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

  void buildNum(int getNum, int gap) {
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

  void productDots(int x1, int x2, int y1, int y2) {
    int x = int(random(x2-x1))+x1;
    int y = int(random(y2-y1))+y1;

    int j = (int)random(0, 2);

    if (j==0) c = color(105,176,172,150);
    if (j==1) c = color(255,120);

    fill(c, 120);
    ellipse(x, y, (mx-320)/10, (mx-320)/10);
  }

  void buildPointLocation() {
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
