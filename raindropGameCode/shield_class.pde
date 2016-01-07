class Shield {
  PVector loc;
  float notdiam, locx, locy;

  Shield(float locx, float locy) {
    loc = new PVector(locx, locy);
    notdiam = 50;
  }

  void show() {
    fill(0);
    loc.set(mouseX, 600);
    stroke(200, 200, 255);
    strokeWeight(5);
    arc(loc.x, loc.y, 500, 100, PI, TWO_PI);
  }
}