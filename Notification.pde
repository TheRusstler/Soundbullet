class Notification extends Scene {

  int visibility = 90;
  String text;
  boolean isWin;
  Scene nextScene;

  public Notification(String text, boolean isWin, Scene nextScene) {
    this.text = text;
    this.isWin = isWin;
    this.nextScene = nextScene;
  }

  void paint() {
    if (visibility < 0) {
      setScene(nextScene, false);
      return;
    }
    visibility --;


    fill(255, 0, 0);
    if (isWin) {
      fill(0, 255, 0);
    }

    textSize(30);
    textAlign(CENTER, CENTER);
    text(text, width/2, height/2);
  }

  void onClick() {
  }
}