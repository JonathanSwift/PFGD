class Planet {

  
  float planetRotation;      // Rotation around sun
  String planetName; //the name of the planet
  float planetDiameter;   // Size of planet
  float planetDistance;   // Distance from sun
  float planetOrbitSpeed; // Orbit speed
  
  float planetRadius;

    //moon control
  boolean hasMoon;
  int moonSpawned;
  int moonAmount;
  ArrayList <Moon> moons;


  //initializing object from the moon class
  Moon moon;


  Planet(String _name, float _distance, float _diameter, float _orbitSpeed, boolean _hasMoon, int _moonAmount) {
    planetName = _name;
    planetDistance = _distance;
    planetDiameter = _diameter;
    planetOrbitSpeed = _orbitSpeed;

    //moon control
    hasMoon = _hasMoon;
    moonAmount = _moonAmount;
    moons = new ArrayList<Moon>();

    planetRotation = 0;
    planetRadius = planetDiameter/2;

    // create the Moon of a given planet if the "hasMoon" statement is true   
    if (hasMoon == true) {
      for (int i = 0; i < moonAmount; i++) {
        moon = new Moon(this);
        moons.add(moon);
      }
    }
  }

  void update() {
    // Increment the angle to rotate
    planetRotation += planetOrbitSpeed;
  }

  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 

    // Rotate orbit
    rotate(planetRotation); 

    // translate out distance
    translate(planetDistance, 0); 

    noStroke();
    colorMode(HSB);
    fill(255, 255, 255);
    ellipse(0, 0, planetDiameter, planetDiameter);

    fill(200, 200,200);
    stroke(1);
    rotate(-planetRotation); // counter the rotation of the planet so that the text below always will be vertical on screen
    text(planetName, planetDiameter, 0);
    

    // The planet is drawn, now draw and update the moon(s) if the planet object has one
    if (hasMoon == true) {
      for (int i = moons.size() -1; i > -1; i--) {       
        moons.get(i).update();
        moons.get(i).display();
      }
    }
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix();
  }
}

