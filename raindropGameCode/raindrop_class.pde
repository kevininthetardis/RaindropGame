class Missile {
  PVector loc, vel;
  float diam, locx, locy;

  Missile(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector((random(1,3)), random(6, 8));
    diam = 10;
  }

  void display() {
    noStroke();
    fill(230, 230, 255, 100);
    ellipse(loc.x, loc.y, 10, 50);
    triangle(loc.x-diam/2, loc.y, loc.x, loc.y-diam, loc.x+diam/2, loc.y);
  }

  void fire() {
    loc.add(vel);
  }

  void reset() {
    loc.x = random(width);
    loc.y = 0;
    vel.y = random(5, 7);
    vel.x = (random(-0.5,0.5));
  }

  boolean isInContactWith(PVector var) {
    if (loc.dist(var) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
}