ArrayList<Missile> m = new ArrayList<Missile>();
ArrayList<Building> city = new ArrayList<Building>();
Shield s = new Shield(mouseX, 400);
float runtime;
float reset;
float score;

void setup() {
  size(1200, 600);
  m.add(new Missile(random(width), 0));
  score = 0;
  runtime = 0;
  while (city.size() <= 20) {
    city.add(new Building());
  }
}

void draw() {
  //if (ded < 21) {
  background(0);
  runtime += frameRate;
  score = runtime;
  fill(255);
  textSize(20);
  text("Surviving Buildings:",0,25);
  text(city.size(), 0, 50);
  text("Score:",width-100,25);
  text(score,width-100,50);
  s.show();
  for (int i = 0; i <city.size(); i++) {
    Building b = city.get(i);
    b.build();
  }
  for (int i = m.size()-1; i >= 0; i--) {
    Missile miss = m.get(i);
    if (m.size() <=10) {
      m.add(new Missile(random(width), 0));
    }
    miss.display();
    miss.fire();
    if (miss.loc.x > s.loc.x-100 && miss.loc.x < s.loc.x+100 && miss.loc.y > 350 && miss.loc.y < 400) {
      miss.deflected();
      s.isHit();
    }
    if (miss.loc.y < 0 || miss.loc.y >=height) {
      m.remove(i);
    }
    for (int j = city.size()-1; j >= 0; j--) {
      Building target = city.get(j);
      if (miss.loc.y >= height-target.h && miss.loc.x >= target.x && miss.loc.x <= target.x+target.w) {
        city.remove(j);
        score -= 500000/millis();
        //ded += 1;
      }
    }
  }
  //}
  if (city.size() == 0) {
    background(0);
    fill(255, 0, 0);
    textSize(50);
    text("game over they ded", width/2, height/2);
    textSize(10);
    text("press 'r' key to restart", width/2, height-100);
    text("Final score:",0,25);
    text(score,0,50);
    score +=0;
    score=0;
    if (keyPressed && key == 'r') {
      while (city.size() <= 20) {
        city.add(new Building());
        reset = runtime;
        runtime -= reset;
      }
    }
  }
}