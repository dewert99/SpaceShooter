class MouseGun extends Gun {

  MouseGun() {
    rate=1;
    bstrength = 1;
  }

  void update() {
  }

  void fire() {
      engine.add(new Bullet(player.x, player.y, 10, -atan2(mouseY-player.y, mouseX-player.x),true, bstrength));
  }
}
