import interfascia.*;
GUIController c;
IFButton division, subtraction, addition, multiplication, notmath;
int score = 0;
int x;
int y;
//Subtraction variables
int subincorrectanswers;
int subcorrectanswers;
float subaverage;
String subcorrectanswer;
int subintegercorrect;
int subrandominteger;
//Addition variables
int correctanswers;
int incorrectanswers;
int randomintegeradded; 
int integercorrect;
String correctanswer = ""; 
float average;
//Multiplication variables
int mulincorrectanswers;
int mulcorrectanswers;
float mulaverage;
String mulcorrectanswer;
int mulintegercorrect;
int mulrandominteger;
//Division variables
int divincorrectanswers;
int divcorrectanswers;
float divaverage;
String divcorrectanswer;
int divintegercorrect;
int divrandominteger;
//Other stuffs
String text1="";
int finite = int(random(2, 10));
int answer = 0;
boolean title = true;
int ran;
int decider = 5;
int ran2;

boolean main = true;
//Integer.toString(16, 8);
void setup() {
  PFont f = createFont("Georgia", 15);
  textFont(f);
  size (600, 600); 
  background(10);
  Buttons();
  ResetMathQuestion();
}
void draw() {
  PFont f = createFont("Georgia", 15);
  textFont(f);
  DisplayQuestions();
}
void Buttons() {
  c = new GUIController (this);
  division = new IFButton ("Division", 240, 583, 80, 17);
  notmath = new IFButton ("Non-Math", 320, 583, 80, 17);
  addition = new IFButton ("Addition", 0, 583, 80, 17);
  subtraction = new IFButton ("Subtraction", 80, 583, 80, 17);
  multiplication = new IFButton ("Multiplication", 160, 583, 80, 17);
  addition.addActionListener(this);
  notmath.addActionListener(this);
  division.addActionListener(this);
  subtraction.addActionListener(this);
  c.add (addition);
  c.add (division);
  c.add (subtraction);
  c.add (multiplication);
  c.add (notmath);
}
void DisplayQuestions() {
  if (decider == 1) {
    fill(255);
    background(0);
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
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
  }
  if (decider == 2) {
    fill(255);
    background(0);
    textSize(15);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in finite field " + finite + " Correct answer is : " + subcorrectanswer, 10, 35);
    text("Incorrect responses: " + subincorrectanswers + " Correct responses: " + subcorrectanswers + " Your average is: " + (String.format("%.2f", subaverage)) + "%", 125, 100);
    answer = int(text1); 
    //Displaying question.
    String randominteger = str(ran);
    String randominteger2 = str(ran2);
    String sal = randominteger  + " - " +   randominteger2 + " = " + text1;
    text(sal, 10, 60); 
    text("Your score is " + score, 10, 100);
    subcorrectanswer = Integer.toString(subrandominteger, finite);
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
  }
  if (decider == 3) {
    fill(255);
    background(0);
    textSize(15);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in finite field " + finite + " Correct answer is : " + mulcorrectanswer, 10, 35);
    text("Incorrect responses: " + mulincorrectanswers + " Correct responses: " + mulcorrectanswers + " Your average is: " + (String.format("%.2f", mulaverage)) + "%", 125, 100);
    answer = int(text1); 
    //Displaying question.
    String randominteger = str(ran);
    String randominteger2 = str(ran2);
    String sal = randominteger  + " * " +   randominteger2 + " = " + text1;
    text(sal, 10, 60); 
    text("Your score is " + score, 10, 100);
    mulcorrectanswer = Integer.toString(mulrandominteger, finite);
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
  }
  if (decider == 4) {
    background(0);
    //  text("decider is 4. ", 10, 10);
    title = true;
  }
}
void CheckAnswer() {
  finite = int(random(2, 10));
  if (decider == 2) {
    subintegercorrect = int(subcorrectanswer);
    if (answer == subintegercorrect) {
      score += 10;
      subcorrectanswers++;
    } else {
      score -= 10;
      subincorrectanswers++;
    }
    text1 = "";
    ResetMathQuestion();
  }
  if (decider == 1) {
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
    if (decider == 3) {
    integercorrect = int(correctanswer);
    if (answer == mulintegercorrect) {
      score += 10;
      mulcorrectanswers++;
    } else {
      score -= 10;
      mulincorrectanswers++;
    }
    text1 = "";
    ResetMathQuestion();
  }
}
void keyPressed() {
  text1+=key;
  if (key==BACKSPACE) {
    if (text1.length()>0) {
      text1=text1.substring(0, text1.length()-2);
    }
  }
  if (decider == 1) {

    if (key == ENTER) {
      CheckAnswer();
      if (correctanswers == 0 && incorrectanswers ==0) {
        average =0;
      } else {
        average = (float(correctanswers)/(float(incorrectanswers)+float(correctanswers)))*100;
      }
    }
  } else if (decider == 2) {
    if (key == ENTER) {
      CheckAnswer();
      if (subcorrectanswers == 0 && subincorrectanswers ==0) {
        subaverage =0;
      } else {
        subaverage = (float(subcorrectanswers)/(float(subincorrectanswers)+float(subcorrectanswers)))*100;
      }
    }
  }
  else if (decider == 3) {
    if (key == ENTER) {
      CheckAnswer();
      if (mulcorrectanswers == 0 && mulincorrectanswers ==0) {
        mulaverage =0;
      } else {
        mulaverage = (float(mulcorrectanswers)/(float(mulincorrectanswers)+float(mulcorrectanswers)))*100;
      }
    }
  }
}
  void ResetMathQuestion() {
    ran = int(random(1, 10));
    ran2 = int(random(1, 10));
    subrandominteger = ran - ran2;
    randomintegeradded = ran + ran2;
  }
  void offscreen() {
    x -= 100000000;
    y-= 1000000;
  }
  void actionPerformed (GUIEvent e) {
    if (e.getSource() == addition) {
      decider = 1;
    } else if (e.getSource() == notmath) {
      background(100, 100, 130);
    } else if (e.getSource() == subtraction) {
      decider = 2;
    } else if (e.getSource() == multiplication) {
      decider = 3;
    } else if (e.getSource() == division) {
      background(100, 100, 130);
    }
  }