class Asteroid extends Floater {
  private double myRotationSpeed;
  private float asteroidRadius;

  Asteroid() {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color(169, 169, 169); // Dark gray

    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;
    myPointDirection = Math.random() * 360;
    myRotationSpeed = Math.random() * 2 - 1;

    asteroidRadius = 10 + (float)(Math.random() * 10); // Random size for asteroid

    for (int i = 0; i < corners; i++) {
      float angle = map(i, 0, corners, 0, TWO_PI);
      float radiusVariation = asteroidRadius + (float)(Math.random() * 15 - 7);

      xCorners[i] = (int)(cos(angle) * radiusVariation);
      yCorners[i] = (int)(sin(angle) * radiusVariation);
    }
  }

  void move() {
    super.move();
    turn((float)myRotationSpeed);
  }

  void show() {
    super.show();
  }

  float getSize() {
    return asteroidRadius;
  }
}
