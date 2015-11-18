class NewGame implements Scene {

  String name = "";
  Button start, back;

  public NewGame() {
    int buttonWidth = 140, buttonHeight = 60;
    start = new Button("GO!", 
      new Rectangle(width/2 + 10, height/2 -buttonHeight/2 +200, buttonWidth, buttonHeight), 
      new Runnable() { 
      void run() {
        submit();
      }
    }
    );
    back = new Button("BACK", 
      new Rectangle(width/2 - buttonWidth - 10, height/2 -buttonHeight/2 +200, buttonWidth, buttonHeight), 
      new Runnable() { 
      void run() {
        scene = new Menu();
      }
    }
    );
  }

  void paint() {
    logo();
    start.paint();
    back.paint();
    textbox();
  }

  void onClick() {
    start.onClick();
    back.onClick();
  }

  void logo() {
    textSize(70);
    textAlign(CENTER, CENTER);
    text("Soundbullet", width/2, 250);
  }
  
  void submit() {
    exit();
  }
}