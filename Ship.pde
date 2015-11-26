class Ship extends Scene {

  PVector position, velocity;
  boolean left, right, up, down;
  int sensitivity = 10;

  public Ship() {
    position = new PVector(width/2, height-50);
  }

  public void paint() {
    integrate();
    fill(200, 0, 0);
    rect(position.x, position.y, 50, 50);
  }

  void onClick() {
  }

  void integrate() {
    int margin = (width - surface.width)/2;
    
    if (left && position.x > margin) {
      position.x = position.x - sensitivity;
    }
    if (right && position.x < (width - margin)) {
      position.x = position.x + sensitivity;
    }
    if (up && position.y > 0) {
      position.y = position.y - sensitivity;
    }
    if (down && position.y < height) {
      position.y = position.y + sensitivity;
    }
  }

  void onKeyPressed() {
    onKeyAction(true);
  }

  void onKeyReleased() {
    onKeyAction(false);
  }

  void onKeyAction(boolean pressed) {
    if (key != CODED) {
      switch (key) {
      case 'a': 
        left = pressed;
        break;
      case 'd':
        right = pressed;
        break;
      case 'w':
        up = pressed;
        break;
      case 's':
        down = pressed;
        break;
      default:
        break;
      }
    }
  }
}