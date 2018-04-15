class Gun {
  int rate;
  int bstrength;

  Gun() {
    rate=25;
    bstrength = 1;
  }

  void update() {
  }

  void fire() {
    engine.add(new Bullet(player.x, player.y, 10, PI/2, true,bstrength));
  }
}
