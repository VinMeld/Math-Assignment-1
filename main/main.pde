/******************************************************************************************************************************************************************************************************************************************************* //<>//
 Name: Vinay Meldrum
 
 Purpose: For ICS3U class. Because I want a good mark.^
 
 Date: April...?
 
 What it does: It makes a math game with finite field using addition, subtraction, multiplication and division. Non-math game ...
 
 DataDictionary: 
 
 ******************************************************************************************************************************************************************************************************************************************************/
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
//Library for buttons
import interfascia.*;
//Creating the GUI
GUIController c;
//Making the "variables" type thing for the buttons.
IFButton division, subtraction, addition, multiplication, notmath;
//Defining integers.
//Integer for the score
int score = 0;

//Subtraction variables *******************************************************
//Incorrect answers for the subtraction portion.
int subincorrectanswers;
//correct answers for the subtraction portion.
int subcorrectanswers;
//Average fo subtraction.
float subaverage;
//Correct answer for the subtraction in a Sting.
String subcorrectanswer;
//Correct subtraction in a integer.
int subintegercorrect;
//Random integers subtracted together.
int subrandominteger;
int subscore;
//Addition variables*******************************************************
int correctanswers;
int incorrectanswers;
int randomintegeradded; 
int integercorrect;
String correctanswer = ""; 
float average;
//Multiplication variables ************************************************
int mulincorrectanswers;
int mulcorrectanswers;
float mulaverage;
String mulcorrectanswer;
int mulintegercorrect;
int mulrandominteger;
int mulscore;
//Division variables ******************************************************
int divincorrectanswers;
int divcorrectanswers;
float divaverage;
String divcorrectanswer;
int divintegercorrect;
int divrandominteger;
int divscore;
//Other stuffs
String text1="";
int finite = int(random(2, 10));
int answer = 0;
boolean title = true;
int ran;
int decider = 0;
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
  start = millis();
  calm = loadImage("Calm.png");
  plus = loadImage("Plussign.png");
  lives = loadImage("lives.png");
  background = loadImage("Math.jpg");
}
void draw() {
  PFont f = createFont("Georgia", 15);
  textFont(f);
  DisplayQuestions();
  if (decider == 5) {
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
}
void Lifecontrol() {
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
    } else if (timer >= 10001) {
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
  multiplication.addActionListener(this);
  c.add (addition);
  c.add (division);
  c.add (subtraction);
  c.add (multiplication);
  c.add (notmath);
}
void DisplayQuestions() {
  if (decider == 0) {
    PFont f = createFont("Arial", 15);
    textFont(f);
    text("Welcome to my program. Here you can navigate to various different elements of my", 10, 15); 
    text(" program. math with finite fields and non-math games! HAVE FUN.", 10, 30);
  }
  if (decider == 1) {
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
    text("Your score is " + subscore, 10, 100);
    subcorrectanswer = Integer.toString(subrandominteger, finite);
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
  }
  if (decider == 3) {
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
    text("Your score is " + mulscore, 10, 100);
    mulcorrectanswer = Integer.toString(mulrandominteger, finite);
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
  }
  if (decider == 4) {
    background(0);
    textSize(15);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in finite field " + finite + " Correct answer is : " + divcorrectanswer, 10, 35);
    text("Incorrect responses: " + divincorrectanswers + " Correct responses: " + divcorrectanswers + " Your average is: " + (String.format("%.2f", divaverage)) + "%", 125, 100);
    answer = int(text1); 
    //Displaying question.
    String randominteger = str(ran);
    String randominteger2 = str(ran2);
    String sal = randominteger  + " / " +   randominteger2 + " = " + text1;
    text(sal, 10, 60); 
    text("Your score is " + mulscore, 10, 100);
    divcorrectanswer = Integer.toString(divrandominteger, finite);
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
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
      subscore += 10;
      correctanswers++;
    } else {
      score -= 10;
      incorrectanswers++;
    }
    text1 = "";
    ResetMathQuestion();
  }
  if (decider == 3) {
    mulintegercorrect = int(mulcorrectanswer);
    if (answer == mulintegercorrect) {
      mulscore += 10;
      mulcorrectanswers++;
    } else {
      mulscore -= 10;
      mulincorrectanswers++;
    }
    text1 = "";
    ResetMathQuestion();
  }
  if (decider == 4) {
    divintegercorrect = int(divcorrectanswer);
    if (answer == divintegercorrect) {
      divscore += 10;
      divcorrectanswers++;
    } else {
      divscore -= 10;
      divincorrectanswers++;
    }
    text1 = "";
    ResetMathQuestion();
  }
}
void keyPressed() {
  if (decider ==5) {
    if (dir == 0)  dir = -SPD;
    if (alive == false) {
      timer = 0;
      alive = true;
      lifecount = 3;
      start = millis();
    }
  }
  if (decider ==1 || decider ==2 || decider ==3 || decider ==4) { 
    text1+=key;
    if (key==BACKSPACE) {
      if (text1.length()>0) {
        text1=text1.substring(0, text1.length()-2);
      }
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
      finite = int(random(2, 10));
    }
  } else if (decider == 2) {
    if (key == ENTER) {
      CheckAnswer();
      if (subcorrectanswers == 0 && subincorrectanswers ==0) {
        subaverage =0;
      } else {
        subaverage = (float(subcorrectanswers)/(float(subincorrectanswers)+float(subcorrectanswers)))*100;
      }
      finite = int(random(2, 10));
    }
  } else if (decider == 3) {
    if (key == ENTER) {
      CheckAnswer();
      if (mulcorrectanswers == 0 && mulincorrectanswers ==0) {
        mulaverage =0;
      } else {
        mulaverage = (float(mulcorrectanswers)/(float(mulincorrectanswers)+float(mulcorrectanswers)))*100;
      }
      finite = int(random(2, 10));
    }
  } else if (decider == 4) {
    if (key == ENTER) {
      CheckAnswer();
      if (divcorrectanswers == 0 && divincorrectanswers ==0) {
        divaverage =0;
      } else {
        divaverage = (float(divcorrectanswers)/(float(divincorrectanswers)+float(divcorrectanswers)))*100;
      }
      finite = int(random(2, 10));
    }
  }
}
void ResetMathQuestion() {
  boolean whole = false;
  ran = int(random(1, 10));
  ran2 = int(random(1, 10));
  subrandominteger = ran - ran2;
  mulrandominteger = ran * ran2;
  randomintegeradded = ran + ran2;
  while (whole == false) {
    if (ran % ran2 == 0  ) {
      whole = true;
      divrandominteger = ran / ran2;
    } else {
      ran = int(random(1, 20));
    }
  }
}
void actionPerformed (GUIEvent e) {
  if (e.getSource() == addition) {
    decider = 1;
  } else if (e.getSource() == notmath) {
    decider = 5;
  } else if (e.getSource() == subtraction) {
    decider = 2;
  } else if (e.getSource() == multiplication) {
    decider = 3;
  } else if (e.getSource() == division) {
    decider = 4;
  }
}