/*
  Draw vectors based on an instruction set
  D - draw
  M - move
  < - turn left
  > - turn right
  S - save location
  R - restore location
*/

private String todo;
private float size, angle;

private int stage;

class Turtle {
  
  Turtle(String tempTodo, float tempSize, float tempAngle){
    todo = tempTodo;
    size = tempSize;
    angle = tempAngle;
  }
  
  void render() {
     for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'D') {
        line(0,0,size,0);
        translate(size,0);
      }
      else if ( c == 'M') {
        translate(size,0);
      }
      else if (c == '>') {
        rotate(angle);
      } 
      else if (c == '<') {
        rotate(-angle);
      } 
      else if (c == 'S') {
        pushMatrix();
      } 
      else if (c == 'R') {
        popMatrix();
      }
    } 
  }
  
  void setStage(int i) {
    stage = i;
  }
}
