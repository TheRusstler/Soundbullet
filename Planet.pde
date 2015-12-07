/*
 * A planet in the universe.
 */
class Planet extends Scene {

  int index;
  PImage type;
  float rotation;
  PVector position;
  int diameter;
  int r, g, b;
  Song song;
  String description;

  Ellipse2D bounds;

  public Planet(int x, int y, String description, int index) {
    this.position =  new PVector(x, y);
    this.song = music.get(index);
    this.description = description;
    this.index = index;

    if (random(0, 1) > 0.5) {
      type = planetType1.copy();
    } else {
      type = planetType2.copy();
    }

    diameter = (int)random(100, 200);
    bounds = new Ellipse2D.Double(x - diameter/2, y-diameter/2, diameter, diameter);

    type.resize(diameter, diameter);

    rotation = random(0, TWO_PI/3);
    r = (int)random(100, 255);
    g = (int)random(100, 255);
    b = (int)random(100, 255);
  }

  public void paint() {
    imageMode(CENTER);
    rectMode(CORNER);

    tint(r, g, b);

    translate(position.x, position.y);
    rotate(rotation);

    image(type, 0, 0);

    noStroke();

    if (bounds.contains(mouseX, mouseY)) {
      fill(255, 30);
      ellipseMode(CENTER);
      ellipse(0, 0, diameter*0.85, diameter*0.85);
    }

    // Home planet = blue ring
    if (index == 0) {
      stroke(0, 0, 150);
      strokeWeight(2);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, diameter*0.9, diameter*0.9);
    }

    // Conquered planet = green ring.
    else if (index == 0 || game.planetsConquered[index-1]) {
      stroke(0, 150, 0);
      strokeWeight(2);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, diameter*0.9, diameter*0.9);
    }

    rotate(-rotation);
    translate(-position.x, -position.y);
    noTint();
  }

  final int PLANET_WINDOW_WIDTH = 200, PLANET_WINDOW_HEIGHT = 150, PLANET_WINDOW_PADDING = 15;

  /*
   * Info window which appears on hover of a planet
   */
  void mouseOverWindow() {
    stroke(102, 0, 204);
    strokeWeight(2);
    fill(102, 0, 204, 80);

    rect(mouseX, mouseY, PLANET_WINDOW_WIDTH, PLANET_WINDOW_HEIGHT, 5);

    textSize(12);
    textAlign(LEFT, TOP);
    fill(255);
    text(song.name.substring(0, song.name.length() - 4) + "\n\n" + description, 
      mouseX + PLANET_WINDOW_PADDING, 
      mouseY + PLANET_WINDOW_PADDING, 
      PLANET_WINDOW_WIDTH - PLANET_WINDOW_PADDING * 2, 
      PLANET_WINDOW_HEIGHT - PLANET_WINDOW_PADDING * 2);

    textAlign(CENTER, CENTER);
    text("CLICK TO TRAVEL!", 
      mouseX + (PLANET_WINDOW_WIDTH + PLANET_WINDOW_PADDING)/2, 
      mouseY + PLANET_WINDOW_HEIGHT - PLANET_WINDOW_PADDING - 5);
  }

  /*
   * Navigate to a planet on click
   */
  public void onClick() {
    if (bounds.contains(mouseX, mouseY)) {
      if (song.name == HOME_PLANET) {
        setScene(new HomePlanet(this), false);
      } else {
        setScene(new PlanetMode(this), false);
      }
    }
  }
}