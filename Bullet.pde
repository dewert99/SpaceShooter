class Bullet extends GameObject {

  boolean good;
  boolean alive;
  int strength;

  Bullet(float inx, float iny, float speed, float angle, boolean ingood, int instrength) {
    x = inx;
    y = iny;
    vx = speed * cos(angle);
    vy = speed * sin(angle) * -1;
    good = ingood;
    strength = instrength;
    if (good) {
      if (strength <= 1) {
        pic = bullet1;
      }
      else {
        pic = bullet2;
      }
    }
    else {
      if (strength <= 1) {
        pic = bulletE;
      }
      else {
        pic = bulletE2;
      }
    }
    w = 5;
    h = 5;
    alive = true;
  }

  boolean dead() {
    if (alive == false) {
      return true;
    }
    return super.dead();
  }
}
