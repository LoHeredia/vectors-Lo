PVector a,b,c,d,e,f;

void setup() {
  size(800, 800);
  a = new PVector (width*0.5, height*0.5);
  b = new PVector (0,0);
  c = new PVector (mouseX,mouseY);
}

void draw() {
  background(255);
  c = new PVector(mouseX,mouseY); // track mouse 
  Pyramide(500);
  
  /*strokeWeight(2); //grosor de las lineas
  fill(255);
    for(int i = 0; i < height; i = i + 30) { //el 30 controla la cantidad de ciruclos 
    circle(width/2 + map(i, 0, height, 0, mouseX-width/2), height/2 + map(i, 0, height, 0, mouseY-height/2), map(i, 0, height, height, 0));
    //circle(                coordenadas en x,                       coordenadas en y,                           radio del circulo) 
}*/
  
}

void Pyramide(float y) {
  
  strokeWeight(4);
  fill(#BDB7F5);
  for(int i = 0; i <=5; i++){
    b.normalize();
    b = a.copy();
    b.sub(c);
    b.mult(i);
    b.limit(i*100); //que tanto se puede estirar
    
    ellipse(a.x + b.x, a.y + b.y, y - i * 100, y - i * 100); 
  
  
  }
}
