//Diego Rojas - Rocio Quiros
import processing.serial.*;
Serial port;
String data;
float dato;
float x;
ArrayList<rectangulo> rects = new ArrayList<rectangulo>();

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
  translate(0, height/2);
  rects.add(new rectangulo(map(dato,0,1023,0,200),x));
  x+=5;
  for (int i = 0; i < rects.size(); i++) {
    rectangulo part = rects.get(i);
    part.dibujar();
  }
  if(rects.size() == 130){
    rects.clear();
    x=0;
  }
}

void serialEvent(Serial port) {
   data = port.readString();
   if(data!= null){
     data = trim(data);
     dato = float(data);
   }
}

class rectangulo{
  float alto = 0, ancho = 5;
  float posX;
  
  rectangulo(float alt, float x){
    alto = alt;
    posX= x;
  }  
  
  void dibujar(){
    fill(dato);
    rect(posX, 0, ancho, alto);
  }
}
