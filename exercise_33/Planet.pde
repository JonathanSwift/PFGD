class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitSpeed; // Orbit speed

    //mooncontrol
  boolean hasMoon;
  int moonSpawned;


  //initializing moon from the moon class
  Moon moon;


  Planet(float _distance, float _diameter, float _orbitSpeed, boolean _hasMoon) {
    distance = _distance;
    diameter = _diameter;
    orbitSpeed = _orbitSpeed;
    hasMoon = _hasMoon;
    

    theta = 0;
  }

  void update() {
    // Increment the angle to rotate
    theta += orbitSpeed;

    // create the Moon of a given planet if the constructor statement is true and
    // pass the information to the update function with a variable
    if (hasMoon == true) {
      moon = new Moon(diameter*1.5, diameter/4);
      moonSpawned = 1;
    }
    hasMoon = false;
  }

  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 

    // Rotate orbit
    rotate(theta); 

    // translate out distance
    translate(distance, 0); 
    stroke(0);
    fill(175);
    ellipse(0, 0, diameter, diameter);

    // The planet is drawn, now draw the moon if the planet object has one
    if (moonSpawned == 1) {
      moon.update();
      moon.display();
    }
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix();
  }
}

