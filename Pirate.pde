class Pirate {

  PImage sprite;
  PVector velocity;
  Rectangle bounds;
  int health = 100;

  // Captain is bigger and stronger
  boolean isCaptain;

  public Pirate(boolean isCaptain, float xPosition) {
    this.isCaptain = isCaptain;
    this.velocity = new PVector(0, 1);

    sprite = pirate.copy();

    if (isCaptain) {
      sprite = pirateCaptain.copy();
    }

    float ratio = 0.6;
    sprite.resize((int)(sprite.width * ratio), (int)(sprite.height * ratio));
    bounds = new Rectangle((int)xPosition - sprite.width/2, (int)-sprite.height, sprite.width, sprite.height);
  }
  
  void takeDamage() {
    
    // Captains take less damage
    if (isCaptain) {
      health -= 1;
    }
    else {
      health -= 3;
    }
    
  }
  
  boolean isDestroyed() {
    return health <= 0;
  }

  // Use target to update velocity.
  void integrate(PVector target) {
    bounds.x += velocity.x; 
    bounds.y -= velocity.y; 
    
    // Travel down to a certain y
    if(bounds.y < 2 * sprite.height) {
      velocity.y = -3;
    }
    else {
      velocity.y = 0;
    }
    
    // Aim x velocity towards target
    PVector position = new PVector((float)bounds.getCenterX(), (float)bounds.getCenterY());
    float a = atan((position.x - target.x) / (position.y - target.y));  
    velocity.x = degrees(a)/5;
    
    fill(255);
    textMode(LEFT);
    text("Angle: " + degrees(a), 50, 50);
  }

  void paint(PVector target) {
    integrate(target);

    imageMode(CORNER);
    image(sprite, bounds.x, bounds.y);
  }
}