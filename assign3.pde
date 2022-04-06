final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg,soil0, soil1, soil2, soil3, soil4, soil5,life;
PImage stone1, stone2;
// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;


//last
PImage groundhogIdle;
PImage groundhogDown, groundhogLeft, groundhogRight;
final int GROUNDHOG_W=80, GROUNDHOG_H=80;
final int SOIL_W=80, SOIL_H=80;

//move
int animationFrame;

final int GROUNDHOG_IDLE = 0;
final int GROUNDHOG_LEFT = 1;
final int GROUNDHOG_RIGHT = 2;
final int GROUNDHOG_DOWN = 3;
int groundhogState = GROUNDHOG_IDLE;

float groundhogX = width*4/8;
float groundhogY = height*1/6;
float newY;
//soil'y up(-up)


void setup() {
  size(640, 480, P2D);
  // Enter your setup code here (please put loadImage() here or your game will lag like crazy)
  bg = loadImage("img/bg.jpg");
  title = loadImage("img/title.jpg");
  gameover = loadImage("img/gameover.jpg");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  groundhogIdle=loadImage("img/groundhogIdle.png");
  groundhogDown=loadImage("img/groundhogDown.png");
  groundhogLeft=loadImage("img/groundhogLeft.png");
  groundhogRight=loadImage("img/groundhogRight.png");
  soil0= loadImage("img/soil0.png");
  soil1= loadImage("img/soil1.png");
  soil2= loadImage("img/soil2.png");
  soil3= loadImage("img/soil3.png");
  soil4= loadImage("img/soil4.png");
  soil5= loadImage("img/soil5.png");
  stone1= loadImage("img/stone1.png");
  stone2= loadImage("img/stone2.png");
  life= loadImage("img/life.png");

  //groundhog

  groundhogX=320;
  groundhogY=80;
  newY=0;

}

