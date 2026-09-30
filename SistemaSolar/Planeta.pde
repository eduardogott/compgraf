class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  color c;          // Cor do planeta (extensão: parâmetro visual)
 
  // Each Planet now has Moons! (extensão: array para permitir mais de uma lua)
  Moon[] moons;
 
  
  Planet(float distance_, float diameter_, color c_, Moon[] moons_) {
    distance = distance_;
    diameter = diameter_;
    c = c_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    
    // As luas são criadas em setup(), cada uma com sua distance, diameter e orbitspeed
    moons = moons_;
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moons: cada lua incrementa apenas o seu próprio theta
    for (Moon m : moons) {
      m.update();
    }
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(c);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moons (todas partem do sistema de coordenadas do planeta)
    for (Moon m : moons) {
      m.display();
    }
    
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}