class Pirate {

  PImage sprite;
  PVector velocity;
  Rectangle bounds;
  int health = 100;

  // Captain is bigger and stronger
  boolean isCaptain;

  public Pirate(boolean isCaptain, PVector position) {
    this.isCaptain = isCaptain;
    this.velocity = new PVector(1, 0);

    sprite = pirate.copy();

    if (isCaptain) {
      sprite = pirateCaptain.copy();
    }

    float ratio = 0.6;
    sprite.resize((int)(sprite.width * ratio), (int)(sprite.height * ratio));
    bounds = new Rectangle((int)position.x - sprite.width/2, (int)position.y-sprite.height - 20, sprite.width, sprite.height);
  }
  
  void takeDamage() {
    
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

  void integrate() {
    bounds.x += velocity.x; 
    bounds.y -= velocity.y; 
  }

  void paint() {
    integrate();

    //rectMode(CORNER);
    //fill(255, 255, 255, 50);
    //rect((float)bounds.x, (float)bounds.y, (float)bounds.width, (float)bounds.height);

    imageMode(CORNER);
    image(sprite, bounds.x, bounds.y);
  }
}