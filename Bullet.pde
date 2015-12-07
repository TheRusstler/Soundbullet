/*
 * A bullet is a projectile fired by ships
 */
class Bullet {

  final int DIAMETER = 5;
  
  PVector velocity;
  Rectangle bounds;
  
  // Bullet colour
  int r=200, g=0, b=0;

  public Bullet(PVector pos, PVector velocity) {
    pos.x = pos.x - DIAMETER/2;
    this.bounds = new Rectangle((int)pos.x, (int)pos.y, DIAMETER, DIAMETER);
    this.velocity = velocity;
  }

  void integrate() {
    // Bullets only move vertically
    bounds.y -= velocity.y; 
  }

  void paint() {
    integrate();
    
    ellipseMode(CORNER);
    fill(r, g, b);
    ellipse((float)bounds.x, (float)bounds.y, (float)bounds.width, (float)bounds.height);
  }
}