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
                                      music.get(0), 
                                      "A cold place"));
                                      
    addPlanet(new Planet(300, 490, "Gaspra", music.get(0), "A dangerous planet"));
    addPlanet(new Planet(210, 670, "Ida", music.get(0),"Just before sunrise, the sky turns a warm shade of violet here"));
    addPlanet(new Planet(850, 210, "Dactyl", music.get(0), "Rumour has it, infant Zeus was hidden and raised here"));
    addPlanet(new Planet(900, 430, "Callisto", music.get(0), "Once described as \"The most unintresting planet ever visited\""));
    addPlanet(new Planet(820, 630, "Elara", music.get(0), ""));
    addPlanet(new Planet(600, 350, "Leda", music.get(0), ""));
    addPlanet(new Planet(560, 610, "Mneme", music.get(0), ""));
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