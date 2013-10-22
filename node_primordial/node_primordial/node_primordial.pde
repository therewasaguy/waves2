float startAngle = 0;
float angleVel = 0.5;
 
void setup() {
  size(400,200);
}
 
void draw() {
  background(255);
 
//In order to move the wave, we start at a different theta value each frame. startAngle += 0.02;
float angle = startAngle;
 
  for (int x = 0; x <= width; x += 24) {
    float y = map(noise(angle),0.0,1.0,0,height);
    stroke(0);
    fill(0,50);
    Node n = new Node(float(x),y);
    n.display();
    angle += angleVel;
  }
  startAngle+=.01;
}
