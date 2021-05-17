Pelota p; //declarar

void setup() {
  background(255);
  size(800, 800, P3D);  //P3D es el render mode en 3D (eje z) 
  sphereDetail(60); // Controla el detalle utilizado para renderizar una esfera ajustando el número de vértices de la malla de la esfera.

  p = new Pelota(new PVector(0, 0, 0), new PVector (random(10), random(5), random(5)));
}
void draw() {
  background(255);
  //transalte = especifica una cantidad para desplazar objetos dentro de la ventana de visualización
  translate(width/2, height/2); //acomodar cubo en el centro 
  noFill();
  stroke(0);

  ambientLight(0, 0, 255);//luz que da color

  //BOX = caja con iguales dimensiones en todos los lados es un cubo.
  box(400); //tamaño del cubo 
  noStroke();
  fill(200); //opacidad de la pelota

  //DELCARANDO VOIDS
  p.move();
  p.drawPelota();
}

class Pelota {
  PVector pos, vel;
  float rad = 20;
  // PUBLIC = proporcionar a otras clases acceso a los campos y métodos dentro de una clase. 
  public Pelota(PVector pos, PVector vel) { 
    this.pos = pos; //this = Se refiere al objeto actual (es decir, "este objeto"), que cambiará según el contexto en el que se haga referencia.
    this.vel = vel;
  }

  void move() {
    if (abs(pos.x)+rad>150) // abs = Calcula el valor absoluto (magnitud) de un número
      vel.x = -vel.x;
    if (abs(pos.y)+rad>150)
      vel.y = -vel.y;
    if (abs(pos.z)+rad>150)
      vel.z = -vel.z;


    pos.add(vel);
  }

  void drawPelota() {
    pushMatrix(); // guarda el sistema de coordenadas actual en el stack 

    translate(pos.x, pos.y, pos.z); 
    // x= traducción izquierda / derecha, y= traducción arriba / abajo, z = traducciones hacia / lejos de la pantalla.
    //El uso de esta función con el parámetro z requiere el uso de P3D como parámetro en combinación con el tamaño
    sphere(rad);

    popMatrix(); //restaura el sistema de coordenadas anterior.
  }
}
