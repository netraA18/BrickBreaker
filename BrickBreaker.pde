ArrayList<Brick> bricks;
Paddle myPaddle;
PVector vel, pos;
int d = 25;
int lives = 3;
int red = 204;
int green = 201;
int blue = 231;
//Heart[] hearts = new Heart[4];


void setup() {
  size(900, 600);
  bricks = new ArrayList();
  myPaddle = new Paddle(mouseX, height * .9, color(13, 24, 210)); 
  vel = new PVector(4, -5);
  pos = new PVector(50, 450);



  for (int y = 0; y < height * 0.5; y += Brick.BRICK_HEIGHT) {
    for (int x = 0; x < width; x += Brick.BRICK_WIDTH) {
      color c;
      if (y / Brick.BRICK_HEIGHT % 2 == 0) {
        c = color(105, 220, 158);
      } else {
        c = color(222, 54, 157);
      }
      Brick brick = new Brick(x, y, c);
      bricks.add(brick);
    }
  }

  //for (int j = 0; j < hearts.length; j++) {
  //  hearts[j] = new Heart(j  + 100, height * .75, j + 25, j + 50, j + 100, height * .75);
  //}
}



void draw() {
  //background(200, 240, 255);
  background(red, green, blue);
  textSize(45);
  fill(0, 0, 0);
  //background(red, green, blue);
  text(lives + " lives left", 600, 580);

  if (pos.y > height) {
    lives--;
    red = red - 60;
    green = green - 100;
    blue = blue - 50;
    //background(red, green, blue);
    if (lives > 0) {
      pos = new PVector(random(900), random(450, 550));
      vel.y *= -1;
    } else {
      exit();
    }
  }


  for (int i = 0; i < bricks.size(); i++) {
    Brick brick = bricks.get(i);
    brick.drawBrick();
  }
  myPaddle = new Paddle(mouseX + myPaddle.paddleWidth/2, height * .9, color(57, 229, 249));

  myPaddle.drawPaddle();

  strokeWeight(2);
  stroke(76, 33, 42);

  fill(237, 238, 69);

  circle(pos.x, pos.y, d);
  pos.add(vel);

  brickCollision();
  paddleCollision();

  if (pos.y + d <= d) {
    vel.y *= -1;
  }
  if (pos.x + d >= width || pos.x - d <= 0) {
    vel.x *= -1;
  }
  
}



void brickCollision() {
  for (int i = 0; i < bricks.size(); i++) {
    Brick b = bricks.get(i);
    if (pos.x > b.x && pos.x < b.x + Brick.BRICK_WIDTH && pos.y - d/2 > b.y && pos.y - d/2 < b.y + Brick.BRICK_HEIGHT) {
      bricks.remove(i);
      vel.y *= -1;
      break;
    }
  }
}

void paddleCollision() {
  if ((myPaddle.paddleX - myPaddle.paddleWidth/2 <= pos.x && pos.x <= myPaddle.paddleX + myPaddle.paddleWidth/2) && pos.y + 12.5 >= myPaddle.paddleY - myPaddle.paddleHeight/2) {
    vel.y *= -1;
  }
}


void mouseMoved() {
  if (mouseX < 0) {
    mouseX = 0;
  } else if (mouseX + myPaddle.paddleWidth >= width) {
    mouseX = width -  myPaddle.paddleWidth;
  }
}
