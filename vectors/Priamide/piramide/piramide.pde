void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  strokeWeight(2); //grosor de las lineas
  fill(255);
    for(int i = 0; i < height; i = i + 30) { //el 30 controla la cantidad de ciruclos 
    circle(width/2 + map(i, 0, height, 0, mouseX-width/2), height/2 + map(i, 0, height, 0, mouseY-height/2), map(i, 0, height, height, 0));
    //circle(                coordenadas en x,                       coordenadas en y,                           radio del circulo) 
}
  
}
