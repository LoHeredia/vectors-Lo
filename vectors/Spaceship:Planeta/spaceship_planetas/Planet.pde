class Planet {
  //atributos 
  float xPos, yPos;
  float speed, distance, direction, size;

  //constructor 
  Planet(float dir, float dis, float sp, float sz) {
    direction = dir;
    distance = dis ;
    speed = sp;
    size = sz;
    xPos = width/2 + sin(direction)*distance;
    yPos = height/2 + cos(direction)*distance;
  }

  //dibujar

  void render() {
    ellipse(xPos, yPos, size, size);
    direction +=radians(speed);
    xPos = width/2 + sin(direction)*distance;
    yPos = height/2 + cos(direction)*distance;
  }
}
