class Universe extends Scene {

  String playerName;
  ArrayList<Scene> visibleTree = new ArrayList<Scene>();
  ArrayList<Planet> planets = new ArrayList<Planet>();

  public Universe() {
    int buttonWidth = 100, buttonHeight = 40;
    visibleTree.add(new Button("Menu", 
      new Rectangle(5, 5, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        saveAndExit();
      }},
      14
     ));

    // TODO: Be more creative :3
    addPlanet(new Planet(200, 250, music.get(0), "There's no place like it.\nTravel here for ship repairs and upgrades."));
    addPlanet(new Planet(300, 490, music.get(1), "A dangerous planet"));
    addPlanet(new Planet(210, 670, music.get(2), "Just before sunrise, the sky turns a warm shade of violet here"));
    addPlanet(new Planet(850, 210, music.get(3), "Rumour has it, infant Zeus was hidden and raised here"));
    addPlanet(new Planet(900, 430, music.get(4), "Once described as \"The most unintresting planet ever visited\""));
    addPlanet(new Planet(820, 630, music.get(5), "A cold place"));
    addPlanet(new Planet(600, 350, music.get(6), "Seven ships have vanished here"));
    addPlanet(new Planet(560, 610, music.get(7), ""));
    
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

    drawHUD();

    for (Planet planet : planets) {
      if (planet.bounds.contains(mouseX, mouseY)) {
        planet.mouseOverWindow();
      }
    }
  }

  final int HUD_WIDTH = 250, HUD_HEIGHT = 400, HUD_PADDING = 55;
  void drawHUD() {
    int hudX, hudY;
    hudX = width-HUD_WIDTH + 5;
    hudY = height/2 - HUD_HEIGHT/2;

    stroke(102, 0, 204);
    strokeWeight(2);
    fill(102, 0, 204, 40);
    rect(hudX, hudY, HUD_WIDTH, HUD_HEIGHT, 0);

    textAlign(CENTER, TOP);
    textSize(20);
    fill(255);
    text(String.format("CAPTAIN %s", game.player), hudX + HUD_WIDTH/2, hudY + 30);
   
    textSize(16);
    text("STATUS REPORT:", hudX + HUD_WIDTH/2, hudY + 80);
    
    textSize(14);
    text("Health: " + game.health + "%" , hudX + HUD_WIDTH/2, hudY + 110);
    text("Points: " + game.points, hudX + HUD_WIDTH/2, hudY + 140);
    text("Online ranking: #" + game.getOnlineRanking(), hudX + HUD_WIDTH/2, hudY + 170);
    text("Empire size: " + game.getOnlineRanking(), hudX + HUD_WIDTH/2, hudY + 200);
  }

  void onClick() {
    for (Scene element : visibleTree) {
      element.onClick();
    }
  }
  
  void saveAndExit() {
    game.save();
    setScene(new Menu(), false);
  }
}