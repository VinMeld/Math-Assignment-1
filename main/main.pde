int score = 0;
String text1="";
int finite = int(random(2, 10));
int answer = 0;
boolean addition = true;
int correctanswers;
int incorrectanswers;
int randomintegeradded; 
int integercorrect;
int ran;
int decider;
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
 fill(255);
rect(100,50,150,80);
   
  if (mousePressed) {
    if (mouseX>100 && mouseX <100+150 && mouseY>50 && mouseY <50+80) {
      println("The mouse is pressed and over the button");
      fill(255);
      addition = true;
    }
  }
  background(10);
  if (addition == true) {
    PFont f = createFont("Georgia", 15);
    textFont(f);
    textSize(15);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in finite field " + finite + " Correct answer is : " + correctanswer, 10, 35);
    text("Incorrect responses: " + incorrectanswers + " Correct responses: " + correctanswers + " Your average is: " + (String.format("%.2f", average)) + "%", 125, 100);
    answer = int(text1); 
    //Displaying question.
    String randominteger = str(ran);
    String randominteger2 = str(ran2);
    String sal = randominteger  + " + " +   randominteger2 + " = " + text1;
    text(sal, 10, 60); 
    text("Your score is " + score, 10, 100);
    correctanswer = Integer.toString(randomintegeradded, finite);
  }
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
    if (correctanswers == 0 && incorrectanswers ==0) {
      average =0;
    } else {
      average = (float(correctanswers)/(float(incorrectanswers)+float(correctanswers)))*100;
    }
  }
}
void ResetMathQuestion() {
  ran = int(random(1, 10));
  ran2 = int(random(1, 10));
  randomintegeradded = ran + ran2;
}