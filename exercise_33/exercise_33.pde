

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

float sunDiameter = 1090;
float sunRadius = sunDiameter/2;




//initializing the solarsystems planets using relatively correct data
//(planet name, distance from sun(100 = 1 AU), diameter (in relation to earth diam.), speed(km/h), has moon(true or false), amount of moons )

//inner
Planet mercury = new Planet("mercury", sunRadius + 30.1, 3.8,  0.00172, false, 0); //no moon
Planet venus =   new Planet("venus", sunRadius + 70.2,   9.5,  0.00126,  false, 0); // no moon
Planet earth =   new Planet("earth", sunRadius + 100.0,   10,    0.00100, true,  1); // 1 moon
Planet mars =    new Planet("mars", sunRadius + 150.2,    5.3,  0.00086, true,  2); //  2 moons

//outer
Planet jupiter = new Planet("jupiter", sunRadius + 520.0,  101.19, 0.00047, true, 62); //62 moons
Planet saturn =  new Planet("saturn", sunRadius + 950.4,   94.0,  0.00034, true, 60); // 60 moons
Planet uranus =  new Planet("uranus", sunRadius + 1920.2,  40.4,  0.00024, true, 27); // 27 moons
Planet neptune = new Planet("neptune", sunRadius + 3000.6, 38.8,   0.00019, true, 13); // 13 moons
//Planet pluto = new Planet(0,0); // I'd be damned if I ever recognize pluto as a planet (and missouri as a state!)



void setup() {
  size(1200, 800);
  smooth();
  background(255);

  zoom = 0.4; // initial zoom level
  offset = new PVector(0, 0);
  poffset = new PVector(0, 0);

  //  background = loadImage("solar-system.jpg");
  //  background.resize(width, height);
}

void draw() {
println(zoom);
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
  ellipse(0, 0, sunDiameter, sunDiameter);
  

  // display the planets even when paused
  mercury.display();
  venus.display();
  earth.display();
  mars.display();
  jupiter.display();
  saturn.display();
  uranus.display();
  neptune.display();

  if (pause == false) { // stop moving the planets if pause button is pressed (moons will still rotate)
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

//control sheme
//Zoom function
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();

  //Zoom in
  if (e == -1) {
    zoom += 0.1;
  }

  //Zoom out
  else if (e == 1) {
    zoom -= 0.1;
  }
  zoom = constrain(zoom, 0, 10);
}
// Store the mouse and the previous offset
void mousePressed() {
  mouse = new PVector(mouseX, mouseY);
  poffset.set(offset);
  
  
  // mouseEvent variable contains the current event information // double click to zoom more
  
  if (mouseEvent.getClickCount()==2 && mouseButton == LEFT){
    zoom += 0.8;
  }
  else if (mouseEvent.getClickCount()==2 && mouseButton == RIGHT){
    zoom -= 0.8;
  
  }
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



