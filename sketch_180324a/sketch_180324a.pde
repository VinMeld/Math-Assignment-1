PImage calm, plus, background, lives;
int lifecount = 3;
int start;
final static short DIM = 50, SPD = 4, BOLD = 4;
final static short FLOOR = 215, JUMP = 145;
static int dir, y = FLOOR;
static int x = 25;
int closer = 400;
int timer;
int ybig = 215;
boolean alive = true;
int rectdecider = 1;//int(random(1, 3));
void setup() {
  background = loadImage("Math.jpg");
  image(background, 300, 300, 600, 600);
  size(600, 600); 
  background(10);
  noStroke();
  start = millis();
  calm = loadImage("Calm.png");
  plus = loadImage("Plussign.png");
  lives = loadImage("lives.png");
}

void draw() {
  if (alive == true) {
    image(background, 0, 0, 600, 600);
    timer = millis()-start;
    text(timer, 20, 20);
    if (dir != 0)  move();
    image(calm, x, y, DIM, DIM);
    Challenges();
    Lifecontrol();
  } else {
    Gameover();
  }
}
void Lifecontrol(){
  if (lifecount ==3) {
      image(lives, 100, 10, 40, 40);
      image(lives, 140, 10, 40, 40);
      image(lives, 180, 10, 40, 40);
    } else if (lifecount ==2 ) {
      image(lives, 140, 10, 40, 40);
      image(lives, 180, 10, 40, 40);
    } else if (lifecount ==1) {
      image(lives, 180, 10, 40, 40);
    }
}
void Gameover() {
  background(10);
  text("RETRY PRESS ANY KEY TO CONTINUE YOUR TIME WAS " + timer, 100, 300);
}
void Challenges()
{
  int howfarback = int(random(400, 800));

  if (rectdecider == 1) {
    image(plus, closer, ybig, 80, 150);
    closer-=2;
    if (timer >= 1000 && timer <= 1999) {
      closer -=4;
    } else if (timer >= 2000 && timer <= 4999) {
      closer-=6;
    } else if (timer >= 5000 && timer <=10000) {
      closer-=8;
    }else if (timer >= 10001){
     closer -=11; 
    }
    if (closer <= 0) {
      closer += howfarback;
    }
    if (closer <= x && ybig <= y+30) {
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
  if (alive == false) {
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