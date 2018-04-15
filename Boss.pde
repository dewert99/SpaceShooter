class Boss extends Enemy {
  int rateE;
  Boss() {
    x = width/2;
    y = 100;
    vx = 0;
    vy = 0;
    pic = shipB;
    w = 150;
    h = 150;
    hp = 1000;
    rate = 10;
    rateE = 50;
    value=50;
  }
  Boss(float inx, float iny) {
    x = inx;
    y = iny;
    vx = 0;
    vy = 0;
    pic = shipB;
    w = 150;
    h = 150;
    hp = 1000;
    rate = 10;
    rateE = 50;
    value=50;
  }
  void move() {
    x = x + vx;
    y = y + vy;
    if (frameCount % rateE == 0) {
      engine.add(new ArmoredEnemy(x + random(-20,20),y));
    }
    if (frameCount % rate == 0) {
      engine.add(new Bullet(x-20, y, 10, -atan2(player.y-y, player.x-(x-10)),false, bstrength));
      engine.add(new Bullet(x+20, y, 10, -atan2(player.y-y, player.x-(x+10)),false, bstrength));
    }
  }
  
  void show(){
    super.show();
    fill(#ff0000);
    rectMode(CENTER);
    rect(x/2,y/2,map(hp,0,1000,0,150),20);
  }
  
  boolean dead() {
    if (hp<1) {
      bossS = 2;
      g8 = true;
      return true;
    }
    else {
      return super.dead();
    }
  }
}
