
// New Moon object (this could really just be a Planet or done with Inheritance (chapter 22))



class Moon {

  // Each moon object keeps track of its own angle of rotation.
  float moonRotation;      // Rotation around planet
  float moonDiameter;   // Size of moon
  float moonDistance;   // Distance from planet
  float moonOrbitspeed; // Orbit speed
  float spawnPos;  // where to initially spawn the moon



  Moon(Planet _planet) {

    spawnPos = random (0, 360);
    moonRotation = 0;

    if (_planet.planetName != "earth") {
      moonDistance = random(_planet.planetDiameter/1.5, _planet.planetDiameter);
      moonDiameter = random(_planet.planetDiameter/40, _planet.planetDiameter/30);
      moonOrbitspeed = random(0.006, 0.008);
    }

    else if (_planet.planetName == "earth") {
      moonDistance = random(_planet.planetDiameter/1.5, _planet.planetDiameter);
      moonDiameter = _planet.planetDiameter/4; 
      moonOrbitspeed = random(0.006, 0.008);
      
    }
  }


  void update() {
    // Increment the angle to rotate
    moonRotation += moonOrbitspeed;
  }

  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    //placing moons randomly around planets
    rotate(spawnPos);

    // Rotate the moons orbit around planets
    rotate(moonRotation); 

    // translate out distance from planets center
    translate(moonDistance, 0); 

    stroke(0);
    fill(175, 200, 200);
    ellipse(0, 0, moonDiameter, moonDiameter);
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix();
  }
}

