int score = 0;
String text1="";
int answer = 0;
boolean again = false;
int ran;
int ran2;
//Integer.toString(16, 8);
void setup() {
  size (600, 600); 
  background(10);
  ResetMathQuestion();
}
void draw() {
  background(10);
  PFont f = createFont("Georgia", 15);
  textFont(f);
  textSize(15);
  text("Hi, this is an amzing program because I made it. It's a series of math questions.", 10, 15);
  text("As you can see you can change screens. I am cool like that.", 10, 35);
  answer = int(text1);
  //Displaying question.
  String randominteger = str(ran);
  String randominteger2 = str(ran2);
  String sal = randominteger  + " + " +   randominteger2 + " = " + text1;
  text(sal, 10, 60); 
  text("Your score is " + score, 10, 100);
}
void CheckAnswer() {
  if (answer == ran + ran2) {
    score += 10;
  } else {
    score -= 10;
  }
  text1 = "";
  ResetMathQuestion();
}
void keyPressed() {
  text1+=key;
  if (key==BACKSPACE) {
    if (text1.length()>0) {
      text1=text1.substring(0, text1.length()-2);
    }
  }
  if (key == ENTER) {
    CheckAnswer();
  }
}

void ResetMathQuestion() {
  ran = int(random(1, 10));
  ran2 = int(random(1, 10));
}