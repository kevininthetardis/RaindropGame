ArrayList<Missile> m = new ArrayList<Missile>();
ArrayList<Building> city = new ArrayList<Building>();
Shield s = new Shield(mouseX, 600);

void setup() {
  size(1600, 800);
  m.add(new Missile(random(width), 0));
  city.add(new Building());
}

void draw() {
  println(m.size());
  println(city.size());
  background(0);
  s.show();
  for (int j = city.size()-1; j>= 0; j--) {
    Building b = city.get(j);
    b.build();
    for (int i = m.size()-1; i >= 0; i--) {
      Missile miss = m.get(i);
      if(m.size() <=20){
          m.add(new Missile(random(width), 0));
      }
      miss.display();
      miss.fire();
      if (miss.loc.x > s.loc.x-200 && miss.loc.x < s.loc.x+200 && miss.loc.y > 550 && miss.loc.y < 600) {
        miss.deflected();
        s.isHit();
      }
      if (miss.loc.y < 0 || miss.loc.y >=height) {
        m.remove(i);
      }
    }
  }
}