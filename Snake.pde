class Snake {
  
  private ArrayList<SnakeBlock> snakeBlocks;
  private ThreeDNum direction;
  private int snakeLength;
  
  public Snake(ThreeDNum pos) {
    snakeBlocks = new ArrayList<SnakeBlock>();
    for(int i=0; i<4; i++)
      snakeBlocks.add(new SnakeBlock(pos.plus(new ThreeDNum(0, -i, 0))));
    snakeLength = snakeBlocks.size();
    direction = new ThreeDNum(0,1,0);
  }
  
  int getLength() {
    return snakeLength;
  }
  SnakeBlock getBlock(int i) {
    return snakeBlocks.get(i);
  }
  void setDirection(ThreeDNum d) {
    if(!d.equals(direction.times(-1)))
      direction = d;
  }
  ThreeDNum getDirection() {
    return direction;
  }
  
  void move(boolean didGrow) {
    snakeBlocks.add(0, new SnakeBlock(snakeBlocks.get(0).getPosition().plus(direction)));
    if(!didGrow) {
      snakeBlocks.remove(snakeBlocks.size()-1);
    }
    snakeLength = snakeBlocks.size();
  }
  
  boolean checkCollision() {
    for(int i=1; i<snakeLength; i++) {
      if(snakeBlocks.get(i).getPosition().equals(snakeBlocks.get(0).getPosition().plus(direction))) {
        return false;
      }
    }
    return true;
  }
  
}