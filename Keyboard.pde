/* Example Code for Platformer
 * By Chris DeLeon
 * 
 * For more free resources about hobby videogame development, check out:
 * http://www.hobbygamedev.com/
 * 
 * Project compiles in Processing - see Processing.org for more information!
 */

import java.awt.event.KeyEvent;

class Keyboard {
  // used to track keyboard input
  Boolean holdingUp, holdingDown, holdingRight, holdingLeft, holdingSpace, holding1, holding2, holding3, holding4, holding5, holding6, holding7, holding8;

  Keyboard() {
    holdingUp=holdingDown=holdingRight=holdingLeft=holdingSpace=holding1=holding2=holding3=holding4=holding5=holding6=holding7=holding8=false;
  }

  /* The way that Processing, and many programming languages/environments, deals with keys is
   * treating them like events (something can happen the moment it goes down, or when it goes up).
   * Because we want to treat them like buttons - checking "is it held down right now?" - we need to
   * use those pressed and released events to update some true/false values that we can check elsewhere.
   */

  void pressKey(char key) {
    println(key);
    print(CODED);
    if (key == CODED) {
      println("test");
      if (keyCode == UP) {
        holdingUp = true;
      }
      if (keyCode == DOWN) {
        holdingDown = true;
      }
      if (keyCode == LEFT) {
        holdingLeft = true;
      }
      if (keyCode == RIGHT) {
        holdingRight = true;
      }
    }
    if (key == ' ') {
      holdingSpace = true;
    }
    if (key == '1') {
      holding1 = true;
    }
    if (key == '2') {
      holding2 = true;
    }
    if (key == '3') {
      holding3 = true;
    }
    if (key == '4') {
      holding4 = true;
    }
    if (key == '5') {
      holding5 = true;
    }
    if (key == '6') {
      holding6 = true;
    }
    if (key == '7') {
      holding7 = true;
    }
    if (key == '8') {
      holding8 = true;
    }
  }

  void releaseKey(char key) {
    if (key == CODED) {
      if (keyCode == UP) {
        holdingUp = false;
      }
      if (keyCode == DOWN) {
        holdingDown = false;
      }
      if (keyCode == LEFT) {
        holdingLeft = false;
      }
      if (keyCode == RIGHT) {
        holdingRight = false;
      }
      if (keyCode == SHIFT) {
      if (mode == PLAYING) {
        mode = PAUSED;
      } else if (mode == PAUSED) {
        mode = PLAYING;
      }
    }
    }
    if (key == ' ') {
      holdingSpace = false;
    }
    if (key == '1') {
      holding1 = false;
    }
    if (key == '2') {
      holding2 = false;
    }
    if (key == '3') {
      holding3 = false;
    }
    if (key == '4') {
      holding4 = false;
    }
    if (key == '5') {
      holding5 = false;
    }
    if (key == '6') {
      holding6 = false;
    }
    if (key == '7') {
      holding7 = false;
    }
    if (key == '8') {
      holding8 = false;
    }
  }
}

void keyReleased() {
  kbd.releaseKey(key);
}

void keyPressed(){
  kbd.pressKey(key);
}
