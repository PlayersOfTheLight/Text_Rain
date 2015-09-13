class Letter {
  int xpos;
  int ypos;  
  char textLetter;
  int upSpeed;
  int alpha = 255;
  Letter(char inputText) {
    xpos = 100;
    ypos = int(random(-1050, 0));
    textLetter = inputText;
    textSize(16);
    upSpeed = 1;
  }
  void drawLetter() {
    fill(166, 020, 020, alpha);
    text(textLetter, xpos, ypos);
  }

  void letterFade() {
    alpha -= 5;
    if(alpha <= 0) {
      ypos = int(random(-350, 0));
      alpha = 255; 
    }
  }

  void dropLetter() {
    ypos++;
    if (ypos > 730) {
      letterFade();
    }
  }

  void liftLetter() {
    int newY = ypos - upSpeed;
    if (newY >= 0) {
      ypos = newY;
    }
    else {
      ypos = 0;
    }
  }
}

