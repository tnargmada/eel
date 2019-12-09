class Text {
  private int screenMode;
  private final int[][] eel = {{0,0,1,1,1,1,0,1,1,1,1,0,1,0,0,0},
                               {0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0},
                               {0,0,1,1,1,0,0,1,1,1,0,0,1,0,0,0},
                               {0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0},
                               {0,0,1,1,1,1,0,1,1,1,1,0,1,1,1,0}};
  private final int[][] playPause = {{0,0,0,0,2,0,0,0,0,1,0,1,0,0,0},
                                     {0,0,0,0,1,2,0,0,0,1,0,1,0,0,0},
                                     {0,0,0,0,1,1,4,0,0,1,0,1,0,0,0},
                                     {0,0,0,0,1,3,0,0,0,1,0,1,0,0,0},
                                     {0,0,0,0,3,0,0,0,0,1,0,1,0,0,0}};
                                     
  private final int[][] one = {{1,1,0},
                               {0,1,0},
                               {0,1,0},
                               {0,1,0},
                               {1,1,1}};                                     
  private final int[][] two = {{1,1,1},
                               {0,0,1},
                               {1,1,1},
                               {1,0,0},
                               {1,1,1}};                                     
  private final int[][] three = {{1,1,1},
                                 {0,0,1},
                                 {1,1,1},
                                 {0,0,1},
                                 {1,1,1}};                                     
  private final int[][] four = {{1,0,1},
                                {1,0,1},
                                {1,1,1},
                                {0,0,1},
                                {0,0,1}};                                     
  private final int[][] five = {{1,1,1},
                                {1,0,0},
                                {1,1,1},
                                {0,0,1},
                                {1,1,1}};                                     
  private final int[][] six = {{1,1,1},
                               {1,0,0},
                               {1,1,1},
                               {1,0,1},
                               {1,1,1}};                                     
  private final int[][] seven = {{1,1,1},
                                 {0,0,1},
                                 {0,0,1},
                                 {0,0,1},
                                 {0,0,1}};                                     
  private final int[][] eight = {{1,1,1},
                                 {1,0,1},
                                 {1,1,1},
                                 {1,0,1},
                                 {1,1,1}};                                     
  private final int[][] nine = {{1,1,1},
                                {1,0,1},
                                {1,1,1},
                                {0,0,1},
                                {1,1,1}};                                     
  private final int[][] zero = {{1,1,1},
                                {1,0,1},
                                {1,0,1},
                                {1,0,1},
                                {1,1,1}};
                               
  public Text() {
    screenMode = 0;
  }
  
  void display(TwoDNum pos, boolean lost, int score) {
    if(lost) {
      int[][] ones = arrayForm(score%10);
      int[][] tens = arrayForm(int((score/10)) % 10);
      int[][] hundreds = arrayForm(int((score/100)) % 10);
      
      for(int i=0; i<3; i++) {
        for(int j=4; j>=0; j--) {
          for(int k=2; k>=0; k--) {
            TwoDNum blockPos = (new ThreeDNum(-k+2-4*(i+1), 0, -j)).convert2D().times(15).plus(pos);
            float x = blockPos.getX();
            float y = blockPos.getY();
						int[][] digit = ones;
            if(i==2)
              digit = ones;
            if(i==1)
              digit = tens;
            if(i==0)
              digit = hundreds;
            if(digit[j][k] == 1) {
              noStroke();
              fill(color(255,130,130));
              quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
              fill(color(180,130,100));
              quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2));
              fill(color(100,70,70));
              quad(x, y, x+(7.5*sqrt(6)),y-7.5*sqrt(2), x+(7.5*sqrt(6)),y+7.5*sqrt(2), x, y+15*sqrt(2));
            }
          }
        }
      }
    } else { 
      for(int i = eel.length-1; i>=0; i--) {
        for(int j = eel[0].length-1; j>=0; j--) {
          TwoDNum blockPos = (new ThreeDNum(-j, 0, -i)).convert2D().times(15).plus(pos);
          float x = blockPos.getX();
          float y = blockPos.getY();
          if(eel[i][j] == 1) {
            noStroke();
            fill(220);
            if(lost)
              fill(color(255,130,130));
            quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
            fill(180);
            if(lost)
              fill(color(180,130,100));
            quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2));
            fill(140);
            if(lost)
              fill(color(100,70,70));
            quad(x, y, x+(7.5*sqrt(6)),y-7.5*sqrt(2), x+(7.5*sqrt(6)),y+7.5*sqrt(2), x, y+15*sqrt(2));
          }
        }
      }
    }
    for(int i = playPause.length-1; i>=0; i--) {
      for(int j = 0; j<playPause[0].length; j++) {
        TwoDNum blockPos = (new ThreeDNum(0, j, -i)).convert2D().times(15).plus(pos).plus(new TwoDNum(286,-152));
        float x = blockPos.getX();
        float y = blockPos.getY();
        noStroke();
				if(playPause[i][j] == 1) {
	        fill(220);
	        if(lost)
	          fill(color(255,130,130));	
					quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y-7.5*sqrt(2));
    	    fill(180);
    	    if(lost)
    	      fill(color(180,130,100));
    	    quad(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2));
    	    fill(140);
    	    if(lost)
    	      fill(color(100,70,70));
    	    quad(x, y, x+(7.5*sqrt(6)),y-7.5*sqrt(2), x+(7.5*sqrt(6)),y+7.5*sqrt(2), x, y+15*sqrt(2));
				} else if(playPause[i][j] == 2) {
					fill(220);
	        if(lost)
	          fill(color(255,130,130));	
					quad(x, y+15*sqrt(2), x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(7.5*sqrt(6)),y+7.5*sqrt(2));
    	    fill(180);
    	    if(lost)
    	      fill(color(180,130,100));
    	    triangle(x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x,y+15*sqrt(2));
				} else if(playPause[i][j] == 3) {
					fill(180);
    	    if(lost)
    	      fill(color(180,130,100));
    	    triangle(x, y, x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2));
				} else if(playPause[i][j] == 4) {
					fill(220);
	        if(lost)
	          fill(color(255,130,130));	
					quad(x-3.75*sqrt(6), y+3.75*sqrt(2), x-(7.5*sqrt(6)),y-7.5*sqrt(2), x,y-15*sqrt(2), x+(3.75*sqrt(6)),y-3.75*sqrt(2));
    	    fill(180);
    	    if(lost)
    	      fill(color(180,130,100));
    	    triangle(x-(7.5*sqrt(6)),y-7.5*sqrt(2), x-(7.5*sqrt(6)),y+7.5*sqrt(2), x-3.75*sqrt(6), y+3.75*sqrt(2));
				}
			}
    }
  }
  
  boolean playClicked() {
    float x1 = 740;
    float y1 = 20;
    float x2 = 800;
    float y2 = 140;
    if(mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2) {
      return true;
    } else {
      return false;
    }
  }
  boolean pauseClicked() {
    float x1 = 820;
    float y1 = 100;
    float x2 = 940;
    float y2 = 240;
    if(mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2) {
      return true;
    } else {
      return false;
    }
  }
  
  int[][] arrayForm(int num) {
    if(num==0)
      return zero;
    if(num==1)
      return one;
    if(num==2)
      return two;
    if(num==3)
      return three;
    if(num==4)
      return four;
    if(num==5)
      return five;
    if(num==6)
      return six;
    if(num==7)
      return seven;
    if(num==8)
      return eight;
    if(num==9)
      return nine;
    return zero;
  }
}
