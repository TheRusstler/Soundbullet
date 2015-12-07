/*
 * The player's ship
 */
class Ship extends Scene {
  boolean left, right, up, down, space;
  int sensitivity = 8;
  PImage sprite;
  Rectangle bounds;

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();

  final int DUAL_GUNS_SPACING = 12, BULLET_Y_OFFSET = 10;

  public Ship() { 
    sprite = ship.copy();

    // Check for upgrades
    if (game.dualGunsUpgrade) {
      sprite = shipDualGuns.copy();
    }

    float ratio = 0.3;
    sprite.resize((int)(sprite.width * ratio), (int)(sprite.height * ratio));
    bounds = new Rectangle(width/2 - sprite.width/2, height-sprite.height - 20, sprite.width, sprite.height);
  }

  void paint() {
    integrate();

    // Bullets
    removeSpentBullets();
    for (Bullet b : bullets) {
      b.paint();
    }

    imageMode(CORNER); 
    image(sprite, bounds.x, bounds.y);
  }

  /*
   * Clean up bullets which have left the screen
   */
  void removeSpentBullets() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();

    for (Bullet b : bullets) {
      if (b.bounds.y < 5) {
        destroyedBullets.add(b);
      }
    }

    for (Bullet b : destroyedBullets) {
      bullets.remove(b);
    }
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

    if (space) {
      shoot();
    }
  }

  void onKeyPressed() {
    onKeyAction(true);
  }

  void onKeyReleased() {
    onKeyAction(false);
  }

  /*
   * Fire guns
   */
  void shoot() {

    int y = bounds.y + BULLET_Y_OFFSET;
    PVector vel = new PVector(0, 15);
    PVector pos;
    if (game.dualGunsUpgrade) {

      pos = new PVector((int)bounds.getCenterX()-DUAL_GUNS_SPACING, y);
      bullets.add(createBullet(pos, vel));

      pos = new PVector((int)bounds.getCenterX()+DUAL_GUNS_SPACING, y);
      bullets.add(createBullet(pos, vel));
    } else {
      pos = new PVector((int)bounds.getCenterX(), y);
      bullets.add(createBullet(pos, vel));
    }
  }

  /*
   * Create a new bullet
   */
  Bullet createBullet(PVector pos, PVector vel) {
    Bullet result = new Bullet(pos, vel);
    result.r = 0;
    result.g = 200;
    result.b = 0;
    return result;
  }

  /*
   * Take enemy damage
   */
  void takeDamage() {
    game.health --;
  }

  /*
   * Detect key presses from key down/up events.
   */
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