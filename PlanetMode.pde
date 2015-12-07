/*
 * Planet-attack mode.
 */
class PlanetMode extends Scene {

  Planet planet;
  Ship ship;

  final int BACKGROUND_SCROLL_SPEED = 2;

  ArrayList<Pirate> pirates = new ArrayList<Pirate>(); 
  ArrayList<Bullet> enemyBullets = new ArrayList<Bullet>(); 
  HUD headsUpDisplay;

  float tintRatio = 0.4;
  int offset1 = surface.height * -1 + height;
  double fireRate = 0; // 0 - 250 normal range
  boolean captainSpawned = false;

  public PlanetMode(Planet planet) {
    this.planet = planet;

    this.ship = new Ship();
    this.headsUpDisplay = new HUD();

    showStars = false;
    noCursor();

    universeMusic.pause();
    planet.song.track.cue(1000 * 180);
    planet.song.track.play();
  }

  void managePirates() {
    removeSpentBullets();
    detectFriendlyBulletCollisions();
    detectEnemyBulletCollisions();
    enemyAttack();
    spawnPirates();
  }

  /*
   * Spawns pirates. Max 5.
   */
  void spawnPirates() {
    if (!captainSpawned) {

      // Spawn captain if near the end.
      if (planet.song.track.length() - planet.song.track.position() < 30000) {
        pirates.add(new Pirate(true, width/2));
        captainSpawned = true;
      } 

      // Otherwise, keep spawning pirates.
      else {        
        int surfaceX = width/2 - surface.width/2;
        if (pirates.size() < 1) {
          pirates.add(new Pirate(false, random(surfaceX + 50, surfaceX + surface.width -50)));
        } else if (pirates.size() < 8 && frameCount%100 == 0) {
          pirates.add(new Pirate(false, random(surfaceX + 50, surfaceX + surface.width -50)));
        }
      }
    }
  }

  /*
   * Get the current amplitude of the music
   */
  double getAudioMixLevel() {
    return planet.song.track.mix.level()*1000;
  }

  /*
   * Make enemies fire bullets
   */
  void enemyAttack() {
    fireRate = getAudioMixLevel();
    boolean fire = random(50, 300) < (float)getAudioMixLevel();

    if (frameCount % 3 == 0) {
      for (Pirate p : pirates) {
        if (fire || captainSpawned && p.isCaptain) {
          enemyBullets.add(p.shoot());
        }
      }
    }
  }

  /*
   * Clean up destroyed or off screen bullets
   */
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

  /*
   * Cause ship damage by enemy bullets
   */
  void detectEnemyBulletCollisions() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();

    for (Bullet b : enemyBullets) {
      if (b.bounds.intersects(ship.bounds)) {
        destroyedBullets.add(b);
        ship.takeDamage();

        if (game.health <= 0) {
          game.health = 0;
          lose();
        }
      }
    }

    for (Bullet b : destroyedBullets) {
      enemyBullets.remove(b);
    }
  }

  /*
   * Cause damage to pirates with friendly bullets
   */
  void detectFriendlyBulletCollisions() {
    ArrayList<Bullet> destroyedBullets = new ArrayList();
    ArrayList<Pirate> destroyedPirates = new ArrayList();

    for (Pirate p : pirates) {
      for (Bullet b : ship.bullets) {
        if (p.isHit(b)) {
          destroyedBullets.add(b);
          p.takeDamage();
          game.points++;

          if (p.isDestroyed()) {
            destroyedPirates.add(p);

            if (p.isCaptain) { 
              game.points += 1000;
              win();
            } else {
              game.points += 100;
            }
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
    paintBackground();

    headsUpDisplay.paint();

    for (Bullet b : enemyBullets) {
      b.paint();
    }

    ship.paint();

    for (Pirate p : pirates) {
      p.paint(new PVector((float)ship.bounds.getCenterX(), (float)ship.bounds.getCenterY()));
    }
  }

  /*
   * Infinite scrolling background
   */
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

  void onClick() {}

  void onKeyPressed() {
    ship.onKeyPressed();
  }

  void onKeyReleased() {
    ship.onKeyReleased();
  }

  void lose() {
    returnToUniverse();
    setScene(new Notification("0% health. You escape.", false, universe), false);
  }

  void win() {
    game.planetsConquered[planet.index-1] = true;
    returnToUniverse();
    setScene(new Notification("Planet conquered!", true, universe), false);
  }

  void returnToUniverse() {
    planet.song.track.pause();
    planet.song.track.rewind();
    universeMusic.play();
    showStars = true;
    cursor();
  }
}