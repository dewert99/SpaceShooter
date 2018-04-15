class Enemy extends GameObject {
  int hp;
  int rate;
  int bstrength;
  int value;
  Enemy() {
    x = random(width);
    y = 0;
    vx = 0;
    vy = 2;
    pic = shipE1;
    w = 50;
    h = 50;
    hp = 2;
    rate = 20;
    bstrength=1;
    value = 1;
  }
  Enemy(float inx, float iny) {
    x = inx+random(-20,20);
    y = iny;
    vx = 0;
    vy = 2;
    pic = shipE1;
    w = 50;
    h = 50;
    hp = 2;
    rate = 20;
    bstrength=1;
    value = 1;
  }

  void move() {
    super.move();
    
    if (x > width-w/2) {
      x = width-w/2;
    }
    if (x < 0+w/2) {
      x = 0+w/2;
    }
    vx = vx * 0.90;
    if (frameCount % rate == 0) {
      engine.add(new Bullet(x, y, 10, -atan2(player.y-y, player.x-x), false, bstrength));
    }
  }
  boolean dead() {
    if (hp<1) {
      return true;
    }
    else {
      return super.dead();
    }
  }
}
