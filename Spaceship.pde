// Spaceship.pde

class Spaceship extends Floater {

  public Spaceship() {
    corners = 3;
    xCorners = new int[] { -10, 20, -10 };
    yCorners = new int[] { -10, 0, 10 };
    myColor = color(255, 255, 255); // White color for spaceship

    myCenterX = width / 2.0; 
    myCenterY = height / 2.0; 
    myXspeed = 0; 
    myYspeed = 0;
    myPointDirection = 0; 
  }

  public void hyperspace() {
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = Math.random() * 360;
  }

  public void decelerate(double dAmount) {
    if (myXspeed > 0) {
      myXspeed -= dAmount; 
    } else if (myXspeed < 0) {
      myXspeed += dAmount;
    }
    if (myYspeed > 0) {
      myYspeed -= dAmount; 
    } else if (myYspeed < 0) {
      myYspeed += dAmount; 
    }
  }

  // Getter methods for collision detection
  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}
