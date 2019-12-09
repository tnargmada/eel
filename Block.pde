abstract class Block {
  private ThreeDNum position;
  private int type;
  abstract ThreeDNum getPosition();
  abstract void setPosition(ThreeDNum pos);
  abstract int getType();
  abstract void display(TwoDNum pos);
}
