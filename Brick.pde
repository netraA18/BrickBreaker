class Brick {
  float x;
  float y;
  color c;

 final static int BRICK_WIDTH = 100;
 final static int BRICK_HEIGHT = 40;
 //int paddleWidth = 200;
 //int paddleHeight = 25;


  Brick(float x, float y) {
    this(x, y, color(130, 50, 127));
  }

  Brick(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  Brick(color c) {
    this.c = c;
  }

  void drawBrick() {
    //push();
    //rectMode(CENTER);
    strokeWeight(1);
    stroke(110, 13, 37);
    fill(this.c);
    rect(this.x, this.y, BRICK_WIDTH, BRICK_HEIGHT);
    
   
    //line(this.x, this.y, this.x + BRICK_WIDTH, y - BRICK_HEIGHT);
    //pop();
  }
  
  
  void changeColor() {
    this.c = color(red(this.c), green(this.c), blue(this.c), 100);
  }
  
}
