// An array of 3 planet objects
Planet[] planets = new Planet[3];

void setup() {
  // Janela maior que a original (480x270) para que a lua externa do planeta 2 caiba na tela
  size(600, 400);

  // Mesmas distâncias do original (60 + i*36); cada planeta com sua cor e luas de tamanhos diferentes.
  // Luas criadas só com (distance, diameter) sorteiam orbitspeed em [-0.1, 0.1], como no original.
  planets[0] = new Planet(60, 24, color(230, 120, 50), new Moon[] {
    new Moon(20, 6)
  });
  planets[1] = new Planet(96, 24, color(60, 130, 220), new Moon[] {
    new Moon(24, 10)
  });
  // Planeta com duas luas: distance e orbitspeed diferentes (a interna é mais rápida,
  // a externa é mais lenta e gira no sentido oposto), além de tamanhos diferentes
  planets[2] = new Planet(132, 24, color(70, 170, 90), new Moon[] {
    new Moon(20, 7, 0.09),
    new Moon(34, 12, -0.05)
  });
}

void draw() {
  background(255);

  // Drawing the Sun
  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  fill(255);
  ellipse(0, 0, 64, 64);

  // Drawing all Planets
  for (int i = 0; i < planets.length; i++ ) {
    planets[i].update();
    planets[i].display();
  }
  popMatrix();
}
