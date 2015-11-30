/*
 * HUD is a display of a players current game status
 */
 
class HUD extends Scene {

  void paint() {
    fill(255);
    textSize(16);
    textAlign(LEFT);
    text("Health: " + game.health + "%", 50, 50);
    text("Points: " + game.points, 50, 100);
  }
  
  void onClick() {}
}