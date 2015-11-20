import java.awt.geom.*;

class Planet extends Scene {

  PImage type;
  float rotation;
  PVector position;
  int diameter;
  int r, g, b;

  Ellipse2D bounds;

  public Planet(int x, int y) {
    this.position =  new PVector(x, y);

    if (random(0, 1) > 0.5) {
      type = planetType1.copy();
    } else {
      type = planetType2.copy();
    }

    diameter = (int)random(100, 250);
    bounds = new Ellipse2D.Double(x - diameter/2, y-diameter/2, diameter, diameter);

    type.resize(diameter, diameter);

    rotation = random(0, TWO_PI/3);
    r = (int)random(100, 255);
    g = (int)random(100, 255);
    b = (int)random(100, 255);
  }

  public void paint() {
    tint(r, g, b);

    translate(position.x, position.y);
    rotate(rotation);

    image(type, 0, 0);
    
    noStroke();
    fill(255,30);
    if (bounds.contains(mouseX, mouseY)) {
      ellipse(0, 0, diameter*0.85, diameter*0.85);
    }

    rotate(-rotation);
    translate(-position.x, -position.y);
    noTint();
  }

  public void onClick() {
  }
}