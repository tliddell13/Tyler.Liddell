//Player
float MikeStartX;
float MikeStartY;
//obstacles
float obstacle1X;
float obstacle1Y;
float obstacle2X;
float obstacle2Y;
float obstacle3X;
float obstacle3Y;
//obstacle movement
float vx1;
float vx2;
float vx3;

String StartGame;

boolean start;

float floor;

float yspeed = 1.5;
float xspeed = 3;
boolean Left = false;
boolean Right = false;

color skyColor = color(255);
color ground = color(150);


void setup() 
{
  size(800,800);
  MikeStartX = 200;
  MikeStartY = height/2;
  
  StartGame = "Press enter to begin game. Use the arrow keys to avoid the incoming bricks.";
  start = false;
  //high
  obstacle1X = width;
  obstacle1Y = height/2;
  //ground
  obstacle2X = width/2;
  obstacle2Y = height/2 + 50;
  //middle
  obstacle3X = 0;
  obstacle3Y = height/2 + 20;
  
  vx1 = -1;
  vx2 = -1;
  vx3 = 1;
  
  floor = 400;
}
void draw()
{
  menuScreen(); 
  if (start) {
    StartGame();
  }
}
void StartGame() {
  background(skyColor);
  fill(ground);
  rectMode(CORNER);
  rect(0, height/2 + 80,width,height/2 + 80);
  
  Mike();
  MoveMike();
  
  displayObstacle1();
  displayObstacle2();
  displayObstacle3();
  
  collision();
  
  if(collision()) {
    start = false;
  }
  
  
    
  }
void Mike()
  {
    fill(120);
    rect(MikeStartX + 10, MikeStartY + 40, 40, 40);
}
void MoveMike() {
  if (Left) {
    MikeStartX -= xspeed;
    if (MikeStartX < 15) {
      MikeStartX = 15;
    }
  }
  if (Right) {
    MikeStartX += xspeed;
    if (MikeStartX > width - 30) {
      MikeStartX = width - 30;
    }
  }
  if (MikeStartY <= floor) {
    MikeStartY += yspeed;
  }
}

void setMove (boolean setTo) { 
  if (keyCode == LEFT) { 
    Left = setTo;
  } 
  if (keyCode == RIGHT) { 
    Right = setTo;
  }
}

void displayObstacle1() {
  fill(0);
  rect(obstacle1X, obstacle1Y, 30, 30);
  moveObstacle1();
}

void displayObstacle2() {
  fill(0);
  rect(obstacle2X, obstacle2Y, 30, 30);
  moveObstacle2();
}

void displayObstacle3() {
  fill(0);
  rect(obstacle3X, obstacle3Y, 30, 30);
  moveObstacle3();
}

void moveObstacle1() {
  obstacle1X = obstacle1X + vx1;
  if (obstacle1X < 1) {
    vx1 = -vx1;
    
  }
  if (obstacle1X > width - 1) {
    vx1 = -vx1;
  }
}

void moveObstacle2() {
  obstacle2X = obstacle2X + vx2;
  if (obstacle2X < 1) {
    vx2 = -vx2;
  }
  if (obstacle2X > width - 1) {
    vx2 = -vx2;
  }
}


void moveObstacle3() {
  obstacle3X = obstacle3X + vx3;
  if (obstacle3X < 1) {
    vx3 = -vx3;
  }
  if (obstacle3X > width - 1) {
    vx3 = -vx3;
  }
}

void menuScreen() {
  background(0);
  textSize(80);
  textAlign(CENTER);
  text("START GAME",height/2,width/2);
  textSize(20);
  text(StartGame,width/2, height/2 + 30);
  
}

boolean collision() {
  boolean HitObstacle1x = (MikeStartX + 30 > obstacle1X - 15 && MikeStartX - 10 < obstacle1X + 15);
  boolean HitObstacle1y = (MikeStartY + 60 > obstacle1Y - 15 && MikeStartY + 20 < obstacle1Y + 15);
  
  boolean HitObstacle2x = (MikeStartX + 30 > obstacle2X - 15 && MikeStartX - 10 < obstacle2X + 15);
  boolean HitObstacle2y = (MikeStartY + 60 > obstacle2Y - 15 && MikeStartY + 20 < obstacle2Y + 15);
  
  boolean HitObstacle3x = (MikeStartX + 30 > obstacle3X - 15 && MikeStartX - 10 < obstacle3X + 15);
  boolean HitObstacle3y = (MikeStartY + 60 > obstacle3Y - 15 && MikeStartY + 20 < obstacle3Y + 15);
  
  if(HitObstacle1x && HitObstacle1y) {
    start = false;
    return true;
  }
  else if(HitObstacle2x && HitObstacle2y) {
    start = false;
    return true;
  }
  else if(HitObstacle3x && HitObstacle3y) {
    start = false;
    return true;
  }
  else {
    return false;
  }
}

void keyPressed() {
  setMove(true);
}

void keyReleased() {
  setMove(false);
  if (keyCode == UP) {
    if(MikeStartY < floor) {
    }
    else {
    MikeStartY -= 100;
    }
  }
  if (keyCode == ENTER || keyCode == RETURN) {
    start = true;
  }
}
