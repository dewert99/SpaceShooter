class Ring extends Gun {

  Ring() {
    rate=30;
    bstrength = 1;
  }

  void update() {
  }

  void fire() {
    for (float i = 0; i<=2*PI; i = i + PI/60) {
      engine.add(new Bullet(player.x, player.y, 10, i, true,bstrength));
    }
  }
}
