class PlanetMode extends Scene {

  Planet planet;
  Ship ship;

  final int BACKGROUND_SCROLL_SPEED = 2;
  ArrayList<Pirate> pirates = new ArrayList<Pirate>(); 

  int offset1 = surface.height*-1 + height;
  float tintRatio = 0.4;

  public PlanetMode(Planet planet) {
    this.planet = planet;
    this.ship = new Ship();

    showStars = false;
    noCursor();
    
    planet.song.play();
  }

  public void exitPlanetMode() {
    showStars = true;
  }

  void managePirates() {
    detectBulletPirateCollisions();
    
    int surfaceX = width/2 - surface.width/2;
    if (pirates.size() < 1) {
      pirates.add(new Pirate(false, random(surfaceX + 50,  surfaceX + surface.width -50)));
    }
    //else if(pirates.size() < 8 && frameCount%200 == 0){
    //  pirates.add(new Pirate(false, random(surfaceX + 50,  surfaceX + surface.width -50)));
    //}
  }

  void detectBulletPirateCollisions() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();
    ArrayList<Pirate> destroyedPirates = new ArrayList();

    for (Pirate p : pirates) {
      for (Bullet b : ship.bullets) {
        if (p.bounds.intersects(b.bounds)) {
          destroyedBullets.add(b);
          p.takeDamage();
          
          if(p.isDestroyed()) {
            destroyedPirates.add(p);
          }
        }
      }
    }

    for (Bullet b : destroyedBullets) {
      ship.bullets.remove(b);
    }
    for (Pirate p : destroyedPirates) {
      pirates.remove(p);
    }
  }

  void paint() {
    managePirates();

    rectMode(CENTER);

    paintBackground();
    ship.paint();

    for (Pirate p : pirates) {
      p.paint(new PVector((float)ship.bounds.getCenterX(), (float)ship.bounds.getCenterY()));
    }

    rectMode(CORNER);
  }

  void paintBackground() {
    imageMode(CORNER);

    fill(0);
    rect(0, 0, width, height);
    tint(planet.r * tintRatio, planet.g * tintRatio, planet.b * tintRatio);

    if (offset1 >= 0) {
      if (offset1 > height) {
        offset1 = surface.height*-1 + height;
      } else {
        image(surface, width/2 - surface.width/2, offset1 - surface.height);
      }
    }

    image(surface, width/2 - surface.width/2, offset1);

    offset1 += BACKGROUND_SCROLL_SPEED;

    noTint();
  }


  void onClick() {
    planet.song.stop();
    returnToUniverse();
  }

  void onKeyPressed() {
    ship.onKeyPressed();
  }

  void onKeyReleased() {
    ship.onKeyReleased();
  }

  void returnToUniverse() {
    setScene(universe, false); 
    showStars = true;
    cursor();
  }
}