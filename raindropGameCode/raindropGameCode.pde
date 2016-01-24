ArrayList<Missile> m = new ArrayList<Missile>(); //creates array list of missiles
ArrayList<Building> city = new ArrayList<Building>(); //creates array list of buildings
Shield s = new Shield(mouseX, 400); //creates shield
float runtime; //these two variables deal with the score
float score;

void setup() {
  size(1200, 600); //canvas 1200 by 600
  m.add(new Missile(random(width), 0));
  score = 0; //these two lines ensure score starts at zero
  runtime = 0;
  while (city.size() <= 20) { //start game with 20 buildings
    city.add(new Building());
  }
}

void draw() {
  background(0); //black background
  runtime += frameRate/1000; //score is based on frame rate and will increase consistent with time
  score += runtime;
  fill(255); //white fill
  textSize(20); //size 20 text
  text("Surviving Buildings:", 0, 25); //displays how many buildings remain
  text(city.size(), 0, 50);
  text("Score:", width-100, 25); //displays score
  text(score, width-100, 50);
  s.show(); //draws shield
  for (int i = 0; i <city.size(); i++) {
    Building b = city.get(i); //build the buildings from the array list
    b.build();
  }
  for (int i = m.size()-1; i >= 0; i--) {
    Missile miss = m.get(i);
    if (m.size() <=10) {
      m.add(new Missile(random(width), 0)); //ensures there are always 10 missiles on screen
    }
    miss.display(); //draw missile
    miss.fire(); //fire (move) missile
    if (miss.loc.x > s.loc.x-s.notdiam/2 && miss.loc.x < s.loc.x+s.notdiam/2 && miss.loc.y > s.loc.y-s.notdiam1/2 && miss.loc.y < 400) {
      miss.deflected(); //missile bounces off shield if it hits it
      s.isHit(); //shield flashes red when hit
    }
    if (miss.loc.y < 0 || miss.loc.y >=height) {
      m.remove(i); //if the missile gets to the bottom, it's removed
    }
    for (int j = city.size()-1; j >= 0; j--) {
      Building target = city.get(j);
      if (miss.loc.y >= height-target.h && miss.loc.x >= target.x && miss.loc.x <= target.x+target.w) {
        city.remove(j); //building is destroyed if it gets hit by a missile
        score -= 500000/millis(); //penalty for losing a building
      }
    }
  }
  if (city.size() <= 5 && city.size() > 1) { //shield shrinks once only 5 buildings remain
    s.notdiam = 75;
    s.notdiam1 = 50;
  }
  if (city.size() == 1) { //with one building left, it gets way harder
    s.notdiam = 50;
    s.notdiam1 = 25;
  }
  if (city.size() == 0) { //if all the buildings have been hit
    runtime*=0; //score should stop increasing (not sure why it still does???)
    background(0); //black background
    fill(255, 0, 0); //red fill 
    textSize(50); //size 50 text
    text("game over they ded", width/2, height/2); //helpfully inform the player that the entire city has died a horrible death
    textSize(10); //size 10 text
    text("press 'r' key to restart", width/2, height-100); //tell player to restart
    textSize(20); //size 20 text
    text("Final score:", 0, 25); //show the player their score
    text(score, 0, 50);
    if (keyPressed && key == 'r') { //if the player wants to embark on this quixotic mission again
      score = 0; //score resets to 0
      runtime = 0;
      while (city.size() <= 20) { //city is built again
        city.add(new Building());
      }
    }
  }
}