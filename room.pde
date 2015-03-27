class room{
  room(){}

void drawr(){
  //make this into a 4d array where each row is a rect
  rect(200,200,100,30);
  rect(400,200,100,30);
}
boolean inMap(int x, int y){
if(x>200 && x<300 && y>200 && y<230){return true;}
if(x>400 && x<500 && y>200 && y<230){return true;}
return false;
}



}
