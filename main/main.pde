int score = 0;
String text1="";
int finite = int(random(2, 10));
int answer = 0;
int correctanswers;
int incorrectanswers;
int randomintegeradded; 
int integercorrect;
int ran;
int ran2;
float average;
String correctanswer = ""; 
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
  text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
  text("You are in finite field " + finite + " Correct answer is : " + correctanswer, 10, 35);
  text("Incorrect responses: " + incorrectanswers + " Correct responses: " + correctanswers + " Your average is: " + average + "%", 125,100);
  answer = int(text1); 
  //Displaying question.
  String randominteger = str(ran);
  String randominteger2 = str(ran2);
  String sal = randominteger  + " + " +   randominteger2 + " = " + text1;
  text(sal, 10, 60); 
  text("Your score is " + score, 10, 100);
  correctanswer = Integer.toString(randomintegeradded, finite);
}
void CheckAnswer() {
  finite = int(random(2, 10));
  integercorrect = int(correctanswer);
  if (answer == integercorrect) {
    score += 10;
    correctanswers++;
  } else {
    score -= 10;
    incorrectanswers++;
  }
  average = correctanswers/(incorrectanswers+correctanswers)*100;
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
  randomintegeradded = ran + ran2;
}