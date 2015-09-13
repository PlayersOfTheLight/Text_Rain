

/* Text Rain: Reimplementaion by Marlena Abraham
 * Credit where it's due:
 * -Tutorial from Daniel Shiffman about Capture
 * -Talked with John Ozbay about implementation ideas and libraries
 * -Capture library documentation on Processing.org
 */
import processing.video.*;
Capture cam;
Letter[][] drops;
int dropsLength;
PImage prevFrame;
//int sWidth = 1200;
//int sHeight = 800;
int sWidth = 640;
int sHeight = 480;

int threshold = 140;
String inputString = "!@#@%@$%^^*&%*^$&(*(&^%$&#^@!##$%$%#&^%$*&^$&^$^*&()*&)*&)%$#$%$#@%^$^354$#@^%$@$@#@@$#^%%$^$#%&^^%##$%#%";
char[] inputLetters;
int dupStrings = 10;

void setup() {
  String[] cameras = Capture.list();
  drops = new Letter[dupStrings][inputString.length()];//[inputString.length()];
  int inc = sWidth/inputString.length();
  int spawnPos = 5;
  inputLetters = new char[inputString.length()];
  splitString();

  size(640, 480);
      
  int addLineHeight = 0;
  for (int i = 0; i < dupStrings; i++) {
    for (int j = 0; j < inputLetters.length; j++) {  
      Letter testLetter = new Letter(inputLetters[j]);
      testLetter.xpos = spawnPos;
      testLetter.ypos -= addLineHeight;
      drops[i][j] = testLetter;
      spawnPos += inc;
      if (spawnPos >= sWidth-inc) {
        spawnPos = 5;
      }
    }
    addLineHeight += 50;
  }

  if (cameras.length == 0) {
    println("There are no cameras available...");
    size(400, 400);
    exit();
  }
  else {
    println("Availaable cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, sWidth, sHeight);
   
    cam.start();
    cam.loadPixels();

 //<>//
  }
  dropsLength = inputString.length();
}

void splitString() {
  for (int i = 0; i < inputString.length(); i++) {
    inputLetters[i] = inputString.charAt(i);
  }
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  } 
  set(0, 0, cam);
  println("Dupstrings len: " + dupStrings);
  for (int i = 0; i < dupStrings; i++) {
    for (int j = 0; j < dropsLength; j++) {
      if (drops[i][j].ypos < sHeight && drops[i][j].ypos > 0) {    
        int loc = drops[i][j].xpos + (drops[i][j].ypos*sWidth);
        float bright = brightness(cam.pixels[loc]);
        if (bright > threshold) {
          drops[i][j].dropLetter();
          drops[i][j].upSpeed = 1;
        }
        else {
          if (drops[i][j].ypos > 0) {
            int aboveLoc = loc = drops[i][j].xpos + ((drops[i][j].ypos)-1)*sWidth;
            float aboveBright = brightness(cam.pixels[aboveLoc]);
            if (aboveBright < threshold) {
              drops[i][j].liftLetter();
              drops[i][j].upSpeed = drops[i][j].upSpeed * 2;
            }
          }
        }
      }
      else {
        drops[i][j].dropLetter(); 
      }

      drops[i][j].drawLetter();
      cam.updatePixels();
    }
  }
}