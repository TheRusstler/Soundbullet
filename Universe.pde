class Universe extends Scene {

  String playerName;
  public ArrayList<Scene> visibleTree = new ArrayList<Scene>();

  public Universe(String playerName) {
    this.playerName = playerName;

    int buttonWidth = 300, buttonHeight = 60;
    visibleTree.add(new Button("Planet mode", 
      new Rectangle(width/2 - buttonWidth/2, height/2 -buttonHeight/2 +50, buttonWidth, buttonHeight), 
      new Runnable() {
      public void run() {
        setScene(new Menu(), true);
      }
    }
    ));
  }

  void paint() {
    gameLogo();
    
    for(Scene element : visibleTree) {
      element.paint();
    }
  }

  void onClick() {
    for(Scene element : visibleTree) {
      element.onClick();
    }
  }
}