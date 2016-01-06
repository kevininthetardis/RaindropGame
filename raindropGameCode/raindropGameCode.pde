int c = 20;
int pop = 40;
int b = 0;
PVector mouse;   //declare a P
Missile m;      //declare a new Raindrop called r
Missile m2;
Missile[] muchrain = new Missile[c];
Shield s;
Building[] city = new Building[pop];
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  s = new Shield(mouseX, 600);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  m = new Missile(random(width), 0); //Initialize r. The parameters used are the initial x and y positions
  m2 = new Missile(random(width), 0);
  for (int i = 0; i < c; i++) {
    muchrain[i] = new Missile(random(width), 0);
  }
  for (int i = 0; i < pop; i++) {
    city[i] = new Building();
  }
}

void draw() {
  background(50, 50, 60);
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  m.fire();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  m2.fire();
  for (int i = 0; i < pop; i++) {
    city[i].build();
  }
  for (int i = 0; i < c; i++) {
    muchrain[i].fire();
    muchrain[i].display();
    if(muchrain[i].loc.y <=0){
      muchrain[i].reset();
    if (muchrain[i].loc.x >= mouseX-250 && muchrain[i].loc.x <= mouseX+250 && muchrain[i].loc.y >=550 && muchrain[i].loc.y >=600) {
      muchrain[i].deflected();
    }
    if (muchrain[i].loc.y > height + muchrain[i].diam/2) {
      muchrain[i].reset();
    }
    for (int j = 0; j < pop; j++) {
      if (muchrain[i].loc.y >= height-city[j].h && muchrain[i].loc.x >= city[j].x && muchrain[i].loc.x <= (city[j].x+city[j].w)) {
        city[j].destroyed();
        b += 1;
      }
    }
    m.display();      //display the raindrop
    m2.display();
    if (m.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      m.deflected();                         //if it is, reset the raindrop
    }
    if (m2.isInContactWith(mouse)) {
      m2.deflected();
    }
    if (m.loc.y > height + m.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      m.boom();                           //if it does, reset the raindrop
    }
    if (m2.loc.y > height + m2.diam/2) {
      m2.boom();
    }
    s.show();
  }
  if(b >= pop){
    background(0);
    fill(255,0,0);
    textSize(100);
    text("game over they ded", 0, height/2);
  }
}