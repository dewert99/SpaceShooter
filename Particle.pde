class Particle extends GameObject {
  int life;

  Particle(float inx, float iny) {
    x = inx;
    y =  iny;
    vx = random(-7, 7);
    vy = random(sqrt(sq(7)-sq(vx))*-1, sqrt(sq(7)-sq(vx)));
    pic = blank;
    w = 5;
    h = 5;
    life = 255;
  }

  void show() {
    fill(255, 255, 255, life);
    rect(x, y, w, h);
    life = life - 5;
  }
}
