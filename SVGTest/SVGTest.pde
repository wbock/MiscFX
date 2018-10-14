
PShape momo;
LSystem lsys;
Turtle turtle;

void setup() {
  size(1280, 720, P3D); 
  momo = loadShape("MOMO-MIN.svg");
  momo.disableStyle();
  //sentence = "A";
  //count = 0;
  //next = new StringBuffer();

  Rule[] ruleSet = new Rule[1];
  ruleSet[0] = new Rule('D', "DD>S>D<D<DR<S<D>D>DR");
  lsys = new LSystem("D", ruleSet, 5);
  turtle = new Turtle(lsys.getSentence(4), height/64, radians(25));
} 

void draw() {
  background(20);

  background(255);  
  fill(0);
  //text("Click mouse to generate", 10, height-10);
  
  translate(width/4, height);
  rotate(-PI/2);
  turtle = new Turtle(lsys.getSentence(3), height/128, radians(map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 20, 25)));
  turtle.render();

  //why are y-translations not along a 90deg axis, but x works?
  translate(-50, 100);
  turtle = new Turtle(lsys.getSentence(4), height/64, radians(map(cos(.2*millis()/1000.0* 2.0 * PI), -1, 1, 20, 25)));
  turtle.render();
  /*
  float alpha = map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 0, 255);
  fill(255, alpha);
  stroke(255, 255-alpha);
  shape(momo, (width-height)/2+(height/8), height/8, 6*height/8, 6*height/8);
  */
}

void updateTree() {
  
}
