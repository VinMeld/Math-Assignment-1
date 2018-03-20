int score = 0;
String text1="";
boolean again = false;
int ran =int(random(1, 10));
int ran2 =int(random(1, 10));
String randominteger = str(ran);
String randominteger2 = str(ran2);
void setup() {
  size (600, 600); 
  background(10);
  
}
void draw() {
  PFont f = createFont("Georgia", 15);
  textFont(f);
  textSize(15);
  text("Hi, this is an amzing program because I made it. It's a series of math questions.", 10, 15);
  text("As you can see you can change screens. I am LIT like that.", 10, 35);
  math();
}
void math() {


  String sal = randominteger  + " + " +   randominteger2 + " = " + text1;
  int answer = int(text1);
  text(sal, 10, 60);
  if (answer == ran + ran2) {
    score = 100;
  }
  text(score, 100, 100);
}
void keyPressed() {
  text1+=key;
  if (key==BACKSPACE) {
    if (text1.length()>0) {
      text1=text1.substring(0, text1.length()-1);
    }
  }
}