/*
 * Simple Win/Lose notification on exit of planet-attack mode.
 */
class Notification extends Scene {

  // Number of frames to wait before loading the next scene.
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
    
    // If time is up, load the next scene
    if (visibility < 0) {
      setScene(nextScene, false);
      return;
    }
    visibility --;

    // Green text for win, red for lose.
    fill(255, 0, 0);
    if (isWin) {
      fill(0, 255, 0);
    }

    textSize(30);
    textAlign(CENTER, CENTER);
    text(text, width/2, height/2);
  }

  void onClick() { }
}