class HomePlanet extends Scene {

  ArrayList<Button> buttons = new ArrayList<Button>();
  int buttonWidth = 300, buttonHeight = 60;
  HUD hud;

  public HomePlanet() {
    this.hud = new HUD();

    buttons.add(new Button("REPAIR SHIP", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        game.health = 100;
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

  void paint() {
    hud.paint();

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