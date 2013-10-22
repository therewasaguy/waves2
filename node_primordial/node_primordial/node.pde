class Node {
  float x,y; //location
  float dia; //diameter


Node (float _x, float _y) {
  dia = 48;
  x = _x;
  y = _y;
}

void display() {
  ellipse(x,y,dia,dia);
}

}
