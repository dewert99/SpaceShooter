class Star extends GameObject {

  Star() {
    x = random(width);
    y =  0;
    vx = 0;
    vy = random(1, 5);
    pic = blank;
    w = vy;
    h = vy;
  }
}
