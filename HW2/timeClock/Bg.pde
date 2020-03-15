class Bg{
  float x;
  float y;
  float w;
  float speed;
  float life= 255;
  
  Bg(float X,float Y){
    this.x=X;
    this.y=Y;

  }
  
  void mov(){
    y+=int(random(1,200));
  }
  
   void display(){
    fill(78, 79, 151, int(random(1, 60)));
    ellipse(x, y, int(random(1, 70)), int(random(1, 70)));
   }
}
