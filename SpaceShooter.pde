GameEngine engine;
Keyboard kbd;
Player player;

import ddf.minim.*;
Minim minim;
AudioPlayer backplayer;
AudioPlayer hitplayer;
AudioPlayer dieplayer;
AudioPlayer unlockplayer;

final int INTRO = 0;
final int PLAYING = 1;
final int GAMEOVER = 2;
final int PAUSED = 3;

int mode = INTRO;

PImage intro;
public static PImage bullet1;
public static PImage bulletE;
public static PImage bullet2;
public static PImage bulletE2;
PImage ship;
public static PImage shipE1;
public static PImage shipE2;
public static PImage shipE3;
public static PImage shipEC;
public static PImage shipB;
public static PImage blank;

int maxhealth = 50;
int health;
int score = 0;
int highscore = 0;
int bossS = 0;

boolean g1 = false, g2 = false, g3 = false, g4 = false, g5 = false, g6 = false, g7 = false, g8 = false;


void setup() {
  minim = new Minim(this);
  backplayer = minim.loadFile("background.mp3");
  hitplayer = minim.loadFile("Hit.mp3");
  dieplayer = minim.loadFile("Lose.mp3");
  unlockplayer = minim.loadFile("unlock.wav");
  
  backplayer.loop();

  rectMode(CENTER);
  fullScreen();

  engine = new GameEngine();
  kbd = new Keyboard();

  intro = loadImage("intro.jpg");
  bullet1 = loadImage("bullet1.png");
  bulletE = loadImage("bulletE.png");
  bullet2 = loadImage("bullet2.png");
  bulletE2 = loadImage("bulletE2.png");
  ship = loadImage("ship.png");
  shipE1 = loadImage("enemy.png");
  shipE2 = loadImage("enemy2.png");
  shipE3 = loadImage("enemy3.png");
  shipEC = loadImage("enemyC.png");
  shipB = loadImage("boss.png");
  blank = loadImage("blank.png");

  player = new Player();

  engine.add(player);

  health = maxhealth;

  //engine.add(new Boss());
}

