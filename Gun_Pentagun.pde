class Pentagun extends Gun {

  Pentagun() {
    rate=10;
    bstrength = 1;
  }

  void update() {
  }

  void fire() {
    for (float i = 0; i<=PI; i = i + PI/4) {
      engine.add(new Bullet(player.x, player.y, 10, i, true,bstrength));
    }
  }
}
