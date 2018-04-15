class Glow extends GameObject {
 int life;
  Glow() {
    x = width/2;
    y =  height/2;
    vx = 0;
    vy = 0;
    pic = blank;
    w = width;
    h = height;
    life = 255;
  }

  void show() {
    fill(170, 255, 255, life);
    rect(x, y, w, h);
    life = life - 5;
  }
}
