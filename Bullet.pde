class Bullet {

  final int SIZE = 5;
  PVector velocity;
  Rectangle bounds;

  public Bullet(PVector pos) {
    pos.x = pos.x - SIZE/2;
    this.bounds = new Rectangle((int)pos.x, (int)pos.y, SIZE, SIZE);
    this.velocity = new PVector(0, 15);
  }

  void integrate() {
    bounds.y -= velocity.y; 
  }

  void paint() {
    integrate();
    
    // Debug to see ship bounds.
    ellipseMode(CORNER);
    fill(200, 0, 0);
    ellipse((float)bounds.x, (float)bounds.y, (float)bounds.width, (float)bounds.height);
  }
}