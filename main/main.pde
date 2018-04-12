/******************************************************************************************************************************************************************************************************************************************************* //<>// //<>// //<>// //<>// //<>// //<>//
 Name: Vinay Meldrum
 
 Purpose: For ICS3U class. Because I want a good mark.^
 
 Date: April 20 2018
 
 What it does: It makes a math game with base's using addition, subtraction, multiplication and division. Non-math game a side scroller game.
 Where you jump to avoid the plus sign. It is called Math Jump.
 
 ******************************************************************************************************************************************************************************************************************************************************/
//Math Jump****************************************************************************************
//Sound
import processing.sound.*;
SoundFile Wrong, Win, Lose;
//Importing the images
PImage calm, plus, background, lives, hillroy, trump, usa, wall;
int lifecount = 3;
//Start is for the timer.
int start;
//This is for the jumping part of the non-math game. I think I may reffer to it as Math Jump. Just cause it is easier to type. *********************************
final static short DIM = 50, SPD = 4, BOLD = 4;
final static short FLOOR = 215, JUMP = 145;
static int dir, y = FLOOR;
static int x = 25;
//Closer Determines how fast the plus sign will come. So I set it to 400, so that is where the plus sign will spawn. orginally, later on I make a random integer.
int closer = 400;
//Timer for the game.
int timer;
//This is for the y value of the plus sign. It doesn't really do much... But oh well.
int ybig = 215;
//This just determines whether you are alive or naw. So like if you are not alive, then well, you have like the "GAMEOVER" screen sorta thing.
boolean alive = true;
//I was orginally thinking, that a random sign could spawn, whether it be plus, minus, multiplication, division, and that decides what it is. But as of rn it does nothing.
int rectdecider = 1;//int(random(1, 3));
//Start of math stuff***********************************************************************************************************************************
//Library for buttons
import interfascia.*;
//Sound
SoundFile Math;
//Creating the GUI
GUIController c;
//Making the "variables" type thing for the buttons.
IFButton division, subtraction, addition, multiplication, notmath;
//Defining integers.
//Integer for the score
int score = 0;
int gamescore;
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
//The input for the answers.
String text1="";
//Getting the random finite field
int finite = int(random(2, 10));
//text1 is a String, so I store it as a integer in answer.
int answer = 0;
//This is the random integer that gets displayed.
int ran;
//This just decides whether it is addition, subtraction etc.
int decider = 0;
//The other random integer that is displayed.
int ran2;

void setup() {
  //Setting up the font.
  PFont f = createFont("Georgia", 15);
  textFont(f);
  //size of it.
  size (600, 600);
  //Background of it.
  background(10);
  //Running the different functions.
  //Buttons dispplays the buttons.
  Buttons();
  if (decider == 5) {
    start = millis();
  }
  //ResetMath questions just resets it after you press enter.
  ResetMathQuestion();
  calm = loadImage("Calm.png");
  plus = loadImage("Plussign.png");
  lives = loadImage("lives.png");
  background = loadImage("Math.jpg");
  hillroy = loadImage("Hilory.png");
  trump = loadImage("Trump.png");
  usa = loadImage("Flag.png");
  Win = new SoundFile(this, "Win.mp3");
  Lose = new SoundFile(this, "Lose.mp3");
  Wrong = new SoundFile(this, "Wrong.mp3");
  Math = new SoundFile(this, "Math.mp3");
  wall = loadImage("Trump1.jpg");
  thread("MathSong");
}
void draw() {
  PFont f = createFont("Georgia", 15);
  textFont(f);
  DisplayQuestions();
  if (decider == 5) {
    //Just displays the stuff.
    if (alive == true) {
      timer = millis()-start;
      image(usa, 0, 0, 600, 600);
      text(gamescore, 20, 20);
      if (dir != 0)  move();
      image(hillroy, x, y, DIM, DIM);
      Challenges();
      Lifecontrol();
    } else {
      Gameover();
    }
  }
}
void MathSong() {

  //if (decider == 1 || decider == 2 || decider == 3 || decider == 4 || decider == 0) {
  //  Math.play();
  //} else if (decider == 5) {
  //  Math.stop();
  //}
}
void Lifecontrol() {
  //Lifecontrol, so it displays it depending on how many you have. 
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
  //Just the gameover screen.
  background(10);
  image(wall, 0, 0, 600, 600);
  text("RETRY PRESS ANY KEY TO CONTINUE YOUR SCORE WAS " + gamescore, 100, 300);
}
void Challenges()
{
  //This just makes the rectangle move foward or backwards.
  int howfarback = int(random(400, 800));

  if (rectdecider == 1) {
    image(trump, closer, ybig, 300, 200);
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
      gamescore +=10;
      Win.play();
    }
    if (closer <= x && ybig <= y+30) {
      closer += howfarback;
      lifecount -=1;
      Wrong.play();
    }
  }
  if (lifecount == 0) {
    alive = false;
    Lose.play();
  }
}
//Jump up and down in the game.
static void move() {
  if ((y += dir) < JUMP)  dir *= -1;
  else if (y > FLOOR) {
    dir = 0;
    y = FLOOR;
  }
}

