import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
int height = 800;
int width = 600;
 bar[]  bar= new bar[50];
 float update = 0.1;
DFrame frame2 = new DFrame();

void setup(){
size(height, width);
frameRate(1);
  for(int i=0; i<50; i++){
   bar[i] = new bar((i*11)+(i*2)+100,600,800);
 }
}

void draw(){
  frame2.paint();
    update += 0.02;
  update = update%6.28;
  
  clear();
  float ofst=0;
  println(mouseX+" "+mouseY+"\n");
  for(int i=0;i<50;i++){
   // ofst =sin(TWO_PI/i);
     fill(abs(int(200*sin((update+(i*0.08)%6.28)))));
    bar[i].drawr(int(250*sin((update+(i*0.08)%6.28))));
  //bar[i].drawr(abs(550-mouseY-(500/(i+1))+((mouseX/100)*i)));
  }
if(mousePressed){
  clear();
  fill (255);
rect(height/2, width/2, mouseX, mouseY);

   // frame.setSize(((400+mouseX)%800)+50,((400+mouseY)%600)+50);

}
fill(0);
}
void keyPressed(){

if(key=='r'){
   // frame2.setSize(((mouseX)%400)+50,((mouseY)%400)+50);
fill(245);
  }
}
class bar{
int xloc;
int yloc;
int maxh;
int minh;
int c;
bar(float x, int h, int w){
xloc=floor(x);
yloc=300;
maxh=h;
minh=yloc;
c=0;
}
void drawr(int y){
  //fill(255);
  //yloc=mouseY;
rect(xloc, yloc, 11, -y);
noStroke();
ellipse(xloc+6, -y+yloc, 10, 5);
stroke(0);
//println(yloc+"\n"+xloc+"\n"+y+"\n");
}

}
class DFrame extends JFrame{ 

  DFrame(){super("Visual Config");
   setSize(400,400);
   setVisible(true);
  }
  @Override
  void paint(){
  System.out.print(getWidth()+"  "+getHeight()+"  for the JFrame\n");
  }
  void pressed(){
  
  }
}
