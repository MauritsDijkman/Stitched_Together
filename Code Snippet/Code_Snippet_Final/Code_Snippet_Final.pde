void setup() {
  size( 800, 800 );
}


final int    RIVER_SCENE = 1;
final int     LAWN_SCENE = 2;
final int    TABLE_SCENE = 3;
final int END_GAME_SCENE = 4;

int scene = RIVER_SCENE;

boolean wasMousePressed;

boolean isAppleTaken = false;


void draw() {
       if ( scene ==    RIVER_SCENE ) { scene1(); } 
  else if ( scene ==     LAWN_SCENE ) { scene2(); } 
  else if ( scene ==    TABLE_SCENE ) { scene3(); } 
  else if ( scene == END_GAME_SCENE ) { scene4(); }
  wasMousePressed = mousePressed;
}


void scene1() {
  noStroke();
  background( 0, 128, 0 );
  fill( 0, 0, 128 );
  rect( 0, 600, width, 200 );

  fill( 255 );
  if ( isAppleTaken ) {
    triangle( 250, 410, 230, 450, 270, 450 );
  }
  triangle( 750, 400, 750, 440, 790, 420 );

  noFill();
  stroke( 255, 0, 0 );
  //rect( 750, 400, 40, 40 );
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 750, 400, 40, 40 ) ) {
    scene = LAWN_SCENE;
  }
  //rect( 230, 410, 40, 40 );
  if ( isAppleTaken && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 230, 410, 40, 40 ) ) {
    scene = END_GAME_SCENE;
  }
}


void scene2() {
  noStroke();
  background( 0, 128, 0 );
  fill( 0, 128, 128 );
  rect( 0, 0, width, 400 );

  fill( 255, 255, 200 );
  quad( 100, 800, 200, 400, 300, 400, 400, 800 );

  fill( 0 );
  triangle( 250, 410, 230, 450, 270, 450 );
  triangle( 250, 790, 230, 750, 270, 750 );

  noFill();
  stroke( 255, 0, 0 );
  //rect( 230, 750, 40, 40 );
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 230, 750, 40, 40 ) ) {
    scene = RIVER_SCENE;
  }
  //rect( 230, 410, 40, 40 );
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 230, 410, 40, 40 ) ) {
    scene = TABLE_SCENE;
  }
}


void scene3() {
  noStroke();
  background( 64, 32, 16 );
  fill( 255 );
  rect( 200, 400, 400, 200 );

  fill( 0 );
  triangle( 250, 790, 230, 750, 270, 750 );

  // apple
  if ( isAppleTaken == false ) {
    fill( 128, 0, 0 );
    circle( 350, 380, 40 );
  }

  noFill();
  stroke( 255, 0, 0 );
  //rect( 230, 750, 40, 40 );
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 230, 750, 40, 40 ) ) {
    scene = LAWN_SCENE;
  }
  if ( ! wasMousePressed && mousePressed && isPointInCircle( mouseX, mouseY, 350, 380, 40 ) ) {
    isAppleTaken = true;
  }
}


void scene4() {
  noStroke();
  background( 0, 128, 0 );
  textSize( 40 );

  fill( 255, 128 );
  rect( 330, 400, 160, 70 );
  fill( 0 );
  text( "RESET", 350, 450 );

  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 330, 400, 160, 70 ) ) {
    resetGame();
  }
}


void resetGame() {
  isAppleTaken = false;
  scene = RIVER_SCENE;
}


// POINT/CIRCLE
boolean isPointInCircle(float px, float py, float cx, float cy, float r) {

  // get distance between the point and circle's center
  // using the Pythagorean Theorem
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the circle's
  // radius the point is inside!
  if (distance <= r) {
    return true;
  }
  return false;
}


// POINT/RECTANGLE
boolean isPointInRectangle(float px, float py, float rx, float ry, float rw, float rh) {

  // is the point inside the rectangle's bounds?
  if (px >= rx &&        // right of the left edge AND
    px <= rx + rw &&   // left of the right edge AND
    py >= ry &&        // below the top AND
    py <= ry + rh) {   // above the bottom
    return true;
  }
  return false;
}
