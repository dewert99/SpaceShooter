class ArmoredEnemy extends Enemy {

  ArmoredEnemy() {
    x = random(width);
    y = 0;
    vx = 0;
    vy = 1;
    pic = shipE2;
    w = 50;
    h = 50;
    hp = 7;
    rate = 30;
    bstrength=1;
    value = 2;
  }
  ArmoredEnemy(float inx,float iny) {
    x = inx;
    y = iny;
    vx = 0;
    vy = 1;
    pic = shipE2;
    w = 50;
    h = 50;
    hp = 7;
    rate = 50;
    bstrength=1;
    value = 2;
  }
}
