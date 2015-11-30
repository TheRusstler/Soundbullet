class Universe extends Scene {

  StatusBar statusBar;
  ArrayList<Scene> visibleTree = new ArrayList<Scene>();
  ArrayList<Planet> planets = new ArrayList<Planet>();

  public Universe() {
     statusBar = new StatusBar();
     visibleTree.add(statusBar);

    addPlanet(new Planet(200, 250, "There's no place like it.\nTravel here for ship repairs and upgrades.", 0));
    addPlanet(new Planet(300, 490, "A dangerous planet", 1));
    addPlanet(new Planet(210, 670, "Just before sunrise, the sky turns a warm shade of violet here", 2));
    addPlanet(new Planet(850, 210, "Rumour has it, infant Zeus was hidden and raised here", 3));
    addPlanet(new Planet(900, 430, "Once described as \"The most unintresting planet ever visited\"", 4));
    addPlanet(new Planet(820, 630, "A cold place", 5));
    addPlanet(new Planet(600, 350, "Seven ships have vanished here", 6));
    addPlanet(new Planet(560, 610, "", 7));
    
    universeMusic.play();
    universeMusic.loop();
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