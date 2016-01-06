int c = 20;
int pop = 30;
PVector mouse;   //declare a P
Missile r;      //declare a new Raindrop called r
Missile r2;
Missile[] muchrain = new Missile[c];
Shield b;
Building[] city = new Building[pop];
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  b = new Shield(mouseX, 600);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Missile(random(width), 0); //Initialize r. The parameters used are the initial x and y positions
  r2 = new Missile(random(width), 0);
  for (int i = 0; i < c; i++) {
    muchrain[i] = new Missile(random(width), 0);
  }
  for(int i = 0; i < pop; i++){
    city[i] = new Building(random(10,50), random(5,15), random(width));
  }
}

void draw() {
  background(50, 50, 60);
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  r.fire();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r2.fire();
  for (int i = 0; i < c; i++) {
    muchrain[i].fire();
    muchrain[i].display();
    if (muchrain[i].isInContactWith(mouse)) {
      muchrain[i].deflected();
    }
    if (muchrain[i].loc.y > height + muchrain[i].diam/2) {
      muchrain[i].boom();
    }
    for(int j = 0; j < pop; j++){
      city[j].build();
      if(muchrain[i].loc.y >= city[j].h && muchrain[i].loc.x >= city[j].x && muchrain[i].loc.x <= (city[j].x+city[j].w)){
        city[j].destroyed();
      }
  }
  r.display();      //display the raindrop
  r2.display();
  if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r.deflected();                         //if it is, reset the raindrop
  }
  if (r2.isInContactWith(mouse)) {
    r2.deflected();
  }
  if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r.boom();                           //if it does, reset the raindrop
  }
  if (r2.loc.y > height + r2.diam/2) {
    r2.boom();
  }
  b.show();
}