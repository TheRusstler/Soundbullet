class Universe extends Scene {

  StatusBar statusBar;
  ArrayList<Scene> visibleTree = new ArrayList<Scene>();
  ArrayList<Planet> planets = new ArrayList<Planet>();

  public Universe() {
     statusBar = new StatusBar();
     visibleTree.add(statusBar);

    // TODO: Be more creative :3
    addPlanet(new Planet(200, 250, music.get(0), "There's no place like it.\nTravel here for ship repairs and upgrades."));
    addPlanet(new Planet(300, 490, music.get(1), "A dangerous planet"));
    addPlanet(new Planet(210, 670, music.get(2), "Just before sunrise, the sky turns a warm shade of violet here"));
    addPlanet(new Planet(850, 210, music.get(3), "Rumour has it, infant Zeus was hidden and raised here"));
    addPlanet(new Planet(900, 430, music.get(4), "Once described as \"The most unintresting planet ever visited\""));
    addPlanet(new Planet(820, 630, music.get(5), "A cold place"));
    addPlanet(new Planet(600, 350, music.get(6), "Seven ships have vanished here"));
    addPlanet(new Planet(560, 610, music.get(7), ""));
    
    //addPlanet(new Planet(560, 610, music.get(7), ""));
    //addPlanet(new Planet(560, 610, music.get(7), ""));
    //addPlanet(new Planet(560, 610, music.get(7), ""));
    
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