void draw() {
  if (mode == INTRO) {
    drawIntro();
  }
  else if (mode == PLAYING) {
    drawPlaying();
  }
  else if (mode == GAMEOVER) {
    drawGameOver();
  }
  else if (mode == PAUSED) {
    drawPaused();
  }
  else {
    fill(#ff0000);
  }
}
void drawIntro() {
  image(intro, 0, 0, width, height);
  textAlign(CENTER, CENTER);
  textSize(200);
  text("Space Shooter", width/2, height/3);
  if (mousePressed) {
    mode = PLAYING;
  }
}
void drawPlaying() {
  background(0);

  if (score>highscore) {
    highscore = score;
  }

  engine.update();
  engine.add(new Star());
  if (bossS == 0) {
    if (score<20) {
      if (random(100)<1) {
        engine.add(new Enemy());
      }
    }
    else if (score<50) {
      if (random(100)<1) {
        engine.add(new Enemy());
      }
      if (random(100)<1) {
        engine.add(new ArmoredEnemy());
      }
    }
    else if (score<100) {
      if (random(1000)<1) {
        engine.add(new EnemyCreater());
      }
      if (random(50)<1) {
        engine.add(new ArmoredEnemy());
      }
      if (random(100)<1) {
        engine.add(new Enemy());
      }
      if (random(500)<1) {
        engine.add(new SuperArmored());
      }
    }
    else if (score<250) {
      if (random(500)<1) {
        engine.add(new EnemyCreater());
      }
      if (random(50)<1) {
        engine.add(new ArmoredEnemy());
      }
      if (random(300)<1) {
        engine.add(new SuperArmored());
      }
    }
    else {
      engine.clear();
      engine.add(new Boss());
      bossS = 1;
    }
  }
  else if (bossS != 1) {
    if (score<500){
      if (random(250)<1) {
        engine.add(new EnemyCreater());
      }
      if (random(100)<1) {
        engine.add(new SuperArmored());
      }
    }
    else{
      if (random(500)<1) {
        engine.add(new Boss(random(0,width),100));
      }
      if (random(50)<1) {
        engine.add(new SuperArmored());
      }
    }
  }
  if (health < 1) {
    mode = GAMEOVER;
    dieplayer.play(0);
  }

  fill(255);
  textSize(50);
  text("Score =" + score, width/2, 20);
  colorMode(HSB);
  fill(health*100/maxhealth, 255, 255);
  rectMode(CORNER);
  rect(10, 10, 5 * health, 20);
  rectMode(CENTER);
}
void drawGameOver() {
  bossS = 0;

  background(0);
  textSize(50);
  text("Score =" + score, width/2, 20);
  textSize(200);
  fill(255);
  text("Game Over", width/2, height/3);
  textSize(50);
  text("highscore" + highscore, width/2, height/6);
  textSize(20);

  if (g1) {
    fill(255);
    rect(width/2-215, height/3*2-105, 100, 100);
    fill(0);
    text("Basic Gun", width/2-215, height/3*2-105, 100, 100);
  }
  if (g2) {
    fill(255);
    rect(width/2-105, height/3*2-105, 100, 100);
    fill(0);
    text("Whip", width/2-105, height/3*2-105, 100, 100);
  }
  if (g3) {
    fill(255);
    rect(width/2+5, height/3*2-105, 100, 100);
    fill(0);
    text("Powerful Gun", width/2+5, height/3*2-105, 100, 100);
  }
  if (g4) {
    fill(255);
    rect(width/2+115, height/3*2-105, 100, 100);
    fill(0);
    text("Aimable Whip", width/2+115, height/3*2-105, 100, 100);
  }
  if (g5) {
    fill(255);
    rect(width/2-215, height/3*2+5, 100, 100);
    fill(0);
    text("Pentagun", width/2-215, height/3*2+5, 100, 100);
  }
  if (g6) {
    fill(255);
    rect(width/2-105, height/3*2+5, 100, 100);
    fill(0);
    text("Powerful Pentagun", width/2-105, height/3*2+5, 100, 100);
  }
  if (g7) {
    fill(255);
    rect(width/2+5, height/3*2+5, 100, 100);
    fill(0);
    text("Rings", width/2+5, height/3*2+5, 100, 100);
  }
  if (g8) {
    fill(255);
    rect(width/2+115, height/3*2+5, 100, 100);
    fill(0);
    text("Fast Rings", width/2+115, height/3*2+5, 100, 100);
  }
  if (mousePressed) {
    if (g1  && rectRect(mouseX, mouseY, 1, 1, width/2-215, height/3*2-105, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new Gun();
      score = 0;
    }
    if (g2  && rectRect(mouseX, mouseY, 1, 1, width/2-105, height/3*2-105, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new Whip();
      score = 0;
    }
    if (g3  && rectRect(mouseX, mouseY, 1, 1, width/2+5, height/3*2-105, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new PowerGun();
      score = 0;
    }
    if (g4  && rectRect(mouseX, mouseY, 1, 1, width/2+115, height/3*2-105, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new MouseGun();
      score = 0;
    }
    if (g5  && rectRect(mouseX, mouseY, 1, 1, width/2-215, height/3*2+5, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new Pentagun();
      score = 0;
    }
    if (g6  && rectRect(mouseX, mouseY, 1, 1, width/2-105, height/3*2+5, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new PowerPentagun();
      score = 0;
    }
    if (g7  && rectRect(mouseX, mouseY, 1, 1, width/2+5, height/3*2+5, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new Ring();
      score = 0;
    }
    if (g8  && rectRect(mouseX, mouseY, 1, 1, width/2+115, height/3*2+5, 100, 100)) {
      health = maxhealth;
      mode=PLAYING;
      engine.objects.clear();
      engine.add(player);
      player.gun = new FastRing();
      score = 0;
    }
  }
}
void drawPaused() {
  textSize(200);
  text("Paused", width/2, height/3);
}
