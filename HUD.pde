/*
 * HUD is a display of a players current game status
 */
 
class HUD extends Scene {

  void paint() {
    fill(255);
    text("Health: " + game.health, 50, 50);
    text("Points: " + game.points, 50, 150);
  }
  
  void onClick() {}
}