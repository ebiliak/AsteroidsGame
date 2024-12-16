class Bullet extends Floater {
  private static final float BULLET_SPEED = 6.0f;
  private static final float BULLET_SIZE = 4;
  private int lifespan;

  Bullet(Spaceship theShip) {
    corners = 20;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color(255, 0, 0); // Red bullet

    myCenterX = theShip.myCenterX;
    myCenterY = theShip.myCenterY;
    myPointDirection = theShip.myPointDirection;

    float rad = radians((float)myPointDirection);
    myXspeed = (float)theShip.myXspeed + BULLET_SPEED * cos(rad);
    myYspeed = (float)theShip.myYspeed + BULLET_SPEED * sin(rad);

    lifespan = 300; // ~1 second at 60 FPS
  }

  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)myCenterX, (float)myCenterY, BULLET_SIZE, BULLET_SIZE);
  }

  void move() {
    super.move();
    lifespan--;
  }

  boolean isAlive() {
    return (lifespan > 0);
  }
}
