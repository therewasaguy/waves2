class Node {
  PVector loc; //location
  PVector vel; //velocity
  PVector acc; //acceleration
  float dia; //diameter
  String type;
  color c;


///change to pvector
Node (PVector l) {
  dia = random(1,48);
  loc = l;
  acc = new PVector(0,0);
  vel = new PVector(0,0);
  colorMode(HSB);
  c = color(random(30,60),random(75,100),random(100,80));
}

void display() {
//  int i = int(random(0,2));
//  if (i <= 1) {
//    line(loc.x, loc.y,loc.x-.5*dia,loc.y-.5*dia);
//    type = "ellipse";
    fill(c);
  noStroke();
    ellipse(loc.x,loc.y,dia,dia);
//  } else {
//    type = "line";
//    line(loc.x, loc.y, loc.x+.5*dia, loc.y+.5*dia);
//  }
}

void applyForce(PVector force) {
  acc.add(force);
}

void update() {
  vel.add(acc);
  loc.add(vel);
  acc.mult(0);
  vel.mult(.999);
 
 if (loc.y < 0) {
  vel.y = -vel.y; 
 }
 
 if (loc.y > height) {
  vel.y = -vel.y; 
 }
 
 if (loc.x <= 0 || loc.x >= width) {
  vel.x = -vel.x; 
 }
}

void oscillate(PVector _osc) {
  acc.add(_osc);  
  //  pushMatrix();
  //translate(loc.x,loc.y);
  //rotate(.1);
//  if (type == "ellipse") {
//  loc.y += _y;
//    ellipse(loc.x,loc.y+_y,dia,dia);
//  } else {
//    line(loc.x, loc.y+_y, loc.x+.5*dia, loc.y+_y+.5*dia);
//  popMatrix();
  }

PVector getVel() {
 return vel; 
}

}

