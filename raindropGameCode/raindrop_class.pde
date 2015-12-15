class Raindrop {
  PVector loc, vel;
  float grav, diam, locx, locy;

  Raindrop(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector(0, 1);
    grav = 0.098;
    diam = 20;
  }

  void display() {
    noStroke();
    fill(255, 255, 255, 100);
    ellipse(loc.x, loc.y, diam, diam);
    triangle(loc.x-diam/2, loc.y, loc.x, loc.y-diam, loc.x+diam/2, loc.y);
  }

  void fall() {
    loc.add(vel);
    vel.y += grav;
  }

  void reset() {
    loc.x = random(width);
    loc.y = 0;
    vel.y = 1;
  }

  boolean isInContactWith(PVector var) {
    if (loc.dist(var) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
}