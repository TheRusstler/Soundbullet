PImage universe;
GameState state;
Menu menu;

void setup() {
  fullScreen();
  universe = loadImage("universe.jpg");
  universe.resize(width, height);
  state = GameState.Menu;
  background(universe);
  menu = new Menu();
}

enum GameState {
  Menu
}

void draw() {
  background(universe);
  switch(state)
  {
    case Menu:
      menu.paint();
      break;
  }
}

void mouseClicked() {
  switch(state)
  {
    case Menu:
      menu.clicked();
      break;
  }
}
  