void draw() {
  /* ------ Debug Function ------ 
   
   Please DO NOT edit the code here.
   It's for reviewing other requirements when you fail to complete the camera moving requirement.
   
   */
  if (debugMode) {
    pushMatrix();
    translate(0, cameraOffsetY);
  }
  /* ------ End of Debug Function ------ */


  switch (gameState) {

  case GAME_START: // Start Screen
    image(title, 0, 0);

    if (START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
      }
    } else {

      image(startNormal, START_BUTTON_X, START_BUTTON_Y);
    }
    break;

  case GAME_RUN: // In-Game
for( int i=0;i<5;i++){
  image(life,10+70*i,10);
  }
    if (newY<20*80) {
      groundhogY=80;
    }
    if (groundhogY>80) {
      newY=20*80;
    }


    // Background
    image(bg, 0, 0);

    // Sun
    stroke(255, 255, 0);
    strokeWeight(5);
    fill(253, 184, 19);
    ellipse(590, 50, 120, 120);

    pushMatrix();
    translate(0, -newY);


    // Grass
    fill(124, 204, 25);
    noStroke();
    rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

    // Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    
    for ( int y=2; y<6; y++ ) {
      for ( int x=0; x<8; x++ ) {
        image( soil0, x*80, y*80);
      }
    }




    for ( int y=2+4*1; y<6+4*1; y++ ) {
      for ( int x=0; x<8; x++ ) {
        image( soil1, x*80, y*80);
      }
    }
    for ( int y=2+4*2; y<6+4*2; y++ ) {
      for ( int x=0; x<8; x++ ) {
        image( soil2, x*80, y*80);
      }
    }
    for ( int y=2+4*3; y<6+4*3; y++ ) {
      for ( int x=0; x<8; x++ ) {
        image( soil3, x*80, y*80);
      }
    }
    for ( int y=2+4*4; y<6+4*4; y++ ) {
      for ( int x=0; x<8; x++ ) {
        image( soil4, x*80, y*80);
      }
    }
    for ( int y=2+4*5; y<6+4*5; y++ ) {
      for ( int x=0; x<8; x++ ) {
        image( soil5, x*80, y*80);
      }
    }

    //rock1-8
    final int COUNT=8;
    float spacingX=width/COUNT;
    float spacingY=80*8/COUNT;
    float stone_x, stone_y=0;
    for (int i=0; i<COUNT; i++) {
      stone_x=i*spacingX;
      stone_y+=spacingY;
      image(stone1, stone_x, stone_y+80);
    }

    //19
    final int COUNTN=8;
    float spacingXn=width/COUNTN;
    float spacingYn=80*8/COUNTN;
    float stone_xn, stone_yn=0;
    for (int in=0; in<COUNTN; in++) {
      stone_xn=in*spacingXn;
      stone_yn+=spacingYn;
      image(stone1, stone_xn, -stone_yn+80*(17+9));
      image(stone1, stone_xn+80, -stone_yn+80*(17+9));
      image(stone1, stone_xn+80*3, -stone_yn+80*(17+9));
      image(stone1, stone_xn+80*4, -stone_yn+80*(17+9));
      image(stone1, stone_xn+80*6, -stone_yn+80*(17+9));
      image(stone1, stone_xn+80*7, -stone_yn+80*(17+9));


      image(stone1, stone_xn-80*2, -stone_yn+80*(17+9));
      image(stone1, stone_xn-80*3, -stone_yn+80*(17+9));
      image(stone1, stone_xn-80*5, -stone_yn+80*(17+9));
      image(stone1, stone_xn-80*6, -stone_yn+80*(17+9));
     

      image(stone2, stone_xn-80*2, -stone_yn+80*(17+9));
      image(stone2, stone_xn-80*5, -stone_yn+80*(17+9));
      image(stone2, stone_xn+80*1, -stone_yn+80*(17+9));
      image(stone2, stone_xn+80*4, -stone_yn+80*(17+9));
      image(stone2, stone_xn+80*7, -stone_yn+80*(17+9));
    }




    //9-16
    pushMatrix();
    translate(0, (9+1)*80);
    int s=80;
    image(stone1, 1*s, 0);
    image(stone1, 2*s, 0);
    image(stone1, 5*s, 0);
    image(stone1, 6*s, 0);
    image(stone1, 1*s, 3*s);
    image(stone1, 2*s, 3*s);
    image(stone1, 5*s, 3*s);
    image(stone1, 6*s, 3*s);
    image(stone1, 1*s, 4*s);
    image(stone1, 2*s, 4*s);
    image(stone1, 5*s, 4*s);
    image(stone1, 6*s, 4*s);
     
    image(stone1, 1*s, 7*s);
    image(stone1, 2*s, 7*s);
    image(stone1, 5*s, 7*s);
    image(stone1, 6*s, 7*s);
    //stand
    image(stone1, 1*s, 0);
    image(stone1, 2*s, 0);
    image(stone1, 5*s, 0);
    image(stone1, 6*s, 0);
    image(stone1, 0,   1*s);
    image(stone1, 3*s, 1*s);
    image(stone1, 4*s, 1*s);
    image(stone1, 7*s, 1*s);
    image(stone1, 0,   2*s);
    image(stone1, 3*s, 2*s);
    image(stone1, 4*s, 2*s);
    image(stone1, 7*s, 2*s);
    image(stone1, 0,   5*s);
    image(stone1, 3*s, 5*s);
    image(stone1, 4*s, 5*s);
    image(stone1, 7*s, 5*s);
    image(stone1, 0,   6*s);
    image(stone1, 3*s, 6*s);
    image(stone1, 4*s, 6*s);
    image(stone1, 7*s, 6*s);

    popMatrix(); 
    popMatrix(); 

    // Player
    //move
    if (animationFrame<15) {
      animationFrame++;
      switch(groundhogState) {
      case GROUNDHOG_LEFT:
        groundhogX -= 80/15.0;
        break;
      case GROUNDHOG_RIGHT:
        groundhogX += 80/15.0;
        break;
      case GROUNDHOG_DOWN:
        groundhogY += 80/15.0;
        newY += 80/15.0;
        break;
      }

      if (animationFrame == 15) {
        groundhogX = round(groundhogX);
        groundhogY = round(groundhogY);
        newY = round(newY);
      }
    } else {
      groundhogState = GROUNDHOG_IDLE;
    }
    
    for( int k=0;k<playerHealth;k++){
  image(life,10+70*k,10);
  }


    //avoid out of area
    if (groundhogX>560) { 
      groundhogX-= 80/15.0;
    }
    if (groundhogX<0) {
      groundhogX+= 80/15.0;
    }
    if (groundhogY>400) {
      groundhogY-= 80/15.0;
    }
    //groundhog display
    switch(groundhogState) {
    case GROUNDHOG_IDLE:
      image(groundhogIdle, groundhogX, groundhogY);
      break;
    case GROUNDHOG_LEFT:

      image(groundhogLeft, groundhogX, groundhogY);
      break;
    case GROUNDHOG_RIGHT:
      image(groundhogRight, groundhogX, groundhogY);
      break;
    case GROUNDHOG_DOWN:
      image(groundhogDown, groundhogX, groundhogY);
      
      break;
    }
      if(playerHealth==0){
    
   
    
    gameState=GAME_OVER;
    
    }
    break;

  case GAME_OVER: // Gameover Screen
    image(gameover, 0, 0);

    if (START_BUTTON_X + START_BUTTON_W > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_H > mouseY
      && START_BUTTON_Y < mouseY) {

      image(restartHovered, START_BUTTON_X, START_BUTTON_Y);}
      if (mousePressed) {
        gameState = GAME_RUN;
        mousePressed = false;
        // Remember to initialize the game here!
        playerHealth =2;
         groundhogX=320;
    groundhogY=80;
    newY=0;
      
    } else {

      image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
    }
    break;
  }

  // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
  if (debugMode) {
    popMatrix();
  }
}

void keyPressed() {
  // Add your moving input code here
if (groundhogState == GROUNDHOG_IDLE) {
    animationFrame = 0;
    switch(keyCode) {
    case LEFT:
      groundhogState = GROUNDHOG_LEFT;
      break;
    case RIGHT:
      groundhogState = GROUNDHOG_RIGHT;
      break;
    case DOWN:
      groundhogState = GROUNDHOG_DOWN;

      break;
    }
  }
  // DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
  switch(key) {
  case 'w':
    debugMode = true;
    cameraOffsetY += 25;
    break;

  case 's':
    debugMode = true;
    cameraOffsetY -= 25;
    break;

  case 'a':
    if (playerHealth > 0) playerHealth --;
    break;

  case 'd':
    if (playerHealth < 5) playerHealth ++;
    break;
  }
  
}
