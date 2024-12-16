class Floater {
  protected int corners;            // Number of corners, for polygons
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY;
  protected double myXspeed, myYspeed;
  protected double myPointDirection;

  // Accelerates the floater in the direction it is pointing
  void accelerate(double dAmount) {
    double dRadians = myPointDirection * (Math.PI / 180); // Convert degrees to radians
    myXspeed += (dAmount * Math.cos(dRadians));
    myYspeed += (dAmount * Math.sin(dRadians));
  }

  void turn(double degreesOfRotation) {
    myPointDirection += degreesOfRotation;
  }

  void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    // Wrap around screen
    if (myCenterX > width) myCenterX = 0;
    if (myCenterX < 0) myCenterX = width;
    if (myCenterY > height) myCenterY = 0;
    if (myCenterY < 0) myCenterY = height;
  }

  void show() {
    fill(myColor);
    stroke(myColor);
    pushMatrix();
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection * (Math.PI / 180));
    rotate(dRadians);
    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);
    popMatrix();
  }

  double getCenterX() {
    return myCenterX;
  }

  double getCenterY() {
    return myCenterY;
  }
}
