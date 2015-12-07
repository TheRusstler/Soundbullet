/*
 * Bar at the top of the screen in universe mode.
 */
class StatusBar extends Scene {

  Button menu;

  public StatusBar() {

    int buttonWidth = 100, buttonHeight = 30;
    menu = new Button("Menu", 
      new Rectangle(5, 5, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        saveAndExit();
      }
    }, 14);
  }

  void paint() {
    noStroke();
    fill(35, 6, 63);
    rect(0, 0, width, 40);
    
    menu.paint();
    
    textAlign(CENTER, TOP);
    textSize(16);
    fill(255);
    
    text(String.format("%s POINTS", game.points), width/4, 10);
    
    if(!game.isWon()) {
      text(String.format("CAPTAIN %s", game.player), width/2, 10);
    }
    else {
      text("YOU WIN!      GAME COMPLETED!", width/2, 10);
    }
    
    text(game.health + "% HEALTH", width * 3/4, 10);
  }


  void onClick() {
    menu.onClick();
  }
}