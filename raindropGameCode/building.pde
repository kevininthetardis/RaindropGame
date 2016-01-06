class Building{
  float h, w, x, transp;
  
  Building(float h, float w, float x){
    h = random(10, 50);
    w = random(5, 15);
    x = random(width);
    transp = 0;
  }
  
  void build(){
    fill(100,200,100, transp);
    rectMode(CORNERS);
    rect(x, height, x+w, height-h);
  }
  
  void destroyed(){
    transp=255;
  }
}
  