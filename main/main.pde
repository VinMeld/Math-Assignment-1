int score = 0;
int x;
int y;
String text1="";
int finite = int(random(2, 10));
int answer = 0;
int correctanswers;
int incorrectanswers;
int randomintegeradded; 
int integercorrect;
int ran;
int decider = 5;
int ran2;
float average;
boolean main = true;
String correctanswer = ""; 
//Integer.toString(16, 8);
void setup() {
  size (600, 600); 
  background(10);
  ResetMathQuestion();
}
void draw() {
  PFont f = createFont("Georgia", 15);
  textFont(f);
  if (main == true) {
    fill(255);
    rect(x+400, y+50, 150, 80);
    fill(0);
    text("back", 145, 120);
    if (mousePressed) {
      if (mouseX>x+400 && mouseX <x+400+150 && mouseY>y+50 && mouseY <y+50+80) {
        decider = 0;
      }
    }
   
  }
  if (decider == 0) {
    background(10);

    textSize(100);
        fill(255);

    rect(x+100, y+50, 150, 80);
    fill(0);
    text("+", 145, 120);
    fill (255);
    rect(x+300,y+ 50, 150, 80);
    rect(x+100, y+150, 150, 80);
    rect(x+300, y+150, 150, 80);
    if (mousePressed) {
      if (mouseX>x+100 && mouseX <x+100+150 && mouseY>y+50 && mouseY <y+50+80) {
        fill(255);
        decider = 1;
      }
      if (mouseX>x+300 && mouseX <x+300+150 && mouseY>y+50 && mouseY <y+50+80) {
        fill(255);
        decider = 2;
      }
      if (mouseX>x+100 && mouseX <x+100+150 && mouseY>y+150 && mouseY <y+150+80) {
        fill(255);
        decider = 3;
      }
      if (mouseX>x+300 && mouseX <x+300+150 && mouseY>y+50 && mouseY <y+50+80) {
        fill(255);
        decider = 4;
      }
    }
  }
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
    rect(x+200, y+150, 150, 80);
    if (mousePressed) {
      if (mouseX>x+200 && mouseX <x+200+150 && mouseY>y+150 && mouseY <y+150+80) {
        decider = 0;
      }
    }
    PFont l = createFont("Georgia", 15);
    textFont(l);
    textSize(25);
    fill(0);
    text("Back", 250, 200);
   offscreen();
  }
  if (decider == 2) {
    background(255);
    text("decider is 2. ", 10, 10);
  }
  if (decider == 3) {
    background(0);
    text("decider is 3. ", 10, 10);
  }
  if (decider == 4) {
    background(0);
    text("decider is 4. ", 10, 10);
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
void offscreen(){
   x -= 100000000;
  y-= 1000000;
}