class Asteroid extends Floater {
  private double myRotationSpeed;
  private float asteroidRadius;

  public Asteroid() {
    corners = 12; 
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color(169, 169, 169); 
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height; 
    myXspeed = Math.random() * 2 - 1;  
    myYspeed = Math.random() * 2 - 1;  
    myPointDirection = Math.random() * 360; 
    myRotationSpeed = Math.random() * 2 - 1;  
    
    // Set the asteroid's radius
    asteroidRadius = 10 + (float)(Math.random() * 10); 

    
    for (int i = 0; i < corners; i++) {
      float angle = map(i, 0, corners, 0, TWO_PI); 
      float radiusVariation = asteroidRadius + (float)(Math.random() * 15 - 7);
      xCorners[i] = (int)(Math.cos(angle) * radiusVariation);
      yCorners[i] = (int)(Math.sin(angle) * radiusVariation);
    }
  }


  public void move() {
    super.move(); 
    turn(myRotationSpeed); 
  }

  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }

  public void show() {
    super.show(); 
  }
}
