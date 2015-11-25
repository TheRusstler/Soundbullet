import java.awt.geom.*;
import java.awt.Rectangle;
import java.util.ArrayList;
import processing.sound.*;


ArrayList<Star> stars = new ArrayList<Star>();
PImage logoLarge, planetType1, planetType2;
ArrayList<SoundFile> music = new ArrayList<SoundFile>();
final String SAVE_FILE = "data/save.json";

// Current scene
Scene scene;

// Game state
Game game = null;

void setup() {
  fullScreen();

  imageMode(CENTER);

  logoLarge = loadImage("resources/logo/logo_large_transparent.png");
  planetType1 = loadImage("resources/planets/red.png");
  planetType2 = loadImage("resources/planets/green-planet.png");

  music.add(new SoundFile(this, "music/breathing_underwater.mp3"));

  // Menu is the start scene.
  setScene(new Menu(), true);
}

void draw() {
  drawBackground();
  scene.paint();
}

void drawBackground() {
  background(0);
  noStroke();

  for (Star star : stars) {
    fill(random(180, 255));
    ellipse(star.x, star.y, star.diameter, star.diameter);
  }
}

void mouseReleased() {
  scene.onClick();
}

void keyPressed(KeyEvent event) {
  scene.onKeyPressed(event);
}

// Navigation
void setScene(Scene scene, boolean refreshStars) {
  if (refreshStars) {
    stars = new ArrayList<Star>();
    for (int i=0; i < 500; i++) {
      stars.add(new Star(random(width), random(height)));
    }
  }

  this.scene = scene;
}

void menuLogo() {
  image(logoLarge, logoLarge.width/2, logoLarge.height/2);
}