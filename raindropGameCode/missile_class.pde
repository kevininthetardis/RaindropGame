class Missile {
  PVector loc, vel; //location and velocity
  float diam, locx, locy; //diameter, x, y

  Missile(float locx, float locy) { //x & y coordinates are parameters
    loc = new PVector(locx, locy); //pvector at locx, locy
    vel = new PVector((random(-3, 3)), random(6, 8)); //velocity is random and has a greater y magnitude than x magnitude
    diam = 10; //diameter of 10
  }

  void display() {
    noStroke(); //no stroke
    fill(230, 230, 255); //light blue
    ellipse(loc.x, loc.y, diam, diam); //missiles are little circles
  }

  void fire() {
    loc.add(vel); //move at vel
  }

  void deflected() {
    vel.y = -vel.y; //missile bounces
    display();
  }
}