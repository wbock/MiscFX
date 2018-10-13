import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class RobotUprisingVisu extends PApplet {


PGraphics cubeA;
PGraphics cubeB;
PShape momo;

public void setup() {
   
  cubeA = createGraphics(width, height, P3D);
  cubeB = createGraphics(width, height, P3D);
  momo = loadShape("MOMO-MIN.svg");
  momo.disableStyle();
} 

public void draw() {
  background(100);
  //drawCube(cubeA, 300, 600);
  
  drawCube(cubeB, 450, 750); 
  float alphaA = map(sin(.25f*millis()/1000.0f* 2.0f * PI), -1, 1, 0, 255);
  float alphaB = map(mouseY, 0, height, 0, 255);
  fill(255, alphaA);
  stroke(255, alphaA);
  shape(momo, (width-height)/2+(height/8), height/8, 6*height/8, 6*height/8);
  //image(cubeA, 0, 0);
  tint(255, alphaB);
  image(cubeB, 0, 0);
}

public void drawCube(PGraphics cube, float xd, float yd) {
  cube.beginDraw();
  cube.lights();
  cube.clear();
  cube.noStroke();
  cube.translate(cube.width/2, cube.height/2);
  cube.rotateX(frameCount/xd);
  cube.rotateY(frameCount/yd);
  cube.box(500);
  cube.endDraw(); 
} 

public void drawMomo(PGraphics cube, float xd, float yd) {
  cube.beginDraw();
  cube.lights();
  cube.clear();
  cube.noStroke();
  cube.translate(cube.width/2, cube.height/2);
  cube.rotateX(frameCount/xd);
  cube.rotateY(frameCount/yd);
  cube.box(500);
  cube.endDraw(); 
} 
  public void settings() {  size(1280, 720, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RobotUprisingVisu" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
