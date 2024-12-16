ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Spaceship spaceship;
Star[] stars;

void setup() {
  size(800, 800);
  spaceship = new Spaceship();

  // Create some asteroids
  for (int i = 0; i < 25; i++) {
    asteroids.add(new Asteroid());
  }

  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0); // Black background

  // Show stars
  for (Star star : stars) {
    star.show();
  }

  // Show spaceship and move it
  spaceship.show();
  spaceship.move();

  // Show asteroids and move them
  for (Asteroid a : asteroids) {
    a.show();
    a.move();
  }

  // Show and move bullets
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.show();
    b.move();
    if (!b.isAlive()) {
      bullets.remove(i);  // Remove the bullet if it's not alive anymore
    }
  }

  // **Collision check**: Bullet hit asteroid
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      float d = dist((float)a.getCenterX(), (float)a.getCenterY(), (float)b.getCenterX(), (float)b.getCenterY());
      if (d < a.getSize() / 2 + 4) { // Bullet hits asteroid
        asteroids.remove(i);
        bullets.remove(j);
        break; // Exit the bullet loop early to avoid errors
      }
    }
  }

  // **Collision check**: Spaceship hit asteroid
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    float d = dist((float)spaceship.getCenterX(), (float)spaceship.getCenterY(), (float)a.getCenterX(), (float)a.getCenterY());
    
    if (d < a.getSize() / 2 + 10) { // Spaceship hits asteroid
      asteroids.remove(i); // Remove asteroid on collision
      break;  // Exit the loop to avoid modifying the list while iterating
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      spaceship.turn(-15); 
    } else if (keyCode == RIGHT) {
      spaceship.turn(15); 
    } else if (keyCode == UP) {
      spaceship.accelerate(1); 
    } else if (keyCode == DOWN) {
      spaceship.decelerate(1); 
    }
  } else if (key == 'h' || key == 'H') {
    spaceship.hyperspace(); 
  } else if (key == ' ') {
    bullets.add(new Bullet(spaceship)); // Shoot a bullet
  }
}
