float shift = .01;
Wave w1, w2, w3;
PVector gravity = new PVector(0, .002);
ArrayList<Wave> waves;

void setup() {
  size(640,480);
  waves = new ArrayList<Wave>();
  w1 = new Wave(width/2,height/2,1);
  w2 = new Wave(width/2,height/2,1);
  w3 = new Wave(width/2,height/2,1);
  
  waves.add(w1);
  waves.add(w2);
  waves.add(w3);  
  
  //display creates the waves but don't want this in draw...shoudl call display "generate"
  for (Wave w : waves) {
  w.display(shift);
  }
}

void draw() {
  colorMode(HSB);
  background(60,100,10);
  float shifty = noise(shift);
  float shiftyy = noise(shift) + .5;
  
//  oscillate is their update function
  w1.oscillate(shifty);
  w2.oscillate(shiftyy);
  w3.oscillate(shift);

  for (Wave w : waves) {
  w.applyForce(gravity);
    for (Wave _w : waves) {
      w.checkCollisions(_w);
    }
  }

  shift += .01;
}

void mouseClicked() {
  waves.remove(w1);
  waves.remove(w2);
  waves.remove(w3);
  w1 = new Wave(width/2,height/2,1);
  w2 = new Wave(width/2,height/2,1);
  w3 = new Wave(width/2,height/2,1);  
  
  waves.add(w1);
  waves.add(w2);
  waves.add(w3);  

  //display creates the waves but don't want this in draw...shoudl call display "generate"
  for (Wave w : waves) {
  w.display(shift);
  }


}
