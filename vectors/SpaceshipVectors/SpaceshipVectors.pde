PVector position; // 
PVector velocity; // velocidad
PVector accel; //aceleracion
float direction; //direccion nave

void setup () {
  size(600, 600);
  background(0);
  noStroke();

  position = new PVector(300, 300);
  velocity = new PVector(2, 2);
  accel = new PVector();

  // Esto crea un vector aleatorio en dos dimensiones
  velocity = PVector.random2D();
  velocity.mult(3.0);//vel a la que se mueve
}

void draw () {
  background(0);

  //ESTRELLAS//
  fill(255);
  ellipse(random(width), random(height), 3, 3);
  fill(#E5FA49);
  ellipse(random(width), random(height), 4, 4);


  Keys(); //declarando el void donde van las teclas

  velocity.add(accel);  
  velocity.limit(10);
  position.add(velocity);   
  move();
  checkEdges();
  render(); //se dibuja la nave
}

void move () {

  accel.set(0, 0, 0);                     
  if (velocity.mag() != 0) velocity.mult(0.99); 


  if (position.x<0) {
    position.x = position.x+width;
  }
  if (position.x>width) {
    position.x = 0;
  }
  if (position.y<0) {
    position.y = position.y+height;
  }
  if (position.y>height) {
    position.y = 0;
  }
}

void Keys() {
  if (keyPressed && key == CODED) {
    if (keyCode == LEFT) {
      direction-=0.1;
    } else if (keyCode == RIGHT) {
      direction+=0.1;
    } else if (keyCode == UP) {
      float totalAccel = 0.2;                 
      accel.x = totalAccel * sin(direction);  
      accel.y = -totalAccel * cos(direction);
    }
  }
}

void checkEdges () {
  if (position.x < 0) {
    position.x = width;
  } else if (position.x > width) {
    position.x = 0;
  }

  if (position.y < 0) {
    position.y = height;
  } else if (position.y > height) {
    position.y = 0;
  }
}

void render () {
  fill(0);
  noStroke();

  pushMatrix(); // guarda el sistema de coordenadas actual en stack


  translate(position.x, position.y);
  rotate(direction);


  fill(255);  
  triangle(-10, 20, 10, 20, 0, -20); 
  
  fill(#FF680A);
  rect(-10, 5, 20, 20);
  fill(255);
  rect(-20, 20, 40, 5);
  fill(#0AFF76);
  rect(20, 20, -10, 10);
  rect(-20, 20, 10, 10);
 

  position.add(velocity);  //physics engine
  velocity.add(accel);


  popMatrix(); // restaura el sistema de coordenadas anterior.
}
/* fill(0);
 noStroke();
 
 PVector center = velocity.copy();
 center.normalize();
 center.mult(30.0);
 
 // Se toma un vector ortogonal
 PVector left = new PVector(-center.y, center.x);
 left.mult(0.5);
 
 // Se el otro vector ortogonal
 PVector right = new PVector(center.y, -center.x);
 right.mult(0.5);
 
 left.add(position);
 right.add(position);
 center.add(position);
 
 stroke(0);
 beginShape();
 vertex(center.x, center.y);
 vertex(left.x, left.y);
 vertex(right.x, right.y);
 endShape(CLOSE);*/
