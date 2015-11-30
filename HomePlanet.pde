class HomePlanet extends Scene {

  ArrayList<Button> buttons = new ArrayList<Button>();
  int buttonWidth = 300, buttonHeight = 60;
  Planet planet;

  public HomePlanet(Planet planet) {
    this.planet = planet;

    buttons.add(new Button("REPAIR SHIP", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        repairShip();
      }
    }
    ));

    buttons.add(new Button("BACK", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +100, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        goBack();
      }
    }
    ));
  }
  
  void goBack() {
    setScene(universe, false);
  }
  
  int shipRepairCost() {
    return (100 - game.health)*10;
  }
  
  boolean canAffordShipRepair() {
    return game.points > shipRepairCost();
  }
  
  void repairShip() {
    if(canAffordShipRepair()) {
        game.points -= shipRepairCost();
        game.health = 100;
    }
  }

  void paint() {
    planet.paint();

    fill(255);
    textAlign(CENTER);
    text("Ship health: " + game.health + "%", width/2, height/2 - 150);
    text("Ship repair cost: " + shipRepairCost() + " points", width/2, height/2 - 100);
    for (Button b : buttons) {
      b.paint();
    }
  }

  void onClick() {
    for (Button b : buttons) {
      b.onClick();
    }
  }
}