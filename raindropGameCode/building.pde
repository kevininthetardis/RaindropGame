class Building {
  float h, w, x, transp;

  Building() {
    h = random(40, 120);
    w = random(10, 20);
    x = random(width);
    transp = 255;
  }

  void build() {
    noStroke();
    fill(100, 200, 100, transp);
    rectMode(CORNERS);
    rect(x, height, x+w, height-h);
  }

  void destroyed() {
    transp=0;
  }
}