
Spaceship spaceship;
Star[] stars;

ArrayList<Asteroid> asteroids;

void setup() {
  size(800, 800);

  spaceship = new Spaceship();
  
  stars = new Star[100];
  
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  
  asteroids = new ArrayList<Asteroid>();
  
  
  for (int i = 0; i < 40; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);


  for (Star star : stars) {
    star.show();
  }

  // Display and move the spaceship
  spaceship.show();
  spaceship.move();


  for (Asteroid asteroid : asteroids) {
    asteroid.show();
    asteroid.move();
  }

  
  checkCollisions();
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
  }
}


void checkCollisions() {
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid asteroid = asteroids.get(i);

    
    float distance = dist((float)spaceship.myCenterX, (float)spaceship.myCenterY, (float)asteroid.getCenterX(), (float)asteroid.getCenterY());

  
    float spaceshipRadius = 15;  
    float asteroidRadius = 20;  
    
    if (distance < spaceshipRadius + asteroidRadius) {
      asteroids.remove(i);  
    }
  }
}
