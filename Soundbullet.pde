PImage universe;
GameState state;
Scene scene;

void setup() {
  fullScreen();
  universe = loadImage("universe.jpg");
  universe.resize(width, height);
  state = GameState.Menu;
  background(universe);
  
  // Menu is the start scene.
  scene = new Menu();
}

enum GameState {
  Menu
}

void draw() {
  background(universe);
  scene.paint();
}

void mouseClicked() {
  scene.onClick();
}

void keyPressed(KeyEvent event) {
  scene.onKeyPressed(event);
}

void menuLogo() {
  textSize(70);
  textAlign(CENTER, CENTER);
  text("Soundbullet", width/2, height/2 - 200);
}