void Buttons() {
  //Shows the buttons
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
//This just displays the question of the main title thingy. 
void DisplayQuestions() {
  if (decider == 0) {

    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(15);
    text("Welcome to my program. Here you can navigate to various different elements of my", 10, 15); 
    text(" program. math with base and non-math games! HAVE FUN. ", 10, 30);
    text("The first two numbers are in decimal. Figure out what they are in the specific finite field. ", 10, 55);
    text ("That is for the math game.", 10, 70);
  }
  if (decider == 1) {
    background(0);
    textSize(15);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in base " + finite, 10, 35);
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
    subcorrectanswer = Integer.toString(subrandominteger, finite);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in base " + finite, 10, 35);
    text("Incorrect responses: " + subincorrectanswers + " Correct responses: " + subcorrectanswers + " Your average is: " + (String.format("%.2f", subaverage)) + "%", 125, 100);
    answer = int(text1); 
    //Displaying question.
    String randominteger = str(ran);
    String randominteger2 = str(ran2);
    String sal = randominteger  + " - " +   randominteger2 + " = " + text1;
    text(sal, 10, 60); 
    text("Your score is " + subscore, 10, 100);
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
  }
  if (decider == 3) {
    background(0);
    textSize(15);
    text("Hi, this is an amazing program because I made it. It's a series of math questions.", 10, 15);
    text("You are in base " + finite, 10, 35);
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
    text("You are in base " + finite, 10, 35);
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
  //Checking the answer here just to see if it is right or wrong, and adding the score, or taking away etc.
  finite = int(random(2, 10));
  if (decider == 2) {
    subintegercorrect = int(subcorrectanswer);
    if (ran -ran2 == 0) {
      subintegercorrect = 0;
    }
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
//So you can jump with the mouse.
void mousePressed() {
  if (decider ==5) {
    keyPressed();
  }
}
//Making it so you can jump with any key, and you can type in the answer for the math stuffz.
void keyPressed() {
  if (decider ==5) {
    if (dir == 0)  dir = -SPD;
    if (alive == false) {
      timer = 0;
      gamescore = 0;
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
//Just reseting the math question.
void ResetMathQuestion() {
  boolean whole = false;
  ran = int(random(1, 10));
  ran2 = int(random(1, 10));
  subrandominteger = ran - ran2;
  mulrandominteger = ran * ran2;
  randomintegeradded = ran + ran2;
  if (decider == 4) {
    while (whole == false) {
      if (ran % ran2 == 0  ) {
        whole = true;
        divrandominteger = ran / ran2;
      } else {
        ran = int(random(1, 20));
      }
    }
  }
}
//If the button is pressed, then do something else.
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