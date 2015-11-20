PImage universe, logoLarge, logoSmall;
private Scene scene;
ArrayList<Star> stars = new ArrayList<Star>();

PImage planetType1, planetType2;

void setup() {
  fullScreen();
  
  imageMode(CENTER);
      
  universe = loadImage("universe.jpg");
  logoLarge = loadImage("logo/logo_large_transparent.png");
  logoSmall = loadImage("logo/logo_small_transparent.png");

  planetType1 = loadImage("planets/red.png");
  planetType2 = loadImage("planets/green-planet.png");

  float scale = 0.6;
  logoSmall.resize((int)(logoSmall.width * scale), (int)(logoSmall.height * scale));

  universe.resize(width, height);

  // Menu is the start scene.
  setScene(new Menu(), true);
  //setScene(new Universe("Test"), true);
}

void draw() {
  drawBackground();
  scene.paint();
}

void drawBackground() {
  background(0);
  noStroke();

  for (Star star : stars) {
    fill(random(180, 255));
    ellipse(star.x, star.y, star.diameter, star.diameter);
  }
}

void mouseReleased() {
  scene.onClick();
}

void keyPressed(KeyEvent event) {
  scene.onKeyPressed(event);
}

// Navigation
void setScene(Scene scene, boolean refreshStars) {
  if (refreshStars) {
    stars = new ArrayList<Star>();
    for (int i=0; i < 500; i++) {
      stars.add(new Star(random(width), random(height)));
    }
  }

  this.scene = scene;
}

void menuLogo() {
  image(logoLarge, logoLarge.width/2, logoLarge.height/2);
}

void gameLogo() {
  image(logoSmall, logoSmall.width/2, logoSmall.height/2);
}