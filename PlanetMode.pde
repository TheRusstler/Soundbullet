class PlanetMode extends Scene {

  private Planet planet;

  public PlanetMode(Planet planet) {
    this.planet = planet;
    showStars = false;
  }

  public void exitPlanetMode() {
    showStars = true;
  }



  void paint() {
    textSize(12);
    textAlign(LEFT, TOP);

    paintBackground();
  }

  int offset1 = surface.height*-1 + height;

  void paintBackground() {
    imageMode(CORNER);

    rect(0, 0, width, height);

    if (offset1 >= 0) {
      if (offset1 > height) {
        offset1 = surface.height*-1 + height;
      } else {
        image(surface, width/2 - surface.width/2, offset1 - surface.height);
      }
    }
    
   image(surface, width/2 - surface.width/2, offset1);

    offset1 += 5;
  }


  void onClick() {
    //planet.song.play();
    returnToUniverse();
  }

  void returnToUniverse() {
    setScene(universe, false); 
    showStars = true;
  }
}