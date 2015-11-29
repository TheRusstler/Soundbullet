import java.awt.geom.*;
import java.awt.*;
import java.util.ArrayList;
import ddf.minim.*;
import java.awt.geom.RectangularShape;

final String SAVE_FILE = "data/save.json";

Minim minim;

PImage logoLarge, planetType1, planetType2, surface;
PImage ship, shipDualGuns;
PImage pirate, pirateCaptain;


ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Song> music = new ArrayList<Song>();
boolean showStars = true;

Scene scene;
Universe universe;
Game game = null;

void setup() {
  fullScreen();
  //size(800, 600);
  imageMode(CENTER); 
  minim = new Minim(this);
  
  loadResources();
  loadMusic();
  setScene(new Menu(), true);
}

void loadResources() {
  logoLarge       = loadImage("resources/logo/logo_large_transparent.png");
  planetType1     = loadImage("resources/planets/red.png");
  planetType2     = loadImage("resources/planets/green-planet.png");
  surface         = loadImage("resources/planets/planetBackground.png");
  ship            = loadImage("resources/ships/ship.png");
  pirate          = loadImage("resources/ships/pirate.png");
  pirateCaptain   = loadImage("resources/ships/captainShield.png");
  shipDualGuns    = loadImage("resources/ships/ship_upgraded.png");
}

void loadMusic() {
  File folder = new File(dataPath("") + "/music");
  System.out.println(folder.getAbsolutePath());
  
  for(File file : folder.listFiles()) { //<>//
    if(file.getName().endsWith(".mp3")) {
      music.add(new Song(file.getName(), minim.loadFile("music/" + file.getName())));
    }
  }
}

/*
 * Set scene navigates the main window to a given scene.
 */
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

void draw() {
  drawBackground();
  scene.paint();
}

void drawBackground() {
  background(0);
  noStroke();

  if (showStars) {
    for (Star star : stars) {
      fill(random(180, 255));
      ellipse(star.x, star.y, star.diameter, star.diameter);
    }
  }
}

void mouseReleased() {
  scene.onClick();
}

void keyPressed() {
  scene.onKeyPressed();
}

void keyReleased() {
  scene.onKeyReleased();
}