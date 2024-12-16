class Spaceship extends Floater {
  Spaceship() {
    corners = 3;
    xCorners = new int[] {-10, 20, -10};
    yCorners = new int[] {-10, 0, 10};
    myColor = color(255, 255, 255); // White color for spaceship

    myCenterX = width / 2;
    myCenterY = height / 2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random() * 360;
  }

  void decelerate(double dAmount) {
    if (myXspeed > 0) myXspeed -= dAmount;
    else if (myXspeed < 0) myXspeed += dAmount;

    if (myYspeed > 0) myYspeed -= dAmount;
    else if (myYspeed < 0) myYspeed += dAmount;
  }
}
