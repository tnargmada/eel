Space gameSpace;
Snake snake;
Text text;
int frame;
boolean lost, paused;
ThreeDNum direction;

void setup() {
  size(1400, 800);
  text = new Text();
  snake = new Snake(new ThreeDNum(7, 5, 7));
  direction = snake.getDirection();
  gameSpace = new Space(15, snake);
  frame = 0;
  paused = true;
  frameRate(18);
}

void draw() {
  background(255);
  if(lost) {
    if(mousePressed && text.playClicked()) {
      snake = new Snake(new ThreeDNum(7, 5, 7));
      direction = snake.getDirection();
      gameSpace = new Space(15, snake);
      frame = 0;
      lost = false;
      paused = true;
    }
  } else if(paused) {
    if(mousePressed && text.playClicked()) {
      paused = false;
    }
  } else {
    if(mousePressed && text.pauseClicked()) {
      paused = true;
    }
    if (keyPressed) {
      if (key == 'w' || key =='W') 
        direction = new ThreeDNum(0, 0, 1);
      if (key == 's' || key =='S') 
        direction = new ThreeDNum(0, 0, -1);
      if (key == 'a' || key =='A') 
        direction = new ThreeDNum(1, 0, 0);
      if (key == 'e' || key =='E') 
        direction = new ThreeDNum(-1, 0, 0);
      if (key == 'q' || key =='Q') 
        direction = new ThreeDNum(0, -1, 0);
      if (key == 'd' || key =='D') 
        direction = new ThreeDNum(0, 1, 0);
    }
    if (frame%3 == 0) {
      frame = 0;
      snake.setDirection(direction);
      if (!gameSpace.update()) {
        lost = true;
      }
    }
    frame++;
  }
  gameSpace.display(new TwoDNum(width/2, height/2+15));
  text.display(new TwoDNum(425, 171), lost, snake.getLength());
  //text.display(new TwoDNum(25, 171), lost, snake.getLength());
}
