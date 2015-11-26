class Planet extends Scene {

  PImage type;
  float rotation;
  PVector position;
  int diameter;
  int r, g, b;
  SoundFile song;
  String name, description;

  Ellipse2D bounds;

  public Planet(int x, int y, String name, SoundFile song, String description) {
    this.position =  new PVector(x, y);
    this.name = name;
    this.song = song;
    this.description = description;

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
    tint(r, g, b);

    translate(position.x, position.y);
    rotate(rotation);

    image(type, 0, 0);
    
    noStroke();

    if (bounds.contains(mouseX, mouseY)) {
      fill(255,30);
      ellipse(0, 0, diameter*0.85, diameter*0.85);
    }

    rotate(-rotation);
    translate(-position.x, -position.y);
    noTint();
  }
  
  final int PLANET_WINDOW_WIDTH = 200, PLANET_WINDOW_HEIGHT = 150, PLANET_WINDOW_PADDING = 15;
  
  private void mouseOverWindow() {
    stroke(0, 53, 204);
    strokeWeight(2);
    fill(0, 20, 77, 150);
    rect(mouseX, mouseY, PLANET_WINDOW_WIDTH, PLANET_WINDOW_HEIGHT, 5);
    
    textSize(12);
    textAlign(LEFT, TOP);
    fill(255);
    text(name + "\n\n" + description, 
      mouseX + PLANET_WINDOW_PADDING,
      mouseY + PLANET_WINDOW_PADDING, 
      PLANET_WINDOW_WIDTH - PLANET_WINDOW_PADDING * 2,
      PLANET_WINDOW_HEIGHT - PLANET_WINDOW_PADDING * 2);
      
      textAlign(CENTER, CENTER);
      text("CLICK TO TRAVEL!", 
        mouseX + (PLANET_WINDOW_WIDTH + PLANET_WINDOW_PADDING)/2, 
        mouseY + PLANET_WINDOW_HEIGHT - PLANET_WINDOW_PADDING - 5);
  }

  public void onClick() {
    if (bounds.contains(mouseX, mouseY)) {
      setScene(new PlanetMode(this), false);
    } 
  }
}