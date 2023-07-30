class Paddle {
   float paddleX;
   float paddleY; 
   color paddleC;
   int paddleWidth = 200;
   int paddleHeight = 25;
   
    Paddle(float paddleX, float paddleY, color paddleC) {
    this.paddleX = paddleX;
    this.paddleY = paddleY;
    this.paddleC = paddleC;
  }
  
  
  void drawPaddle() {
    push();
    fill(this.paddleC);
    strokeWeight(3);
    stroke(215, 38, 61);
    rectMode(CENTER);
    rect(this.paddleX, this.paddleY, paddleWidth, paddleHeight);
    pop();
  }
}
