class Wave {
  PVector loc; //location
  float angle;
  float angleVel;
  ArrayList<Node> nodes;

Wave(float _x, float _y, float _angle) {
  loc = new PVector(_x, _y);
  angle = _angle;
  angleVel = .1;
  nodes = new ArrayList<Node>();

}

void display(float _angleShift) {
  angle = _angleShift;
  for (int x = 0; x <= width; x += 24) {
    float y = map(noise(angle),0.0,1.0,0,height);
    stroke(0);
    fill(0,50);
    PVector loca = new PVector(float(x),y);

//pick random
  int i = int(random(0,2));
  if (i == 1) {
    nodes.add(new Node(loca));
  } else
  { 
    nodes.add(new Node2(loca));
  }
    for (Node n : nodes) {
      n.display();
    }
    angle += angleVel;
    }
  }

void oscillate(float _angleShift) {

//    stroke(0);
//    fill(0,50);
//    nodes.add(new Node(float(x),y));
   angle = _angleShift;
   
    for (Node n : nodes) {
      n.display();
      float y = sin(angle);
      PVector osc = new PVector(0.0, y/100);
      n.oscillate(osc);
      n.update();
      n.display();
      angle += angleVel;
    }
      
}

void applyForce(PVector gravity) {
  for (Node n : nodes) {
        n.applyForce(gravity);
  }
}

ArrayList<Node> getNodes() {
  return nodes;
}

void checkCollisions(Wave awave) {
  
  ArrayList<Node> listy = awave.getNodes();
  //cycle through this array
  for (int i=nodes.size()-1; i>=0;i--) {
    Node a = nodes.get(i);

    for (int j = listy.size()-1; j >=0; j--) {
      Node b = listy.get(j);
      
      if ((nodes != listy) && (i != j)) {
        float dist = dist(a.loc.x, a.loc.y, b.loc.x, b.loc.y);
        if (dist < a.dia/2 + b.dia/2) {
          PVector vela = a.getVel();
          PVector velb = b.getVel();
          vela.mult(.5);
          velb.mult(.5);
            a.applyForce(velb);
            b.applyForce(vela);
          }
          print("collision!");
        }
      }
    }
  }
}
