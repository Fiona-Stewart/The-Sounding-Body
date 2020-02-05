
float angle;
float concentration;
float viewOff;

PVector half = new PVector();
PVector mouse = new PVector();

import peasy.*;

import java.io.FileOutputStream;

PeasyCam camera;

PShape H;
float ry;

void setup() {
  size(700, 700, P3D);
  fill(#F05294);

  H = loadShape("Hand.obj");
  H.setFill(color(255, 0, 127, 255));
  H.setSpecular(0xfffff7d5);
  H.setEmissive(0xff3f0000);

  camera = new PeasyCam(this, 0, 0, 0, 50);
  //noLoop();

  angle = QUARTER_PI;
  viewOff = height * .86602;

  half.set(width * .5, height * .5);
}

void draw() {

  //background(#F05294);
  background(0xff000000);

  float dirX = (mouseX/width - 0.5) * 2;
  float dirY = (mouseY/width - 0.5) * 2;

  lightFalloff(1, 0, 0);
  lightSpecular(0, 0, 0);

  //HORIZONTAL LIGHT
  spotLight(0, 127, 255, 
    -half.x, sin(frameCount * .02) * half.y, 0, 
    1, 0, 0, 
    PI, 250);

  //VERTICAL LIGHT
  spotLight(5, 200, 107, 
    cos(frameCount * .05) * half.x, -half.y, 3, 
    0, 1, 1, 
    PI, 25);
    
    // Horizonal light 2
  spotLight(0, 127, 255,
    -half.x, sin(frameCount * .02) * half.y, 0,
    1, 0, 0,
    PI, 25);

  // Vertical light 2
  spotLight(0, 255, 127,
    cos(frameCount * .02) * half.x, -half.y, 0,
    0, 1, 0,
    PI, 25);

  directionalLight(25, 250, 250, -dirX, -dirY, -2);
  ambientLight(25, 250, 250, -dirX, -dirY, 2);

  translate(width/2 - 150, height/2, 0);
  scale(10);
  //fill(#F05294);
  shape(H, 0, 0);
  //H.setFill(color(255, 0, 127, 255));
  // H.setAmbient(#2EFFB4);
  //(0xff7f7f00);
}