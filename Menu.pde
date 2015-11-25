public class Menu extends Scene {

  ArrayList<Button> buttons = new ArrayList<Button>();

  public Menu() {
    int buttonWidth = 300, buttonHeight = 60;

    game = loadGame();

    buttons.add(new Button("NEW CAMPAIGN", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        setScene(new NewGame(), false);
      }
    }
    ));

    buttons.add(new Button("LOAD", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +130, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        if(game != null) {
          setScene(new Universe(), true);
        }
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

  public Game loadGame() { 
    Game result = null;

    File path = new File(dataPath("save.json"));
    if (path.exists()) {
      JSONObject json = loadJSONObject(dataPath("save.json"));
      result = new Game(
        json.getString("player"), 
        json.getInt("health"),
        json.getInt("points"));
    }

    return result;
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