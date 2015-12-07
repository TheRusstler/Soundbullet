/*
 * Home planet / Workshop scene
 */
class HomePlanet extends Scene {

  StatusBar statusBar;
  final int DUAL_GUNS_UPGRADE_PRICE = 10000;

  ArrayList<Button> buttons = new ArrayList<Button>();
  Button dualGunsUpgradeButton;

  Planet planet;

  public HomePlanet(Planet planet) {
    this.planet = planet;
    this.statusBar = new StatusBar();
    createButtons();
  }

  /*
   * Returns to the universe
   */
  void goBack() {
    setScene(universe, false);
  }
  
  /*
   * Returns the cost of ship repair
   */
  int shipRepairCost() {
    return (100 - game.health)*10;
  }

  /*
   * Returns true if the player has enough points to repair his/her ship.
   */
  boolean canAffordShipRepair() {
    return game.points >= shipRepairCost();
  }

  /*
   * Repairs the ship to full health
   */
  void repairShip() {
    if (canAffordShipRepair()) {
      game.points -= shipRepairCost();
      game.health = 100;
    }
  }

  /*
   * Purchases the dual guns upgrade
   */
  void getDualGunsUpgrade() {
    if (game.points >= DUAL_GUNS_UPGRADE_PRICE && game.dualGunsUpgrade == false) {
      game.points -= DUAL_GUNS_UPGRADE_PRICE;
      game.dualGunsUpgrade = true;
    }
  }

  void paint() {
    planet.paint();
    statusBar.paint();
    paintShop();

    for (Button b : buttons) {
      b.paint();
    }

    if (game.dualGunsUpgrade) {
      dualGunsUpgradeButton.title = "Owned";
    }
    dualGunsUpgradeButton.paint();
  }

  int SHOP_X = width/2 - 100, SHOP_Y = height/2 - 200, SHOP_WIDTH = 400, SHOP_HEIGHT = 400;
  int shopButtonWidth = 100, shopButtonHeight = 30;

  /*
   * Draws the workshop
   */
  void paintShop() {

    // Background / border
    fill(102, 0, 204, 40);
    stroke(102, 0, 204);
    strokeWeight(2);
    rect(SHOP_X, SHOP_Y, SHOP_WIDTH, SHOP_HEIGHT);
    line(SHOP_X, SHOP_Y + 50, SHOP_X + SHOP_WIDTH, SHOP_Y + 50);

    fill(255);

    // Title
    textSize(20);
    textAlign(CENTER, CENTER);
    text("WORKSHOP", SHOP_X + SHOP_WIDTH/2, SHOP_Y + 22);

    // Upgrades
    textSize(16);
    itemName("SHIP REPAIR:", 80);
    itemPrice(shipRepairCost(), 80);

    itemName("DUAL TURRETS:", 140);
    itemPrice(10000, 140);
  }

  /*
   * Draws item label
   */
  void itemName(String name, float y) {
    textAlign(LEFT, CENTER);
    text(name, SHOP_X + 15, SHOP_Y + y);
  }

  /*
   * Draws item price
   */
  void itemPrice(int price, float y) {
    textAlign(RIGHT, CENTER);
    text(price + " points", SHOP_X + SHOP_WIDTH - shopButtonWidth - 40, SHOP_Y + y);
  }

  /*
   * Draws item 'buy' buttons
   */
  void createButtons() {
    buttons.add(new Button("BUY", 
      new Rectangle(SHOP_X + SHOP_WIDTH - shopButtonWidth - 20, SHOP_Y + 80 - shopButtonHeight/2, shopButtonWidth, shopButtonHeight), 
      new Runnable() {
      public void run() {
        repairShip();
      }
    }
    , 
      14
      ));

    dualGunsUpgradeButton = new Button("BUY", 
      new Rectangle(SHOP_X + SHOP_WIDTH - shopButtonWidth - 20, SHOP_Y + 140 - shopButtonHeight/2, shopButtonWidth, shopButtonHeight), 
      new Runnable() {
      public void run() {
        getDualGunsUpgrade();
      }
    }
    , 
      14
      );

    buttons.add(new Button("BACK", 
      new Rectangle(SHOP_X, SHOP_Y + SHOP_HEIGHT + 20, SHOP_WIDTH, 60), 
      new Runnable() {
      public void run() {
        goBack();
      }
    }
    ));
  }

  void setupText() {
    fill(255);
    textSize(16);
    textAlign(LEFT, CENTER);
  }

  void onClick() {
    statusBar.onClick();
    for (Button b : buttons) {
      b.onClick();
    }

    // Only fire item upgrade click event if the upgrade has not already been purchased
    if (!game.dualGunsUpgrade) {
      dualGunsUpgradeButton.onClick();
    }
  }
}