class Universe extends Scene {

  String playerName;
  ArrayList<Scene> visibleTree = new ArrayList<Scene>();
  ArrayList<Planet> planets = new ArrayList<Planet>();

  public Universe(String playerName) {
    this.playerName = playerName;

    int buttonWidth = 300, buttonHeight = 60;
    visibleTree.add(new Button("Planet mode", 
      new Rectangle(width/2 - buttonWidth/2, height -buttonHeight/2 - 50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        setScene(new Menu(), true);
      }
    }
    ));
    
    planets.add(new Planet(250,250));
    planets.add(new Planet(600,350));
    planets.add(new Planet(270,600));
  }

  void paint() {
    gameLogo();

    for (Scene element : visibleTree) {
      element.paint();
    }
    
    for (Planet planet : planets) {
      planet.paint();
    }
  }

  void onClick() {
    for (Scene element : visibleTree) {
      element.onClick();
    }
  }
}