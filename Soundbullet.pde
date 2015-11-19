PImage universe, logoLarge, logoSmall;
GameState state;
private Scene scene;

void setup() {
  fullScreen();
  universe = loadImage("universe.jpg");
  logoLarge = loadImage("logo/logo_large_transparent.png");
  logoSmall = loadImage("logo/logo_small_transparent.png");
  
  float scale = 0.7;
  logoSmall.resize((int)(logoSmall.width * scale), (int)(logoSmall.height * scale));
  
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

// Navigation
void setScene(Scene scene) {
  this.scene = scene;
}

void menuLogo() {
  image(logoLarge, width/2 - logoLarge.width/2, 0);
}

void gameLogo() {
  image(logoSmall, 0, 0);
}