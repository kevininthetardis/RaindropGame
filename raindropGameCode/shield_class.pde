class Shield {
  PVector loc; //location vector
  float notdiam, notdiam1, locx, locy; //diameters and coordinates

  Shield(float locx, float locy) { //x & y coordinates are parameters
    loc = new PVector(locx, locy); //location is at locx, locy
    notdiam = 200; //horizontal diameter is 200
    notdiam1 = 100; //vertical diameter is 100
  }

  void show() {
    fill(0); //shield is just an arc
    loc.set(mouseX, 400); //location is always at mouse x and y of 400
    stroke(200, 200, 255); //light blue
    strokeWeight(5); //stroke weight of 5
    arc(loc.x, loc.y, notdiam, notdiam1, PI, TWO_PI); //180 degree arc
  }
  
  void isHit(){
    fill(0); //shield is still just an arc
    loc.set(mouseX, 400); //location does not change
    stroke(255, 0, 0); //shield flashes bright red
    strokeWeight(5); //stroke weight does not change
    arc(loc.x, loc.y, notdiam, notdiam1, PI, TWO_PI); //shape does not change
  }
}