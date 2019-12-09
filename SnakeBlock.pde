class SnakeBlock extends Block {
  private ThreeDNum position;
  public SnakeBlock(ThreeDNum pos) {
    position = pos;
  }
  ThreeDNum getPosition() {
    return position;
  }
  void setPosition(ThreeDNum pos) {
    position = pos;
  }
  int getType() {
    return 1;
  }
  void display(TwoDNum pos) {
    float x = pos.getX();
    float y = pos.getY();
    
    noStroke();
    fill(color(130,255,130));
    quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x, y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
    fill(color(100,180,100));
    quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2));
    fill(color(70,100,70));
    quad(x, y, x+(7.5*sqrt(6)),y-7.5*sqrt(2), x+(7.5*sqrt(6)),y+7.5*sqrt(2), x, y+15*sqrt(2));
  }
}