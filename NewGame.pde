class NewGame extends Scene {

  String name = "";
  Button start, back;

  Rectangle textBoxBorder;

  int buttonWidth = 140, buttonHeight = 60, textBoxWidth = 300;

  public NewGame() {
    textBoxBorder = new Rectangle(width/2 - textBoxWidth/2, height/2 -buttonHeight/2 +70, textBoxWidth, buttonHeight);

    start = new Button("GO!", 
      new Rectangle(width/2 + 10, height/2 -buttonHeight/2 +210, buttonWidth, buttonHeight), 
      new Runnable() { 
      void run() {
        submit();
      }
    }
    );
    back = new Button("BACK", 
      new Rectangle(width/2 - buttonWidth - 10, height/2 -buttonHeight/2 +210, buttonWidth, buttonHeight), 
      new Runnable() { 
      void run() {
        setScene(new Menu(), false);
      }
    }
    );
  }

  void paint() {
    menuLogo();
    start.paint();
    back.paint();
    textbox();
    textboxLabel();
  }

  void onClick() {
    start.onClick();
    back.onClick();
  }

  void textbox() {
    if (textBoxBorder.contains(mouseX, mouseY)) {
      fill(255, 60);
    } else {
      fill(255, 40);
    }

    stroke(255);
    strokeWeight(2);
    rect((float)textBoxBorder.getX(), (float)textBoxBorder.getY(), (float)textBoxBorder.getWidth(), (float)textBoxBorder.getHeight());

    fill(255);
    textSize(22);
    textAlign(CENTER, CENTER);
    text(name, (float)textBoxBorder.getCenterX()-2, (float)textBoxBorder.getCenterY()-2);
  }

  void textboxLabel() {
    textSize(20);
    textAlign(LEFT, CENTER);
    fill(255);
    text("WHAT'S YOUR NAME, CAPTAIN?", width/2 - textBoxWidth/2, height/2 +10);
  }

  void onKeyPressed(KeyEvent event) {
    char ch = event.getKey();
    if (Character.isLetter(ch) || Character.isDigit(ch) || ch == ' ') {
      if (name.length() < 11)
        name += Character.toUpperCase(ch);
    } else if (ch == BACKSPACE && name.length() > 0) {
      name = name.substring(0, name.length()-1);
    } else if (ch == ENTER) {
      submit();
    }
  }

  void submit() {
    if (name != null && !name.isEmpty()) {
      game = new Game(this.name);
      universe = new Universe();
      setScene(universe, true);
    }
  }
}