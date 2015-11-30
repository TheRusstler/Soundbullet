/*
 * HUD is a display of a players current game status
 */

class HUD extends Scene {

  void paint() {
    fill(255);
    textSize(16);
    textAlign(LEFT);

    fill(255, 0, 0);
    text("Health:\n" + game.health + "%", 10, 50);

    fill(0, 0, 255);
    text("Points:\n" + game.points, 10, 150);
  }

  void onClick() {
  }
}