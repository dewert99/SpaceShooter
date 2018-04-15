class GameEngine {
  ArrayList<GameObject> objects;

  GameEngine() {
    objects = new ArrayList<GameObject>(40000);
  }

  void add(GameObject obj) {
    objects.add(obj);
  }

  void update() {
    for (int i = objects.size() - 1; i>= 0; i--) {
      GameObject obj=objects.get(i);
      if (obj.dead()) {
        objects.remove(i);
      }
      else {
        obj.show();
        obj.move();
        if (obj instanceof Bullet) {
          checkCollisions((Bullet) obj);
        }
      }
    }
  }

  void checkCollisions(Bullet b) {

    if (b.good == false) {
      if (rectRect(player.x, player.y, player.w, player.h, b.x, b.y, b.w, b.h)) {
        expload(b.x, b.y, 10);
        b.alive = false;
        health=health-b.strength;
      }
    }
    else {
      for (int i = 0; i<objects.size(); i++) {
        GameObject obj=objects.get(i);
        if (obj instanceof Enemy) {
          if (rectRect(obj.x, obj.y, obj.w, obj.h, b.x, b.y, b.w, b.h) && !obj.dead()) {
            expload(b.x, b.y, 10);
            b.alive = false;
            ((Enemy)obj).hp = ((Enemy)obj).hp - b.strength;
            hitplayer.play(0);
            if(((Enemy)obj).hp<=0){
              score = score + ((Enemy)obj).value;
              unlock();
              expload(b.x, b.y, 100);
            }
          }
        }
      }
    }
  }
  void expload(float x, float y, int amount) {
    for (int i = 1; i<amount; i ++) {
      add(new Particle(x, y));
    }
  }
  void unlock(){
    int rand = round(random(2000,5000));
    if (score*20>rand  && g2 == false){
      g2 = true;
      add(new Glow());
      unlockplayer.play(1);
    }
    if (score*7>rand && g3 == false){
      g3 = true;
      add(new Glow());
      unlockplayer.play(1);
    }
    if (score*4>rand && g4 == false){
      g4 = true;
      add(new Glow());
      unlockplayer.play(1);
    }
    if (score*120>rand&& g5 == false){
      g5 = true;
      add(new Glow());
      unlockplayer.play(1);
    }
    if (score*5>rand && g6 == false){
      g6 = true;
      add(new Glow());
      unlockplayer.play(1);
    }
    if (score*10>rand && g7 == false){
      g7 = true;
      add(new Glow());
      unlockplayer.play(1);
    }
  }
  void clear(){
    for (int i = 0; i<objects.size(); i++) {
        GameObject obj=objects.get(i);
        if (obj instanceof Enemy) {
          obj=objects.remove(i);
        }
      }
  }
}
