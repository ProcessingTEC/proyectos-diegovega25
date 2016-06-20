//Tomas de Camino Beck

import processing.serial.*;
Serial port;
String data;
float[] val = new float[2];
float x,y;

void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "COM6", 9600);
  port.bufferUntil('\n');  //clear the buffer
  size(600, 600);
  background(255);
  
   
  
}

void draw() {
   
  background(255);
  fill(150,255,150);
translate(0, height/2);
  rect(0, 0, map(val[0],0,1023,0,200), map(val[1],0,1023,0,200));
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  x=val[0];
  y=val[1];
  val[0]=float(list[0]);
  val[1]=float(list[1]);
}