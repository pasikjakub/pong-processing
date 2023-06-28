int paddleWidth = 10;
int paddleHeight = 80;
int paddleSpeed = 5;
int paddle1X, paddle1Y, paddle2X, paddle2Y;
int ballSize = 20;
float ballX, ballY;
float ballSpeedX = 3;
float ballSpeedY = 3;
int score1;
int score2;

void setup() {
  size(800, 400);
  resetGame();
  score1 = 0;
  score2 = 0;
}

void draw() {
  
  background(0);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(255);
  text(score1, width / 4, 50);
  text(score2, 3 * width / 4, 50);
  
  if (keyPressed) {
    if (keyCode == UP && paddle2Y - paddleHeight/2 >= 0) {
      paddle2Y -= paddleSpeed;
    } else if (keyCode == DOWN && paddle2Y + paddleHeight/2 <= height) {
      paddle2Y += paddleSpeed;
    }
    
    if ((key == 'w' || key == 'W') && paddle1Y - paddleHeight/2 >= 0) {
      paddle1Y -= paddleSpeed;
    } else if ((key == 's' || key == 'S') && paddle1Y + paddleHeight/2 <= height) {
      paddle1Y += paddleSpeed;
    }
  }
  
  rectMode(CENTER);
  fill(255);
  rect(paddle1X, paddle1Y, paddleWidth, paddleHeight);
  rect(paddle2X, paddle2Y, paddleWidth, paddleHeight);
  
  ballX += ballSpeedX;
  ballY += ballSpeedY;
  
  if (ballY - ballSize/2 <= paddle1Y + paddleHeight/2 && ballY + ballSize/2 >= paddle1Y - paddleHeight/2 && ballX - ballSize/2 <= paddle1X + paddleWidth/2) {
    ballSpeedX *= -1;
  }
  
  if (ballY - ballSize/2 <= paddle2Y + paddleHeight/2 && ballY + ballSize/2 >= paddle2Y - paddleHeight/2 && ballX + ballSize/2 >= paddle2X - paddleWidth/2) {
    ballSpeedX *= -1;
  }
  

  if (ballY - ballSize/2 <= 0 || ballY + ballSize/2 >= height) {
    ballSpeedY *= -1;
  }

  ellipseMode(CENTER);
  ellipse(ballX, ballY, ballSize, ballSize);

if (ballX - ballSize/2 > width) {
    score1++;
    resetGame();
    
  } else if (ballX + ballSize/2 < 0) {
    score2++;
    resetGame();
   
  }
}
  
  
void resetGame() {
  paddle1X = paddleWidth/2;
  paddle1Y = height/2;
  paddle2X = width - paddleWidth/2;
  paddle2Y = height/2;
  ballX = width/2;
  ballY = height/2;
  ballSpeedX *= random(1) > 0.5 ? 1 : -1;
  ballSpeedY *= random(1) > 0.5 ? 1 : -1;
}
