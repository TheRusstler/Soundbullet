import java.awt.Rectangle;
import java.util.ArrayList;

public class Menu extends Scene {

  ArrayList<Button> buttons = new ArrayList<Button>();

  public Menu() {
    int buttonWidth = 300, buttonHeight = 60;

    buttons.add(new Button("NEW GAME", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        setScene(new NewGame());
      }
    }
    ));

    buttons.add(new Button("LOAD GAME", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +130, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        exit();
      }
    }
    ));

    buttons.add(new Button("QUIT", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +210, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        exit();
      }
    }
    ));
  }

  void paint() {
    menuLogo();

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