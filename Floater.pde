// Floater.pde

class Floater {
  protected int corners;            // Number of corners, for polygons (triangular floater has 3)
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; // Holds center coordinates   
  protected double myXspeed, myYspeed;   // Holds the speed of travel in x and y directions   
  protected double myPointDirection;     // Holds current direction the ship is pointing in degrees    

  // Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate(double dAmount) {          
    double dRadians = myPointDirection * (Math.PI / 180); // Convert degrees to radians
    myXspeed += (dAmount * Math.cos(dRadians));    
    myYspeed += (dAmount * Math.sin(dRadians));       
  }

  public void turn(double degreesOfRotation) {     
    myPointDirection += degreesOfRotation;   
  }

  public void move() {
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    // Wrap around screen
    if (myCenterX > width) {
      myCenterX = 0;
    } else if (myCenterX < 0) {
      myCenterX = width;
    }
    if (myCenterY > height) {
      myCenterY = 0;
    } else if (myCenterY < 0) {
      myCenterY = height;
    }   
  }

  public void show() {
    fill(myColor);
    stroke(myColor);

    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection * (Math.PI / 180));
    rotate(dRadians);

    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);

    rotate(-dRadians);
    translate(-1 * (float)myCenterX, -1 * (float)myCenterY);
  }

  // Getter methods to access center position (added here in Floater)
  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}
