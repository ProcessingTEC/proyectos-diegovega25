//Diego Rojas - Rocio 
import controlP5.*;
ControlP5 cp5;
int colores = 0;
PFont font;
float ancho = 5;
BufferedReader reader;
String line;
float dato, x, posX;
ArrayList<rectangulo> rects = new ArrayList<rectangulo>();
int R=1;//6371;//radio de la tierra en km
float angle;

void setup() {
  // Open the file from the createWriter() example
  reader = createReader("Qdata.txt"); 
  size(1024, 600); 
  font = loadFont("Algerian-48.vlw");
  background(255);
  smooth(8);
  line = getLine(reader);
  while(line!=null) {
    String[] pieces = split(line, ',');
    float x = float(pieces[0]);
    float y = float(pieces[1]);
    float speed =float(pieces[2]);
    float air= float(pieces[3]);
    dato=random(air);
    rects.add(new rectangulo(posX, x,y,speed,air));
    posX+=ancho;
    if(rects.size() == 130){
      //rects.clear();
      posX=0;
    }
    line = getLine(reader);
  }
  angle=rects.size();
  cp5 = new ControlP5(this);
  cp5.addSlider("ancho")
    .setPosition(10, 10)
    .setRange(1, 5)
    .setValue(2)
    ;
   //fill(colores);
}

void draw() {
  funcion1();
  //funcion2();
} 

void funcion1(){
  pushMatrix();
  background(255);
  translate(0, height/2);
  frameRate(5);
  strokeWeight(1);
  //float offset= map(mouseX, 0, width, 0, PI);
  for (int i = 0; i < rects.size(); i++) {
     /*pushMatrix();
    translate(width/2, height/2);
    rotate(angle*i+offset);*/
    
      rects.get(i).dibujar();
   
      // popMatrix();
    }
    //noLoop();
  popMatrix();
}
void funcion2(){
  //pushMatrix();
  //background(255);
  //translate(0, height/2);
  frameRate(30);
  strokeWeight(1);
  float offset= map(mouseX, 0, width, 0, PI);
  for (int i = 0; i < rects.size(); i++) {
     pushMatrix();
    translate(width/2, height/2);
    rotate(angle*i+offset);
    
      rects.get(i).dibujar();
   
       popMatrix();
    }
   //noLoop();
  //popMatrix();
}
//get each file line
String getLine(BufferedReader r){
  String l;
  try {
   l = r.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    l = null;
  } 
  return l;
}
class rectangulo{
  float alto, x, y, speed, air, posX;
  
  rectangulo(float posX,float x, float y,float speed, float air){
    this.x= x;
    this.y = y;
    this.speed = speed;
    this.air = air;
    this.posX = posX;
  }  
  void dibujar(){
    alto = random(map(air,0,air,0,speed));
    //alto=speed;
    fill(random(255), random(255),random(255));
    rect(posX, 0, ancho, -alto);
  }
}