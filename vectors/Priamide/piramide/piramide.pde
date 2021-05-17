ArrayList<Circles> circles = new ArrayList<Circles>();

void setup() {
  size(800, 800);
  
  for(int i=0; i<1; i++) {
    for(int j=0; j<1; j++) {
      float x = i*100 + 400;
      float y = j*100 + 400;
      circles.add(new Circles(x, y));
    }
  }
  
}

void draw() {
  background(255);
  noFill();

  for(int i=0; i<circles.size(); i++) {
    Circles c = circles.get(i);
    c.display();
  }
}

class Circles {
  float x, y;
  float d = 100;
  int num = 10;

  Circles(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    float rad = atan2(mouseY - y, mouseX - x);
    float dis = dist(mouseX, mouseY, x, y);
    float ratio = map(dis, 0, 800, 1, 0);

    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(x, y);
    rotate(rad);
    for (int i = num; i > 0; i--) {
      float x = ratio * map(i, 0, num, 40, 0);
      float diameter = (d / num) * i;
      //float diameter = lerp(0, 100, i/num);
      ellipse(x, 0, diameter, diameter);
    }
    popMatrix();
  }

}
