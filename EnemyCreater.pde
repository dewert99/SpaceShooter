class EnemyCreater extends Enemy {

  EnemyCreater() {
    x = random(width);
    y = 0;
    vx = 0;
    vy = 1;
    pic = shipEC;
    w = 150;
    h = 150;
    hp = 15;
    rate = 50;
    value=5;
  }
  void move() {
    x = x + vx;
    y = y + vy;
    if (frameCount % rate == 0) {
      engine.add(new Enemy(x,y));
    }
  }
}
