import java.awt.Rectangle;

class Menu {
  final int buttonWidth = 300, buttonHeight = 60;
  Rectangle newGame, loadGame, quit;
  
  public Menu() {
    newGame =   new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 -100, buttonWidth, buttonHeight);
    loadGame =  new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 -0, buttonWidth, buttonHeight);
    quit =      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +100, buttonWidth, buttonHeight);
  }
  
  void paint() {
    menuButtons();
  }
  
  void menuButtons() {
    textSize(22);
    textAlign(CENTER, CENTER);
    
    drawButton(newGame, "New Game");
    drawButton(loadGame, "Load Game");
    drawButton(quit, "Quit");
  }
  
  void drawButton(Rectangle rect, String label) {
    noFill();
    stroke(102, 0, 204);
    strokeWeight(2);
    rect((float)rect.getX(), (float)rect.getY(), (float)rect.getWidth(), (float)rect.getHeight());
    
    fill(255);
    text(label, (float)rect.getCenterX()-2, (float)rect.getCenterY()-2);
  }
  
  void clicked() {
    if(newGame.contains(mouseX, mouseY)) {
      
    }
  }
}