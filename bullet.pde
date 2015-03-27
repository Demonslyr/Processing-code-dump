class bullet{
  
  int x,y,cury,curx;
  boolean dead;
bullet(){
dead =true;
x=0;
y=0;
}
boolean hitE(int bx, int by){
if(x<bx+25 &&x>bx-25 && y>by-30 && y<by){
  curx=x;
  cury=y;
  x=0;
  y=0;
dead=true;
return true;}
return false;}
boolean hit(){//print("Bullet x "+x+" Y "+y+"\n");
  
  if (/*x>200 && x<300 && y>200 && y<230*/room1.inMap(x,y)){
  curx=x;
  cury=y;
  x=0;
  y=0;
  dead =true;
  return true;}
return false;}
int getX(){return curx;}
int getY(){return cury;}
void drawb(){
    if(y<0){dead=true;
      return;}
    if (dead){//print(dead);
    return;}
    else{ellipse(x,y,4,4);
    y-=10;}
}
void makeAlive(){
x=mouseX+15;
y=555;
dead=false;
}
}
