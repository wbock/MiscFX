
import java.util.Arrays;

PShape momo;
PShape background;
LSystem lsys;
Turtle turtle;

int treeAmount = 30;
int treeLifetime = 60000; //lifetime in ms

int treeAge[], treeOffsets[], treePositions[], treeComplexity[], drawOrder[]; 

int count;
int lastTime;

void setup() {
  //size(1280, 720, P2D); 
  fullScreen();
  count = 0;
    
  momo = loadShape("MOMO-MIN.svg");
  momo.disableStyle();
  
  background = loadShape("backgrnd5(1).svg");

  Rule[] ruleSet = new Rule[1];
  ruleSet[0] = new Rule('D', "DD>S>D<D<DR<S<D>D>DR");
  lsys = new LSystem("D", ruleSet, 5);
  
  treeAge = new int[treeAmount];
  treeOffsets = new int[treeAmount];
  treePositions = new int[treeAmount];
  treeComplexity = new int[treeAmount];
  
  
  for(int i = 0; i<treeAmount; i++) {
    generateTree(i, true);
  }
  
  background(0);
} 

void draw() {
  //background(255);  
  fill(0);
  strokeWeight(2);

  //int treeAge; 
  int time = millis();
    
  shape(background, 0, width/30, width, height);
    
  for(int i = 0; i<treeAmount; i++) {
    stroke(map(treeOffsets[i] , 0, height/5, 150, 0));
   
    treeAge[i] += time - lastTime;
    drawTree(treeComplexity[i], treeAge[i], treePositions[i], treeOffsets[i]);
    
    if(treeAge[i] > treeLifetime) {
       generateTree(i, false);
    }
  }
  
  
  fill(0, 30);
  stroke(0);
  rect(0,0,width,height);
  
  float alpha1 = map(sin(.0001*millis() * PI), -1, 1, 0, 240);
  float alpha2 = map(sin(.0001*millis() * PI), -1, 1, 240, 0);
  fill(240, alpha1);
  strokeWeight(0);
  pushStyle();

  stroke(240, alpha2);
  popStyle();
  shape(momo, height/11+alpha1/20, height/11+alpha1/20, height/6+alpha2/10, height/6+alpha2/10); 
  
  count++;
  lastTime = time;
}

void generateTree(int treeNr, boolean isInit) { 
  treeAge[treeNr] = isInit ? (int) random(0, treeLifetime) : 0;
  treeOffsets[treeNr] = (int) random (0,height/5);
  treePositions[treeNr] = treeNr+1;
  treeComplexity[treeNr] = (int) random(2,4);
}

void drawTree(int phase, float size, int position, float offset) {
    pushMatrix();
    translate(position*width/(treeAmount+1), height-offset);
    rotate(-radians(map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 85, 90)));
    turtle = new Turtle(lsys.getSentence(phase), map(size, 1000, treeLifetime, 1, height/20), radians(map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 22, 25)));
    turtle.render();
    popMatrix();
}
