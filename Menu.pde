import java.awt.Rectangle;
import java.util.ArrayList;

public class Menu implements Scene {

  ArrayList<Button> buttons = new ArrayList<Button>();
  
  public Menu() {
    int buttonWidth = 300, buttonHeight = 60;
    
    buttons.add(new Button("New Game", new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 -50, buttonWidth, buttonHeight)));
    buttons.add(new Button("Load Game", new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +50, buttonWidth, buttonHeight)));
    buttons.add(new Button("Quit", new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +150, buttonWidth, buttonHeight)));
  }
  
  void paint() {
    logo();
    
    for(Button b : buttons) {
      b.paint();
    }
  }
  
  void logo() {
    textSize(70);
    textAlign(CENTER, CENTER);
    text("Soundbullet", width/2, 250);
  }
  
  void onClick() {
    for(Button b : buttons) {
      b.onClick();
    }
  }
}