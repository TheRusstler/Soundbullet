class Universe extends Scene {

  String playerName;
  ArrayList<Scene> visibleTree = new ArrayList<Scene>();
  ArrayList<Planet> planets = new ArrayList<Planet>();

  public Universe() {
    int buttonWidth = 300, buttonHeight = 60;
    visibleTree.add(new Button("Regenerate Planets", 
      new Rectangle(width/2 - buttonWidth/2, height -buttonHeight/2 - 50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        setScene(new Universe(), false);
      }
    }
    ));

    // TODO: Be more creative :3
    addPlanet(new Planet(200, 250, "Breathing Underwater", 
                                      "Hollywood Principle - Breathing Underwater (Ether Remix).mp3", 
                                      "A cold place"));
                                      
    addPlanet(new Planet(300, 490, "Gaspra", "default.mp3", "A dangerous planet"));
    addPlanet(new Planet(210, 670, "Ida", "default", "Just before sunrise, the sky turns a warm shade of violet here"));

    addPlanet(new Planet(850, 210, "Dactyl", "default.mp3", "Rumour has it, infant Zeus was hidden and raised here"));
    addPlanet(new Planet(900, 430, "Callisto", "default.mp3", "Once described as \"The most unintresting planet ever visited\""));

    addPlanet(new Planet(820, 630, "Elara", "default.mp3", ""));

    addPlanet(new Planet(600, 350, "Leda", "default.mp3", ""));
    addPlanet(new Planet(560, 610, "Mneme", "default.mp3", ""));
  }
  
  void addPlanet(Planet planet) {
    planets.add(planet);
    visibleTree.add(planet);
  }

  void paint() {

    for (Scene element : visibleTree) {
      element.paint();
    }

    for (Planet planet : planets) {
      planet.paint();
    }

    for (Planet planet : planets) {
      if (planet.bounds.contains(mouseX, mouseY)) {
        planet.mouseOverWindow();
      }
    }
  }

  void onClick() {
    for (Scene element : visibleTree) {
      element.onClick();
    }
  }
}