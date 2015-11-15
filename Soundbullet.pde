PImage universe;

void setup() {
  universe = loadImage("universe.jpg");
  universe.resize(width, height);
  
  fullScreen(P3D);
  image(universe, 0, 0);
}

enum GameState {
  Menu,
  MenuToUniverseTransition,
  UniverseToMenuTransition
}

GameState state = GameState.Menu;

void draw() {
  switch(state)
  {
    case Menu:
      menu();
      break;
    case MenuToUniverseTransition:
      menuToUniverseTransition();
      break;
    case UniverseToMenuTransition:
      universeToMenuTransition();
      break;
  }
}


void menu() {
    menuBackground();
}

float menuBackgroundScaleFactor = 2.5;
void menuBackground() {
  scale(menuBackgroundScaleFactor);
  image(universe, 0, 0);
}

void mouseClicked() {
  
  switch(state)
  {
    case Menu:
    case UniverseToMenuTransition:
      menuToUniverseScaleFactor = menuBackgroundScaleFactor;
      state = GameState.MenuToUniverseTransition;
      break;
    case MenuToUniverseTransition:
      universeToMenuScaleFactor = menuToUniverseScaleFactor;
      state = GameState.UniverseToMenuTransition;
      break;
  }
}

float menuToUniverseScaleFactor;
void menuToUniverseTransition() {
    if(menuToUniverseScaleFactor > 1.05) {
      menuToUniverseScaleFactor -= 0.1;
    }
    scale(menuToUniverseScaleFactor);
    image(universe, 0, 0);
}

float universeToMenuScaleFactor;
void universeToMenuTransition() {
    if(universeToMenuScaleFactor < menuBackgroundScaleFactor) {
      universeToMenuScaleFactor += 0.05;
    }
    scale(universeToMenuScaleFactor);
    image(universe, 0, 0);
}
  