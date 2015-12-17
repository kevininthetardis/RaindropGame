class Raindrop {
  PVector loc, vel;
  float grav, diam, locx, locy;

  Raindrop(float locx, float locy) {
    loc = new PVector(locx, locy);
    vel = new PVector(0, random(1, 3));
    grav = 0.098;
    diam = 20;
  }

  void display() {
    noStroke();
    fill(230, 230, 255, 100);
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
    vel.y = random(1, 3);
  }

  boolean isInContactWith(PVector var) {
    if (loc.dist(var) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
}