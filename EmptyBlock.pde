class EmptyBlock extends Block {
  private ThreeDNum position;
  public EmptyBlock(ThreeDNum pos) {
    position = pos;
  }
  ThreeDNum getPosition() {
    return position;
  }
  void setPosition(ThreeDNum pos) {
    position = pos;
  }
  int getType() {
    return 0;
  }
  void display(TwoDNum pos) {
    return;
    /*fill(color(200,200,200));
    stroke(color(200,200,200));
    ellipse(pos.getX(),pos.getY(), 8,8);*/
  }
}