class Spaceship {
  PVector position;
  PVector velocity;
  PVector accel;
  float direction;

  //constructor
  Spaceship(float x, float y) {
    
    position = new PVector(x, y);
    velocity = new PVector(2, 2);
    accel = new PVector();

    velocity = PVector.random2D();
    velocity.mult(3.0);//vel a la que se mueve
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

  void render() {
    fill(0);
    noStroke();
    pushMatrix(); // guarda el sistema de coordenadas actual en stack

    Keys(); //declarando el void donde van las teclas

    velocity.add(accel);  
    velocity.limit(10);
    position.add(velocity);   
    move();
    checkEdges();

    translate(position.x, position.y);
    rotate(direction);
    fill(255);  
    triangle(-10, 20, 10, 20, 0, -20); 
    rect(-10, 5, 20, 20);
    rect(-20, 20, 40, 5);
    rect(20, 20, -10, 10);
    rect(-20, 20, 10, 10);

    position.add(velocity);  //physics engine
    velocity.add(accel);


    popMatrix(); // restaura el sistema de coordenadas anterior.
  }
}
