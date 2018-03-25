int lifecount = 3;
int start;
int howfarback = int(random(400, 800));
final static short DIM = 50, SPD = 4, BOLD = 4;
final static short FLOOR = 215, JUMP = 125;
static int dir, y = FLOOR;
static int x = 25;
int closer = 400;
int timer;
int ybig = 215;
boolean alive = true;
int rectdecider = 1;//int(random(1, 3));
void setup() {
  size(600, 600); 
  background(10);
  noStroke();
  start = millis();
}

void draw() {
  if (alive == true) {
    background(10);
    timer = millis()-start;
    text(timer, 20, 20);
    if (dir != 0)  move();
    rect(x, y, DIM, DIM);
    text("You have " + lifecount + " lives", 100, 10);
    Challenges();
  }else{
    Gameover();
  }
}
void Gameover() {
  background(10);
  text("YOU LOSE PRESS ANY KEY TO CONTINUE", 300, 300);
}
void Challenges()
{
  if (rectdecider == 1) {
    rect(closer, ybig, 80, 150);
    closer-=2;
    if (timer >= 1000 && timer <= 1999) {
      closer -=4;
    } else if (timer >= 2000 && timer <= 4999) {
      closer-=6;
    } else if (timer >= 5000) {
      closer-=8;
    }
    if (closer <= 0) {
      closer += howfarback;
    }
    if (closer <= x && ybig <= y) {
      closer += 400;
      lifecount -=1;
    }
  }
  if (lifecount == 0) {
    alive = false;
  }
}
void keyPressed() {
  if (dir == 0)  dir = -SPD;
  if (alive == false){
    timer = 0;
    alive = true;
    lifecount = 3;
    start = millis();
  }
}

void mousePressed() {
  keyPressed();
}
static void move() {
  if ((y += dir) < JUMP)  dir *= -1;
  else if (y > FLOOR) {
    dir = 0;
    y = FLOOR;
  }
}