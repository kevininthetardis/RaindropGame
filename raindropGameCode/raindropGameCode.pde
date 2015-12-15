PVector mouse;   //declare a P
Raindrop r;      //declare a new Raindrop called r
Raindrop r2;
Raindrop[] muchrain = new Raindrop[50];
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Raindrop(random(width), 0); //Initialize r. The parameters used are the initial x and y positions
  r2 = new Raindrop(random(width), 0);
  for(int i = 0; i < 50; i++){
    muchrain[i] = new Raindrop(random(width), 0);
  }
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(50, 50, 60);
  r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r2.fall();
  for(int i = 0; i < 50; i++){
    muchrain[i].fall();
    muchrain[i].display();
    if(muchrain[i].isInContactWith(mouse)) {
      muchrain[i].reset();
    }
    if(muchrain[i].loc.y > height + muchrain[i].diam/2) {
      muchrain[i].reset();
    }
  }
  r.display();      //display the raindrop
  r2.display();
  if (r.isInContactWith(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r.reset();                         //if it is, reset the raindrop
  }
  if (r2.isInContactWith(mouse)) {
    r2.reset();
  }
  if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r.reset();                           //if it does, reset the raindrop
  }
  if (r2.loc.y > height + r2.diam/2) {
    r2.reset();
  }
}