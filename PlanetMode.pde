class PlanetMode extends Scene {

  private Planet planet;
  private Ship ship;

  int offset1 = surface.height*-1 + height;
  float tintRatio = 0.75;

  public PlanetMode(Planet planet) {
    this.planet = planet;
    this.ship = new Ship();
    showStars = false;
    noCursor();
  }

  public void exitPlanetMode() {
    showStars = true;
  }

  void paint() {
    rectMode(CENTER);

    paintBackground();
    ship.paint();


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

    offset1 += 5;
    
    noTint();
  }


  void onClick() {
    //planet.song.play();
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