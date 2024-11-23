Spaceship spaceship;
Star[] stars;

void setup() {
  size(800, 800);
  spaceship = new Spaceship();
  stars = new Star[100]; // Create 100 stars
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0); // Black background

  for (Star star : stars) {
    star.show();
  }

  spaceship.show();
  spaceship.move();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      spaceship.turn(-5); 
    } else if (keyCode == RIGHT) {
      spaceship.turn(5);
    } else if (keyCode == UP) {
      spaceship.accelerate(0.1); 
    }
  } else if (key == 'h' || key == 'H') {
    spaceship.hyperspace();
  }
}
