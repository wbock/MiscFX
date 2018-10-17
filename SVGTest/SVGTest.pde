
import java.util.Arrays;

PShape momo;
PShape background;
LSystem lsys;
Turtle turtle;

int treeAmount = 30; // total tree count
int treeLifetime = 60000; //lifetime in ms

int treeAges[], treeOffsets[], treePositions[], treeComplexities[], drawOrder[]; 

int lastTime;

void setup() {
  //size(1280, 720, P2D); 
  fullScreen(P3D);
    
  momo = loadShape("MOMO-MIN.svg");
  momo.disableStyle();

  Rule[] ruleSet = new Rule[1];
  ruleSet[0] = new Rule('D', "DD>S>D<D<DR<S<D>D>DR");
  lsys = new LSystem("D", ruleSet, 5);
  
  treeAges = new int[treeAmount];
  treeOffsets = new int[treeAmount];
  treePositions = new int[treeAmount];
  treeComplexities = new int[treeAmount];
  
  
  for(int i = 0; i<treeAmount; i++) {
    generateTree(i, true);
  }
  
  background(0);
} 

void draw() {
  
  drawBackground();

  //int treeAge; 
  int time = millis();
  strokeWeight(2);
    
  for(int i = 0; i<treeAmount; i++) {
    //Set tree base-color
    stroke(map(treeOffsets[i] , 0, height/5, 150, 10));
   
    treeAges[i] += time - lastTime;
    drawTree(treeComplexities[i], treeAges[i], treePositions[i], treeOffsets[i]);
    
    if(treeAges[i] > treeLifetime) {
       generateTree(i, false);
    }
  }
  
  
  fill(0, 30);
  noStroke();
  rect(0,0,width,height);
  
  float alpha1 = map(sin(.0001*millis() * PI), -1, 1, 0, 240);
  float alpha2 = map(sin(.0001*millis() * PI), -1, 1, 240, 0);
  fill(240, alpha1);

  stroke(240, alpha2);
  shape(momo, height/11+alpha1/20, height/11+alpha1/20, height/6+alpha2/10, height/6+alpha2/10); 
  
  lastTime = time;
}

void drawBackground() {
  pushStyle();
  
  noStroke();
  fill(#1C1B1B);
  beginShape();
    vertex(0,height);
    vertex(0,.80*height);
    vertex(width,.78*height);
    vertex(width,height);
  endShape();
  
  fill(#343434);
  beginShape();
    vertex(0, height);
    vertex(0, 0.81*height);
    vertex(width, 0.86*height);
    vertex(width, height);
  endShape();
  
  fill(#4D4B4B);
  beginShape();
    vertex(0, height);
    vertex(0, 0.91*height);
    vertex(0.61*width, 0.85*height);
    vertex(width, 0.86*height);
    vertex(width, height);
  endShape();
  
  fill(#5F5F5F);
  beginShape();
    vertex(0, height);
    vertex(0, 0.93*height);
    vertex(0.06*width, 0.89*height);
    vertex(width, 0.96*height);
    vertex(width, height);
  endShape();
  
  fill(#818181);
  beginShape();
    vertex(0, height);
    vertex(0, 0.97*height);
    vertex(width, 0.93*height);
    vertex(width, height);
  endShape();
  
  popStyle();
}

void generateTree(int treeNr, boolean isInit) { 
  treeAges[treeNr] = isInit ? (int) random(0, treeLifetime) : 0;
  treeOffsets[treeNr] = (int) random (0,height/5);
  treePositions[treeNr] = treeNr+1;
  treeComplexities[treeNr] = (int) random(2, 4);
}

void drawTree(int phase, float size, int position, float offset) {
    pushMatrix();
    translate(position*width/(treeAmount+1), height-offset);
    rotate(-radians(map(sin(0.1*millis()/1000.0* 2.0 * PI + position/8), -1, 1, 85, 90)));
    turtle = new Turtle(lsys.getSentence(phase), map(size, 1000, treeLifetime, 1, height/20), radians(map(sin(.1*millis()/1000.0* 2.0 * PI), -1, 1, 22, 24)));
    turtle.render();
    popMatrix();
}
