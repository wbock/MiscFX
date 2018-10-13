
PShape momo;

void setup() {
  size(1280, 720, P3D); 
  momo = loadShape("MOMO-MIN.svg");
  momo.disableStyle();
} 

void draw() {
  background(20);

  float alpha = map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 0, 255);
  fill(255, alpha);
  stroke(255, 255-alpha);
  shape(momo, (width-height)/2+(height/8), height/8, 6*height/8, 6*height/8);
}
