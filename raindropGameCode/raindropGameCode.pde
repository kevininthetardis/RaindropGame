ArrayList<Missile> m = new ArrayList<Missile>();
ArrayList<Building> city = new ArrayList<Building>();
Shield s = new Shield(mouseX, 400);

void setup() {
  size(1200, 600);
  m.add(new Missile(random(width), 0));
  while (city.size() <= 20) {
    city.add(new Building());
  }
}

void draw() {
  println(city.size());
  background(0);
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
        target.destroyed();
      }
    }
  }
}