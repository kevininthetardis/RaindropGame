class Missile {
  PVector loc, vel;
  float diam, locx, locy, r, g, b;

  Missile(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector((random(-3, 3)), random(6, 8));
    diam = 10;
    r = 230;
    g = 230;
    b = 255;
  }

  void display() {
    noStroke();
    fill(r, g, b);
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fire() {
    loc.add(vel);
  }

  void deflected() {
    vel.y = -vel.y;
    rotate(PI);
    display();
  }
  void boom() {
    fill(0);
    ellipse(loc.x, loc.y, 50, 50);
    vel.x = 0;
    vel.y = 0;
    loc.y = height;
    diam = 50;
    r = 0;
    g = 0;
    b = 0;
  }
  void reset() {
    loc.x= 0;
    loc.y = 0;
    vel.x = random(-3, 3);
    vel.y = random(6, 8);
  }

  boolean isInContactWith(PVector var) {
    if (loc.dist(var) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
}