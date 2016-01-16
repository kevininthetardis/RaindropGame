ArrayList<Missile> m = new ArrayList<Missile>();
ArrayList<Building> city = new ArrayList<Building>();
Shield s = new Shield(mouseX, 400);

void setup() {
  size(1200, 600);
  m.add(new Missile(random(width), 0));
  city.add(new Building());
}

void draw() {
  println(m.size());
  println(city.size());
  background(0);
  s.show();
  if(city.size() <= 20){
    city.add(new Building());
  }
  for (int j = city.size()-1; j>= 0; j--) {
    Building b = city.get(j);
    b.build();
  }
  for (int i = m.size()-1; i >= 0; i--) {
      Missile miss = m.get(i);
      if(m.size() <=10){
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
    }
    if(m.loc.y >= city.loc.y && m.loc.x >= city.loc.x && m.loc.x <= city.loc.x+city.w){
      city.destroyed();
    }
}