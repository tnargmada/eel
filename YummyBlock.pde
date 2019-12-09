class YummyBlock extends Block {
  private ThreeDNum position;
  public YummyBlock(ThreeDNum pos) {
    position = pos;
  }
  ThreeDNum getPosition() {
    return position;
  }
  void setPosition(ThreeDNum pos) {
    position = pos;
  }
  int getType() {
    return 2;
  }
  void display(TwoDNum pos) {
    float x = pos.getX();
    float y = pos.getY();
    
    noStroke();
    fill(color(255,200,20));
    quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
    fill(color(255,80,80));
    quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2));
    fill(color(80,80,255));
    quad(x, y, x+(7.5*sqrt(6)),y-7.5*sqrt(2), x+(7.5*sqrt(6)),y+7.5*sqrt(2), x, y+15*sqrt(2));
  }
}