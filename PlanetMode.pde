class PlanetMode extends Scene {
  
  private Planet planet;
  
  public PlanetMode(Planet planet) {
    this.planet = planet;
  }
  
  void paint() {
    textSize(12);
    textAlign(LEFT, TOP);
    fill(255);
    text(planet.name, 
      mouseX,
      mouseY);
  }
  
  void onClick() {
    planet.song.play();
    //setScene(new Universe(),false);
  }
}