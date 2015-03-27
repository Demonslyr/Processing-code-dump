player player1;
room room1;
PFont f;
enemy enemy1;
splosion[] splosion = new splosion [50];
int counter, drawgo;
boolean fire=false;


void setup(){
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  frameRate(100);
  counter=0;
  drawgo=0;
size(800,600);
background(0);
for(int i=0; i<50; i++){
  splosion[i] = new splosion();
  }
  player1 = new player();
  room1 = new room();
  enemy1 = new enemy();
}
void draw(){
 drawgo=(drawgo+1)%2;
  clear();
  for (int i=0;i<50;i++){
splosion [i].drawd();
  }
 // if(drawgo==1){
  player1.drawp();
  room1.drawr();
  enemy1.drawE();
//}
//check the math on the call below
//I call enemy hit 190 times and in each enemy hit I check every bullet that hit...
//I may only need to call it once form here a 190 times inside
  for (int i=0;i<190;i++){
    if(enemy1.hit()){
    player1.score();

    }
  if(player1.bullet[i].hit()){
      splosion[counter].makeAlive(player1.bullet[i].getX(),player1.bullet[i].getY());
      counter=(counter+1)%50;
    }
  }
  player1.sdraw();
  if (fire==true && drawgo==1){
  player1.fire();
   }
    
}

void mousePressed(){
  fire=true;
  //player1.fire();
}
void mouseReleased(){
 fire=false;
}

void mouseDragged(){
  //splosion[counter].makeAlive(mouseX,mouseY);
  //counter=(counter+1)%50;
}


