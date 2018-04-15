class Player extends GameObject {

  Gun gun;

  int rate;
  int time;
  Player() {
    x = random(width);
    y =  0;
    vx = 0;
    vy = height;
    pic = ship;
    w = 30;
    h = 30;
    rate = 1;
    time = 0;
    gun = new Gun();
  }
  void move() {
    super.move();
    if (kbd.holdingRight) {
      vx++;
    }
    if (kbd.holdingLeft) {
      vx--;
    }
    if (kbd.holdingDown) {
      vy++;
    }
    if (kbd.holdingUp) {
      vy--;
    }
    if (kbd.holdingSpace) {
      if (time <= 0) {
        gun.fire();
        time = gun.rate;
      } else {
        time --;
      }
    }
    if (kbd.holding1&&g1) {
      gun = new Gun();
    }
    if (kbd.holding2&&g2) {
      gun = new Whip();
    }
    if (kbd.holding3&&g3) {
      gun = new PowerGun();
    }
    if (kbd.holding4&&g4) {
      gun = new MouseGun();
    }
    if (kbd.holding5&&g5) {
      gun = new Pentagun();
    }
    if (kbd.holding6&&g6) {
      gun = new PowerPentagun();
    }
    if (kbd.holding7&&g7) {
      gun = new Ring();
    }
    if (kbd.holding8&&g8) {
      gun = new FastRing();
    }
    vx = vx * 0.90;
    vy = vy * 0.90;
    if (x > width-w/2) {
      x = width-w/2;
    }
    if (x < 0+w/2) {
      x = 0+w/2;
    }
    if (y > height-h/2) {
      y = height-h/2;
    }
    if (y < 0+w/2+175) {
      y = 0+w/2+175;
    }
    gun.update();
  }
}
