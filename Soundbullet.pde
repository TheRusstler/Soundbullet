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