abstract class GameObject {

  float x, y, vx, vy, w, h;
  PImage pic;
  GameObject() {
  }

  void show() {
    imageMode(CENTER);
    image(pic, x, y, w, h);
  }

  void move() {
    x = x + vx;
    y = y + vy;
  }

  boolean dead() {
    if (x>width || x<0 || y>height || y<0) {
      return true;
    }
    else {
      return false;
    }
  }
}
