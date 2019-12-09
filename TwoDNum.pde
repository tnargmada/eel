class TwoDNum {
  private float x, y;
  public TwoDNum(float x1, float y1) {
    x = x1;
    y = y1;
  }
  
  boolean equals(TwoDNum other) {
    return (x==other.getX() && y==other.getY());
  }
  TwoDNum plus(TwoDNum other) {
    return new TwoDNum(x + other.getX(), y + other.getY());
  }
  TwoDNum times(int other) {
    return new TwoDNum(x * other, y * other);
  }
  
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  
  void setX(int x1) {
    x = x1;
  }
  void setY(int y1) {
    y = y1;
  }
  void setNum(float x1, float y1) {
    x = x1;
    y = y1;
  }
}
