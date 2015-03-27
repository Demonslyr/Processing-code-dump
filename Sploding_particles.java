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

public class Sploding_particles extends PApplet {

player player1;
room room1;
PFont f;
enemy enemy1;
splosion[] splosion = new splosion [50];
int counter, drawgo;
boolean fire=false;


public void setup(){
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
public void draw(){
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

public void mousePressed(){
  fire=true;
  //player1.fire();
}
public void mouseReleased(){
 fire=false;
}

public void mouseDragged(){
  //splosion[counter].makeAlive(mouseX,mouseY);
  //counter=(counter+1)%50;
}


class bullet{
  
  int x,y,cury,curx;
  boolean dead;
bullet(){
dead =true;
x=0;
y=0;
}
public boolean hitE(int bx, int by){
if(x<bx+25 &&x>bx-25 && y>by-30 && y<by){
  curx=x;
  cury=y;
  x=0;
  y=0;
dead=true;
return true;}
return false;}
public boolean hit(){//print("Bullet x "+x+" Y "+y+"\n");
  
  if (/*x>200 && x<300 && y>200 && y<230*/room1.inMap(x,y)){
  curx=x;
  cury=y;
  x=0;
  y=0;
  dead =true;
  return true;}
return false;}
public int getX(){return curx;}
public int getY(){return cury;}
public void drawb(){
    if(y<0){dead=true;
      return;}
    if (dead){//print(dead);
    return;}
    else{ellipse(x,y,4,4);
    y-=10;}
}
public void makeAlive(){
x=mouseX+15;
y=555;
dead=false;
}
}
class enemy{
boolean dead;
//I should pull the position counter out of enemy and jsut pass it into drawE
float counter;
int x,y;


  enemy(){
    x=0;
    y=0;
  dead=false;
  counter=0;
  }

  public void drawE(){
    if(dead){return;}
    x=PApplet.parseInt(350*cos(counter))+400;
  y=50;
  ellipse(x, y, 50,30);
  counter=(counter+0.005f)%6.28f;
  }


  public boolean hit(){
    if (dead){return false;}
    for(int i=0;i<190;i++){
   
      if(player1.bullet[i].hitE(x,y)){
        //HARDCODED TO NOT DIE 
        //change dead=true
        //return dead;
      dead=false;
      return true;
  //I am hit
      }
    }
return false;

  }  
}
class player{
  int counter;
  int score;
  int NUM_BULLETS=190;
bullet[] bullet =new bullet [NUM_BULLETS];
  player(){
    counter=0;
  for(int i=0;i<NUM_BULLETS;i++){
  bullet[i]=new bullet();
  }
}
  public void drawp(){
    for(int i=0;i<NUM_BULLETS;i++){
    bullet[i].drawb();}
  rect(mouseX, 550,30,20);
  }
  public void score(){score++;}
  public void sdraw(){
  textFont(f,36);
  fill(128);                        // STEP 5 Specify font color 
  text("Score: "+score,10,100);
  }
  public void fire(){
  bullet[counter].makeAlive();
  counter=(counter+1)%NUM_BULLETS;
  }
 /* boolean hit (){
  for(int i=0;i<50;i++){
    bullet[i].hit();
  }
  return false;
  }
  int getHitX(){
  return 0;}
  int getHitY(){
  return 0;}
*/
}

class room{
  room(){}

public void drawr(){
  //make this into a 4d array where each row is a rect
  rect(200,200,100,30);
  rect(400,200,100,30);
}
public boolean inMap(int x, int y){
if(x>200 && x<300 && y>200 && y<230){return true;}
if(x>400 && x<500 && y>200 && y<230){return true;}
return false;
}



}
class splosion{
int r,x,y;
boolean dead;
  splosion(){
  r=1;
  x=0;
  y=0;
  dead=true;}
  public void draws(){
    fill(250);
  ellipse(400,400,20,20);
  }
  public void makeAlive(int xin, int yin){
  x=xin;
  y=yin;
  r=0;
  dead=false;
  }
 public void drawd(){
    r+=8;
    fill(250);
    if(r>800){dead=true;}
    if(dead){return;}
    else{
      //print("not dead");

      for(float i=0; i<6.2831f; i+=0.7854f){
              //print(x+ r*(cos(i)) +" "+y+(r*(sin(i)))+" "+i+"\n");
        ellipse((x+ PApplet.parseInt(r*(cos(i)))),y+PApplet.parseInt((r*(sin(i)))), 10,10);
      }
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Sploding_particles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
