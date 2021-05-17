Planet jupiter, earth, mars, lun, swampy, land_of_OOO;

Spaceship apollo, ajax;

void setup() {
  size(800, 800);
  background(0);
  noStroke();

  jupiter = new Planet(0, 180, 1.5, 30);
  earth = new Planet(60, 300, 1.5, 20);
  mars = new Planet(30, 200, 1.5, 40);
  lun = new Planet(70, 50, 1.5, 50);
  swampy = new Planet(100, 20, 1.5, 60);
  land_of_OOO = new Planet(120, 350, 1.5, 70);

  apollo = new Spaceship(300, 300);
  ajax = new Spaceship(300, 300);
}


void draw() {
  background(0);
  //ESTRELLAS//
  fill(255);
  ellipse(random(width), random(height), 3, 3);
  fill(#E5FA49);
  ellipse(random(width), random(height), 4, 4);

  //PLANETAS//
  fill(#5FFF0A);
  earth.render(); 
  fill(200, 100, 0);
  jupiter.render();
  fill(#FF0A4C);
  mars.render();
  fill(#CEB7DE);
  lun.render();
  fill(#68ABD6);
  swampy.render();
  fill(#F7E53C);
  land_of_OOO.render();

  fill(255);  
  triangle(-10, 20, 10, 20, 0, -20); 

  fill(#FF680A);
  rect(-10, 5, 20, 20);
  apollo.render();
  fill(255);
  rect(-20, 20, 40, 5);
  apollo.render();
  fill(#0AFF76);
  rect(20, 20, -10, 10);
  apollo.render();
  rect(-20, 20, 10, 10);
  apollo.render();

  fill(255);  
  triangle(-10, 20, 10, 20, 0, -20); 

  fill(#FF680A);
  rect(-10, 5, 20, 20);
  fill(255);
  rect(-20, 20, 40, 5);
  fill(#0AFF76);
  rect(20, 20, -10, 10);
  rect(-20, 20, 10, 10);
  ajax.render();
}
