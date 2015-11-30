/*
 * HUD is a display of a players current game status
 */
 
class HUD extends Scene {

  void paint() {
    fill(255);
    textSize(16);
    textAlign(LEFT);
    text("Health:\n" + game.health + "%", 10, 50);
    text("Points:\n" + game.points, 10, 150);
  }
  
  void onClick() {}
}