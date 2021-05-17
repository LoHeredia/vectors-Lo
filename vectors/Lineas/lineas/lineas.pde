ArrayList<PVector[]> endPoints = new ArrayList<PVector[]>();

PVector init = null;
PVector end = null; 

float linesHeight = 64;
float separation = 4; 

void setup() {
  size(800, 600);
  smooth();
}


void draw() {
  background(255);

  //dibuja las lineas guardadas 

  for (PVector[] line : endPoints) {
    drawLines(line[0], line[1]);
  }

  /*
  for (int i = 0; i < endPoints.size(); i++) {
   PVector[] line = endPoints.get(i);
   } */
  /*
  PVector a = new PVector(140, 50);
   PVector b = new PVector(450, 520);
   drawLines(a, b);*/

  //Dibujar la linea actual
  if (init !=null) {
    drawLines(init, end);
  }
}

void drawLines (PVector init, PVector end) {
  //line(init.x, init.y, end.x, end.y);

  //direccion  = end - init
  PVector direction = PVector.sub(end, init);
  direction = new PVector(-direction.y, direction.x);
  direction.normalize();

  for (float s = -linesHeight / 2; s < linesHeight / 2; s += separation) {
    PVector a = direction.copy();
    a.mult(s); 
    a.add(init);

    PVector b = direction.copy();
    b.mult(s); 
    b.add(end);

    line(a.x, a.y, b.x, b.y);
  }
}

void mousePressed() {
  init = new PVector(mouseX, mouseY);
  end = init.copy();
}

void mouseDragged() {
  if (init != null) {

    end.x = mouseX;
    end.y = mouseY;
  }
}

void mouseReleased() {
  PVector[] line = {init, end};
  /*PVector[] line = new PVector[2];
   line[0] = init;
   line[1] = end; */

  endPoints.add(line);

  init = null;
  end = null;
}
