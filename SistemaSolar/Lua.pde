class Moon {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  
  Moon(float distance_, float diameter_) {
    // Velocidade sorteada como no original: o sinal define o sentido da órbita
    this(distance_, diameter_, random(-0.1,0.1));
  }

  // Extensão: permite fixar orbitspeed, para que luas do mesmo planeta
  // tenham velocidades garantidamente diferentes
  Moon(float distance_, float diameter_, float orbitspeed_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = orbitspeed_;
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(175);
    ellipse(0,0,diameter,diameter);
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}