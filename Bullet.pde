class Bullet {

  final int SIZE = 5;
  PVector velocity;
  Rectangle bounds;
  int r=200, g=0, b=0;

  public Bullet(PVector pos, PVector velocity) {
    pos.x = pos.x - SIZE/2;
    this.bounds = new Rectangle((int)pos.x, (int)pos.y, SIZE, SIZE);
    this.velocity = velocity;
  }

  void integrate() {
    bounds.y -= velocity.y; 
  }

  void paint() {
    integrate();
    
    // Debug to see ship bounds.
    ellipseMode(CORNER);
    fill(r, g, b);
    ellipse((float)bounds.x, (float)bounds.y, (float)bounds.width, (float)bounds.height);
  }
}