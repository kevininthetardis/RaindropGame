class Building {
  float h, w, x; //height, width, x coordinate

  Building() {
    h = random(40, 120); //height varies between 40 and 120
    w = random(10, 20); //width varies betweeen 10 and 20
    x = random(width); //building can have any x coordinate on the canvas
  }

  void build() {
    noStroke(); //no stroke
    fill(100, 200, 100); //greenish fill
    rectMode(CORNERS); //draw from bottom left corner
    rect(x, height, x+w, height-h); //building with specified h/w/x on the bottom of canvas
  }
}