class ThreeDNum {
  private float x, y, z;
  public ThreeDNum(float x1, float y1, float z1) {
    x = x1;
    y = y1;
    z = z1;
  }
  
  boolean equals(ThreeDNum other) {
    return (x==other.getX() && y==other.getY() && z==other.getZ());
  }
  ThreeDNum plus(ThreeDNum other) {
    return new ThreeDNum(x + other.getX(), y + other.getY(), z + other.getZ());
  }
  ThreeDNum times(int other) {
    return new ThreeDNum(x * other, y * other, z*other);
  }
  
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getZ() {
    return z;
  }
  
  void setX(int x1) {
    x = x1;
  }
  void setY(int y1) {
    y = y1;
  }
  void setZ(int z1) {
    z = z1;
  }
  void setNum(float x1, float y1, float z1) {
    x = x1;
    y = y1;
    z = z1;
  }
  
  TwoDNum convert2D() {
    TwoDNum num = new TwoDNum(y*sqrt(2)*sqrt(3)*.5 - x*sqrt(2)*sqrt(3)*.5,
                      -1*(z*sqrt(2)-x*sqrt(2)*.5-y*sqrt(2)*.5));
    return num;
  }
}