class Spaceship extends Floater {

  Spaceship() {
  
    corners = 3; // Shape of spaceship (triangular)
    xCorners = new int[] {-10, 20, -10}; 
    yCorners = new int[] {-10, 0, 10};  
    myColor = color(255, 255, 255); 
    myCenterX = width / 2;
    myCenterY = height / 2;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0; // Facing right
  }

  void hyperspace() {
    myCenterX = (float)(Math.random() * width);
    myCenterY = (float)(Math.random() * height);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = (float)(Math.random() * 360);
  }
}
