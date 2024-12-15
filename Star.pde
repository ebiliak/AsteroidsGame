// Star.pde

class Star {
  private double x, y;
  private int starColor;

  public Star() {
    x = Math.random() * width; 
    y = Math.random() * height;
    starColor = color(255, 255, 255); // White stars
  }

  public void show() {
    fill(starColor);
    noStroke();
    ellipse((float)x, (float)y, 2, 2);
  }
}
