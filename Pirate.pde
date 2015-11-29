class Pirate {

  PImage sprite;
  PVector velocity;
  Shape bounds;
  int health = 100;

  // Captain is bigger and stronger
  boolean isCaptain;

  public Pirate(boolean isCaptain, float xPosition) {
    this.isCaptain = isCaptain;
    this.velocity = new PVector(0, 1);

    sprite = pirate.copy();

    if (isCaptain) {
      sprite = pirateCaptain.copy();
      health = 500;
    }

    float ratio = 0.6;
    sprite.resize((int)(sprite.width * ratio), (int)(sprite.height * ratio));
    bounds = new Rectangle((int)xPosition - sprite.width/2, (int)-sprite.height, sprite.width, sprite.height);
    
    if (isCaptain) {
      bounds = new Ellipse2D.Float((int)xPosition - sprite.width/2, (int)-sprite.height, sprite.width, sprite.height);
    }
  }

  Bullet shoot() {
    int y = bounds.getBounds().y + bounds.getBounds().height;
    PVector pos = new PVector((int)bounds.getBounds().getCenterX(), y);
    return new Bullet(pos, new PVector(0, -5));
  }

  void takeDamage() {

    // Captains take less damage
    if (isCaptain) {
      health -= 1;
    } else {
      health -= 3;
    }
  }

  boolean isDestroyed() {
    return health <= 0;
  }

  boolean reachedScreen = false;
  // Use target to update velocity.
  void integrate(PVector target) {
    bounds.getBounds().x += velocity.x; 
    bounds.getBounds().y -= velocity.y; 

    // Travel down to a certain y
    boolean offScreen = bounds.getBounds().y < 2 * sprite.height;
    if (!reachedScreen) {
      if (offScreen) {
        velocity.y = -1;
      } else {
        velocity.y = 0;
        reachedScreen = true;
      }
    }

    navigate(target);
  }

  float xoff = 0.0;
  float yoff = 0.0;
  boolean forwards = true;
  void navigate(PVector target) {
    xoff = xoff + .05; // Noisy motion, increase for more
    yoff = yoff + .01;

    // Aim x velocity towards target
    PVector position = new PVector((float)bounds.getBounds().getCenterX(), (float)bounds.getBounds().getCenterY());
    float a = atan((position.x - target.x) / -Math.abs((position.y - target.y)));  
    velocity.x = noise(xoff) * (a*5);

    // If ship if fully on screen
    if (reachedScreen) { 
      // If too high or too low on screen, change direction.
      if (position.y < height *.2) {
        forwards = true;
      }
      if (position.y > height * .4) {
        forwards = false;
      }

      // Apply noise to velocity
      if (forwards) {
        velocity.y = noise(yoff) * -3;
      } else {
        velocity.y = noise(yoff) * 3;
      }
    }

    fill(255);
    textMode(LEFT);
  }

  void paint(PVector target) {
    integrate(target);

    imageMode(CORNER);
    image(sprite, bounds.getBounds().x, bounds.getBounds().y);
  }
}