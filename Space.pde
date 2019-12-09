class Space {
  
  private Block[][][] blockGrid;
  private Snake snake;
  private YummyBlock fruit;
  
  public Space(int size, Snake s) {
    blockGrid = new Block[size][size][size];
    reset();
    snake = s;
    for(int i=0; i<snake.getLength(); i++) {
      ThreeDNum pos = snake.getBlock(i).getPosition();
      blockGrid[(int)pos.getX()][(int)pos.getY()][(int)pos.getZ()] = snake.getBlock(i);
    }
    fruit = new YummyBlock(snake.getBlock(0).getPosition().plus(snake.getDirection().times(5)));
    blockGrid[(int)fruit.getPosition().getX()][(int)fruit.getPosition().getY()][(int)fruit.getPosition().getZ()] = fruit;
  }
  
  public Block getBlock(ThreeDNum pos) {
    return blockGrid[(int)pos.getX()][(int)pos.getY()][(int)pos.getZ()];
  }
  public void setBlock(ThreeDNum pos, Block newBlock) {
    blockGrid[(int)pos.getX()][(int)pos.getY()][(int)pos.getZ()] = newBlock;
  }
  
  private void makeFruit() {
    ThreeDNum randPos = new ThreeDNum((int)(random(0,blockGrid.length)),(int)(random(0,blockGrid.length)),
                                      (int)(random(0,blockGrid.length)));
    for(int i=0; i<snake.getLength(); i++) {
      if(snake.getBlock(i).getPosition().equals(randPos)) {
        makeFruit();
        return;
      }
    }
    fruit = new YummyBlock(randPos);
  }
  
  void reset() {
    for(int i=0; i<blockGrid.length; i++) {
      for(int j=0; j<blockGrid.length; j++) {
        for(int k=0; k<blockGrid.length; k++) {
          blockGrid[i][j][k] = new EmptyBlock(new ThreeDNum(i, j, k));
        }
      }
    }
  }
  public boolean update() {
    if(!checkCollision() || !snake.checkCollision()) {
      return false;
    } else {
      reset();
      if(snake.getBlock(0).getPosition().equals(fruit.getPosition())) {
        makeFruit();
        snake.move(true);
      } else {
        snake.move(false);
      }
      
      blockGrid[(int)fruit.getPosition().getX()][(int)fruit.getPosition().getY()][(int)fruit.getPosition().getZ()] = fruit;
      for(int i=0; i<snake.getLength(); i++) {
        ThreeDNum pos = snake.getBlock(i).getPosition();
        blockGrid[(int)pos.getX()][(int)pos.getY()][(int)pos.getZ()] = snake.getBlock(i);
      }
      return true;
    }
  }
  
  public void display(TwoDNum pos) {
    //ground, shadow
    for(int i=0; i<blockGrid.length; i++) {
      for(int j=0; j<blockGrid.length; j++) {
        TwoDNum start = (new ThreeDNum(i,j,0)).convert2D().times(15).plus(pos);
        float x = start.getX();
        float y = start.getY()+15*sqrt(2);
        fill(#E3CD00, map(sqrt(i*i+j*j), 0,27, 50,250));
        noStroke();
        quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
        for(int k=0; k<snake.getLength(); k++) {
          if((snake.getBlock(k).getPosition().getX() == i && snake.getBlock(k).getPosition().getY() == j) ||
             (fruit.getPosition().getX() == i && fruit.getPosition().getY() == j)){
            fill(color(130,130,150));
            stroke(color(130,130,150));
            quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
          }
        }
      }
    }
    //ground thickness
    fill(color(225,221,157));
    stroke(color(225,221,157));
    quad(pos.getX()+blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2),
         pos.getX(),pos.getY()+blockGrid.length*15*sqrt(2), pos.getX(),pos.getY()+(blockGrid.length+1)*15*sqrt(2),
         pos.getX()+blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2)+15*sqrt(2));
    fill(color(240,236,172));
    stroke(color(240,236,172));
    quad(pos.getX()-blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2),
         pos.getX(),pos.getY()+blockGrid.length*15*sqrt(2), pos.getX(),pos.getY()+(blockGrid.length+1)*15*sqrt(2),
         pos.getX()-blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2)+15*sqrt(2));
    fill(color(222,218,154));
    stroke(color(222,218,154));
    quad(pos.getX()+blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2)+15*sqrt(2),
         pos.getX(),pos.getY()+(blockGrid.length+1)*15*sqrt(2), pos.getX(),pos.getY()+(blockGrid.length+2)*15*sqrt(2),
         pos.getX()+blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2)+30*sqrt(2));
    fill(color(237,233,169));
    stroke(color(237,233,169));
    quad(pos.getX()-blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2)+15*sqrt(2),
         pos.getX(),pos.getY()+(blockGrid.length+1)*15*sqrt(2), pos.getX(),pos.getY()+(blockGrid.length+2)*15*sqrt(2),
         pos.getX()-blockGrid.length*7.5*sqrt(6),pos.getY()+blockGrid.length*7.5*sqrt(2)+30*sqrt(2));
    //all blocks
    for(int i=0; i<blockGrid.length; i++) {
      for(int j=0; j<blockGrid.length; j++) {
        for(int k=0; k<blockGrid.length; k++) {
          blockGrid[i][j][k].display(blockGrid[i][j][k].getPosition().convert2D().times(15).plus(pos));
        }
      }
    }
    //top
    for(int i=0; i<blockGrid.length; i++) {
      for(int j=0; j<blockGrid.length; j++) {
        TwoDNum start = (new ThreeDNum(-i,-j,0)).convert2D().times(15).plus(pos);
        float x = start.getX();
        float y = start.getY()-15*sqrt(2);
        fill(color(105,188,242), 70);
        noStroke();
        quad(x, y, x+(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2));
      }
    }
    //left
    for(int i=0; i<blockGrid.length; i++) {
      for(int j=0; j<blockGrid.length; j++) {
        TwoDNum start = (new ThreeDNum(0,-i,-j)).convert2D().times(15).plus(pos);
        float x = start.getX()-7.5*sqrt(6);
        float y = start.getY()+7.5*sqrt(2);
        fill(color(105,188,242), map(j, 0,blockGrid.length, .5,1)*180);
        noStroke();
        quad(x, y, x+(7.5*sqrt(6)),y+7.5*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2));
      }
    }
    //right
    for(int i=0; i<blockGrid.length; i++) {
      for(int j=0; j<blockGrid.length; j++) {
        TwoDNum start = (new ThreeDNum(-i,0,-j)).convert2D().times(15).plus(pos);
        float x = start.getX()+7.5*sqrt(6);
        float y = start.getY()+7.5*sqrt(2);
        fill(color(105,188,242), map(j, 0,blockGrid.length, .5,1)*200);   //extra effect
        noStroke();
        quad(x, y, x-(7.5*sqrt(6)),y+7.5*sqrt(2), x-(7.5*sqrt(6)),y-7.5*sqrt(2), x, y-15*sqrt(2));
      }
    }
    ///*for extra effect
    fill(color(105,188,242), 10);
    noStroke();
    triangle(pos.getX(),pos.getY(), pos.getX(),pos.getY()-blockGrid.length*15*sqrt(2), 
             pos.getX()+blockGrid.length*7.5*sqrt(6),pos.getY()-blockGrid.length*7.5*sqrt(2));
    //*/
  }
  
  
  private boolean checkCollision() {
    ThreeDNum pos = snake.getBlock(0).getPosition().plus(snake.getDirection());
    if(pos.getX() >= blockGrid.length || pos.getX() < 0 || pos.getY() >= blockGrid.length || 
       pos.getY() < 0 || pos.getZ() >= blockGrid.length || pos.getZ() < 0) {
      return false;
    }
    return true;
  }
  
}