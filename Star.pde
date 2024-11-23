class Star {
  private float x, y;
  private int brightness;
  
  Star() {
    x = (float)(Math.random() * width);
    y = (float)(Math.random() * height);
    brightness = (int)(Math.random() * 255);
  }

  void show() {
    stroke(brightness);
    point(x, y);
  }
}
