
//variables globales
int ancla=0;
PImage fondofeto;
PImage fondohermano;
PImage fondopresentacion;
PImage fondonoticia;
PImage fondodesicionuno;
PImage fondonovia;
PImage fondodisparo;
PImage fondomuerto;
PImage fondotestigo;
PImage fondosuicidio;
PImage sangre;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
Box2DProcessing box2d;
Caja una;
ArrayList <Caja> lasCajas;

class Caja{
  
  float x,y,w,h;
  Body b;
  
  Caja(float x_, float y_, float w_, float h_){
    x= x_;
    y = y_;
    w = w_;
    h = h_;
    
    //Implica generar una definición. 
    BodyDef bd = new BodyDef(); 
    // le paso el tipo de cuerpo: DINAMICOS, ESTÁTICOS y KINESTETICOS
    bd.type = BodyType.DYNAMIC;
    Vec2 xyEnBox2 = box2d.coordPixelsToWorld(new Vec2(x,y));
    bd.position.set(xyEnBox2);
    // construir mi cuerpo. 
    b = box2d.createBody(bd);
    
    // Definir el poligono, son los limites del objeto. 
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW,box2dH);
    
    //definir el fixture las propiedas del objeto
    FixtureDef fd = new FixtureDef();
    //pasarle su forma, y establecer sus parametros 
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 0.5;
    
    
    //Agregar el cuerpo al Fixture
    b.createFixture(fd);    
    
    //b.setAngularVelocity(30);
    //b.setLinearVelocity(new Vec2(20,0));
  }
    void display(){
    //modificar la función display para que el objeto se dibuje a partir de los cambios en box2D
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    fill(0,0,0);
    noStroke();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-angulo);
    rect(0,0,w,h);
    popMatrix();
  }  
}
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup(){
  size(800,600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  //una = new Caja(200,200,30,30);
  lasCajas = new ArrayList<Caja>();

  }
  //FONDOS DE PANTALLA
void fondopresentacion ()
{
  size(800,600);
fondopresentacion= loadImage ("fondopresentacion.jpg");
image (fondopresentacion, 0,0);
  box2d.step();
  if (random(1) < 0.1)
  {
    Caja p = new Caja (random(width),0,3,3);
    lasCajas.add(p);
  }
  
    /*lasCajas.add(new Caja(50,0,1,1));
    lasCajas.add(new Caja(90,0,1,1));
    lasCajas.add(new Caja(150,0,1,1));
    lasCajas.add(new Caja(230,0,1,1));
    lasCajas.add(new Caja(300,0,1,1));
    lasCajas.add(new Caja(350,0,1,1));
    lasCajas.add(new Caja(350,0,1,1));*/
  
  for (Caja c:lasCajas){
    c.display();
  }

   
}
void fondonoticia ()
{
  size(800,600);
fondonoticia = loadImage ("fondonoticia.jpg");
image (fondonoticia, 0,0);

   
}

void fondodesicionuno()
{
   size(800,600);
fondodesicionuno = loadImage ("fondodesicionuno.jpg");
image (fondodesicionuno, 0,0);

}

void fondonovia()
{
    size(800,600);
fondonovia = loadImage ("fondonovia.jpg");
image (fondonovia, 0,0);
  
  }
void fondodisparo()
{
  size(800,600);
fondodisparo = loadImage ("fondodisparo.jpg");
image (fondodisparo, 0,0);
   
  }
       void fondomuerto()
{
   size(800,600);
fondomuerto = loadImage ("fondomuerto.jpg");
image (fondomuerto, 0,0);
  
  }



       void fondotestigo()
{
  size(800,600);
fondotestigo = loadImage ("fondotestigo.jpg");
image (fondotestigo, 0,0);
    
  }

           void fondohermano()
{
  size(800,600);
fondohermano = loadImage ("fondohermano.jpg");
image (fondohermano, 0,0);

  }
                void fondosuicidio()
{
  size(800,600);
fondosuicidio = loadImage ("fondosuicidio.jpg");
image (fondosuicidio, 0,0);
  }
              
void draw(){
  //pantalla
  if (ancla==0)
  {
    fondopresentacion();
    
    if(keyPressed && (key=='z'||key=='Z'))
    {
     ancla=1;
    }
  }
  if (ancla==1)
 {
   fondonoticia();
  
  
   if(keyPressed && (key=='x'||key=='X'))
   {
     ancla=2;
   }
 }
 
 if(ancla==2)
 {
   fondodesicionuno();
   
     if(keyPressed && (key=='s'||key=='S'))
     {
       ancla=3;
     }
      if (keyPressed && (key=='n'||key=='N')) 
      {
       ancla=4;
     }
     }
  if(ancla==4)
   {
    fondopresentacion ();
   }
   
   if(ancla==3)
   {
     fondonovia();
     
     if (keyPressed &&(key=='q'||key=='Q'))
       {
            ancla=5;
       }
     }
 
    if (ancla == 5)
    {
      fondodisparo ();
    if(keyPressed && (key=='i'||key=='I'))
     {
       ancla=6;
     }
      if (keyPressed && (key=='l'||key=='L')) 
      {
       ancla=7;
     }
  }
  if (ancla ==7)
  {
    fondomuerto ();
  }
  
  if (ancla == 6)
  {
    
  fondotestigo();
  if(keyPressed && (key=='j'||key=='J'))
     {
       ancla=8;
     }
  }
 
if (ancla ==8)
 {
 fondohermano ();
 if(keyPressed && (key=='y'||key=='Y'))
     {
       ancla=9;
     }
     if(keyPressed && (key=='o'||key=='O'))
     {
       ancla=9;
     }
}
if (ancla == 9)
{
  fondosuicidio ();
}

}