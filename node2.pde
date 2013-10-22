class Node2 extends Node {
  
  float theta;
  float xVel;
  float wait = random(1,12);
  
 Node2(PVector l) { 
  super(l);
  dia = random(1,64);
  
}

void update() {
    super.update();
    // Increment rotation based on horizontal velocity
    float theta_vel = (vel.y * vel.mag()) / 10.0f;
    theta += theta_vel;
  }


void display() {
  
  colorMode(HSB);
  c = color(random(270,285),random(75,100),random(100,80));
  stroke(c);
  strokeWeight(wait);
  xVel = map(vel.y,-1,1,-.5,.5);
  loc.x += xVel;
    float theta_vel = (vel.y * vel.mag()) / 10.0f;
    theta += theta_vel;
    
      pushMatrix();
//  line(loc.x, loc.y, loc.x+.5*dia, loc.y+.5*dia);
  translate((2*loc.x+.5*dia)/2,(2*loc.y + +.5*dia)/2);
  rotate(theta);
  line(-.5*dia/2, -.5*dia/2, .5*dia/2, .5*dia/2);
  popMatrix();
}

}
