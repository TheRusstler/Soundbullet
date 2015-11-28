class PlanetMode extends Scene {

  Planet planet;
  Ship ship;

  final int BACKGROUND_SCROLL_SPEED = 2;
  ArrayList<Pirate> pirates = new ArrayList<Pirate>(); 
  ArrayList<Bullet> enemyBullets = new ArrayList<Bullet>(); 

  int offset1 = surface.height*-1 + height;
  float tintRatio = 0.4;

  public PlanetMode(Planet planet) {
    this.planet = planet;
    this.ship = new Ship();

    showStars = false;
    noCursor();

    //planet.song.track.cue(1000 * 120);
    planet.song.track.play();
  }

  public void exitPlanetMode() {
    showStars = true;
  }

  void managePirates() {
    removeSpentBullets();
    detectFriendlyBulletCollisions();
    detectEnemyBulletCollisions();
    enemyAttack();

    int surfaceX = width/2 - surface.width/2;
    if (pirates.size() < 1) {
      pirates.add(new Pirate(false, random(surfaceX + 50, surfaceX + surface.width -50)));
    } else if (pirates.size() < 8 && frameCount%100 == 0) {
      pirates.add(new Pirate(false, random(surfaceX + 50, surfaceX + surface.width -50)));
    }
  }

  double getAudioMixLevel() {
    return planet.song.track.mix.level()*1000;
  }

  double fireRate = 0; // 0 - 250 normal range
  void enemyAttack() {
    fireRate = getAudioMixLevel();
    boolean fire = random(50, 300) < (float)getAudioMixLevel();
    
    if (frameCount % 3 == 0 && fire) {
      for (Pirate p : pirates) {
        enemyBullets.add(p.shoot());
      }
    }
  }

  void removeSpentBullets() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();

    for (Bullet b : enemyBullets) {
      if (b.bounds.y > height + 5) {
        destroyedBullets.add(b);
      }
    }

    for (Bullet b : destroyedBullets) {
      enemyBullets.remove(b);
    }
  }

  void detectEnemyBulletCollisions() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();

    for (Bullet b : enemyBullets) {
      if (b.bounds.intersects(ship.bounds)) {
        destroyedBullets.add(b);
        ship.takeDamage();
      }
    }

    for (Bullet b : destroyedBullets) {
      enemyBullets.remove(b);
    }
  }

  void detectFriendlyBulletCollisions() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();
    ArrayList<Pirate> destroyedPirates = new ArrayList();

    for (Pirate p : pirates) {
      for (Bullet b : ship.bullets) {
        if (p.bounds.intersects(b.bounds)) {
          destroyedBullets.add(b);
          p.takeDamage();

          if (p.isDestroyed()) {
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

    for (Bullet b : enemyBullets) {
      b.paint();
    }

    ship.paint();

    for (Pirate p : pirates) {
      p.paint(new PVector((float)ship.bounds.getCenterX(), (float)ship.bounds.getCenterY()));
    }

    text("Health: " + game.health, 50, 50);
    rectMode(CORNER);
  }

  float mixLevel = 1;
  void paintBackground() {
    imageMode(CORNER);

    float ratio = tintRatio;

    fill(0);
    rect(0, 0, width, height);
    tint(planet.r * ratio, planet.g * ratio, planet.b * ratio);

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
    planet.song.track.pause();
    planet.song.track.rewind();
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