class Button extends Scene {

  private Rectangle rect;
  private String title;
  private Runnable onClicked;
  
  public Button(String title, Rectangle dimensions, Runnable onClicked) {
    this.rect = dimensions;
    this.title = title;
    this.onClicked = onClicked;
  }

  void paint() {
    if (rect.contains(mouseX, mouseY)) {
      fill(102, 0, 204, 100);
    } else {
      fill(102, 0, 204, 40);
    }

    stroke(102, 0, 204);
    strokeWeight(3);
    rect((float)rect.getX(), (float)rect.getY(), (float)rect.getWidth(), (float)rect.getHeight());

    fill(255);
    textSize(22);
    textAlign(CENTER, CENTER);
    text(title, (float)rect.getCenterX()-2, (float)rect.getCenterY()-2);
  }

  void onClick() {
    if (rect.contains(mouseX, mouseY)) {
      if (onClicked != null) {
        onClicked.run();
      }
    }
  }
}