class Ship extends Scene {
  boolean left, right, up, down, space;
  int sensitivity = 10;
  boolean isDualCannons = true;
  PImage sprite;
  Rectangle bounds;
  
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  public Ship() {
    sprite = ship.copy();
    float ratio = 0.75;
    sprite.resize((int)(sprite.width * ratio), (int)(sprite.height * ratio));
    bounds = new Rectangle(width/2 - sprite.width/2, height-sprite.height - 20, sprite.width, sprite.height);
  }

  void paint() {
    integrate();
    
    // Bullets
    for(Bullet b : bullets) {
      b.paint();
    }
    
    // Debug to see ship bounds.
    //rectMode(CORNER);
    //fill(255, 255, 255, 50);
    //rect((float)bounds.x, (float)bounds.y, (float)bounds.width, (float)bounds.height);
    
    imageMode(CORNER);
    image(sprite, bounds.x, bounds.y);
  }

  void onClick() {
  }

  void integrate() {
    int margin = (width - surface.width)/2;
    
    if (left && bounds.x > margin) {
      bounds.x = bounds.x - sensitivity;
    }
    if (right && bounds.x + bounds.width < (width - margin)) {
      bounds.x = bounds.x + sensitivity;
    }
    if (up && bounds.y > 0) {
      bounds.y = bounds.y - sensitivity;
    }
    if (down && bounds.y + bounds.height < height) {
      bounds.y = bounds.y + sensitivity;
    }
    
    if(space) {
      shoot();
    }
  }

  void onKeyPressed() {
    onKeyAction(true);
  }

  void onKeyReleased() {
    onKeyAction(false);
  }
  
  void shoot() {
    PVector pos = new PVector((int)bounds.getCenterX(), bounds.y);
    bullets.add(new Bullet(pos));
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
      case ' ':
        space = pressed;
      default:
        break;
      }
    }
  }
}