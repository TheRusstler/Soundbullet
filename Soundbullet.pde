import java.awt.geom.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;
import ddf.minim.*;
import java.awt.geom.RectangularShape;


// ------ Constants ------
final String SAVE_FILE = "data/save.json";
final String HOME_PLANET = "Home.mp3";
final String UNIVERSE_MUSIC = "Un nouveau soleil.mp3";
final int NUMBER_OF_PLANETS = 7;


// ------ Audio ------
Minim minim;
AudioPlayer universeMusic;


// ------ Images ------
PImage logoLarge, planetType1, planetType2, surface;
PImage ship, shipDualGuns;
PImage pirate, pirateCaptain;


// ------ Game properties ------

// Shimmering stars in the universe background
ArrayList<Star> stars = new ArrayList<Star>();

// Planet songs
ArrayList<Song> music = new ArrayList<Song>();

// Set to false when stars are not required (e.g. Planet-attack mode)
boolean showStars = true;

// The current scene
Scene scene;

// The current universe
Universe universe;

// the current game state
Game game = null;


/*
 * Loads the game images
 */
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


/*
 * Loads the game audio
 */
void loadMusic() {
  File folder = new File(dataPath("") + "/music");

  // Universe music //<>//
  universeMusic = minim.loadFile("sounds/" + UNIVERSE_MUSIC);

  // Home planet
  music.add(new Song(HOME_PLANET, null));

  for (File file : folder.listFiles()) {
    if (file.getName().endsWith(".mp3")) {
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


/*
 * Draws the logo on the menu screens
 */
void menuLogo() {
  image(logoLarge, logoLarge.width/2, logoLarge.height/2);
}


/*
 * Saves and exits the game
 */
void saveAndExit() {
  game.save();
  setScene(new Menu(), false);
}


/*
 * Draws the stars (if required), then the current scene
 */
void draw() {
  drawBackground();
  scene.paint();
}


/*
 * Draws the stars
 */
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


// ------ Events ------
void mouseReleased() {
  scene.onClick();
}

void keyPressed() {
  scene.onKeyPressed();
}

void keyReleased() {
  scene.onKeyReleased();
}

void setup() {
  fullScreen();
  //size(1200, 800); 
  imageMode(CENTER); 
  minim = new Minim(this);

  loadResources();
  loadMusic();
  setScene(new Menu(), true);
}