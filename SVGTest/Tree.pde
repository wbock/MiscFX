// Draws a tree with the turtle class

int xLocation;
int yLocation;
int phase;
int treeSize;

class Tree{
 
  Tree(int tempPhase, int tempSize, int tempPos) {
    xLocation = tempPos*width/4;
    yLocation = (int) random(0,height/10);
    phase = tempPhase;
    treeSize = tempSize;
  }
  
  void render() {
    pushMatrix();
    stroke(255,0,0);
        
    translate(xLocation, height-yLocation);
    rotate(-radians(map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 85, 90)));
    turtle = new Turtle(lsys.getSentence(phase), height/size, radians(map(sin(.2*millis()/1000.0* 2.0 * PI), -1, 1, 22, 25)));
    turtle.render();
    popMatrix();
  }
  
  int getxLocation() {
    return xLocation;
  }
}
