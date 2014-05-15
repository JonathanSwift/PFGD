

/*
 33. Animate the Solar system in 2D using matrix operations 
 (translation, rotation, scale) to rotate
 planets around the sun. Use classes and objects.
 (20 points)
 */

// Used litterature: Learning processing; Shiffman. pp. 248 - 251.


//PImage background;



float zoom;
PVector offset, poffset, mouse;
boolean pause = false;
float sunRadius = 1400/2;

//initializing the solarsystems planets using relatively correct data
//(distance from sun(mio. km), diameter(mio.), speed(km/h), has moon(true or false) )
Planet mercury = new Planet(58+sunRadius, 4.8, 0.00172, false);
Planet venus = new Planet(108+sunRadius, 12, 0.00126, false);
Planet earth = new Planet(150+sunRadius, 12.7, 0.00100, true);
Planet mars = new Planet(228+sunRadius, 6.8, 0.00086, true); // has 2 moons
Planet jupiter = new Planet(778+sunRadius, 143, 0.00047, true); //62 moons
Planet saturn = new Planet(1427+sunRadius, 120.5, 0.00034, true); // 60 moons
Planet uranus = new Planet(2871+sunRadius, 51, 0.00024, true); // 27 moons
Planet neptune = new Planet(4500+sunRadius, 24.7, 0.00019, true); // 13 moons
//Planet pluto = new Planet(0,0); // I'd be damned if I ever recognize pluto as a planet (and missouri as a state!)



void setup() {
  size(1200, 800);
  smooth();
  background(255);

  zoom = 0.1; // initial zoom level
  offset = new PVector(0, 0);
  poffset = new PVector(0, 0);

  //  background = loadImage("solar-system.jpg");
  //  background.resize(width, height);
}

void draw() {

  background(0);
  noStroke();
  //  image(background, 0, 0);


  pushMatrix(); // saving the original cordinate sys
  translate(width/2, height/2); // centers the cordinate system on the screen
  scale(zoom); //scale everything down or up
  translate(offset.x/zoom, offset.y/zoom ); // using mousepos to "retranslate" to be able to pan around the screen 

  //the sun
  stroke(0);
  fill(255);
  ellipse(0, 0, 1400, 1400);
  text("testTtext", 200, 200);

  // display the planets even when paused
  mercury.display();
  venus.display();
  earth.display();
  mars.display();
  jupiter.display();
  saturn.display();
  uranus.display();
  neptune.display();

  if (pause == false) { // stop moving the planets if pause button is pressed
    mercury.update();
    venus.update();
    earth.update();
    mars.update();
    jupiter.update();
    saturn.update();
    uranus.update();
    neptune.update();
  }
  popMatrix();
}

//Zoom function
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();

  //Zoom in
  if (e == -1) {
    zoom += 0.01;
  }

  //Zoom out
  else if (e == 1) {
    zoom -= 0.01;
  }
  zoom = constrain(zoom, 0, 6);
}
// Store the mouse and the previous offset
void mousePressed() {
  mouse = new PVector(mouseX, mouseY);
  poffset.set(offset);
}

// Calculate the new offset based on change in mouse vs. previous offsey
void mouseDragged() {
  offset.x = mouseX - mouse.x + poffset.x;
  offset.y = mouseY - mouse.y + poffset.y;
}

void keyPressed() {

  if (key == 'p' || key == 'P') {
    if (pause == false) {
      pause = true;
    }
    else {
      pause = false;
    }
  }
}

