class splosion{
int r,x,y;
boolean dead;
  splosion(){
  r=1;
  x=0;
  y=0;
  dead=true;}
  void draws(){
    fill(250);
  ellipse(400,400,20,20);
  }
  void makeAlive(int xin, int yin){
  x=xin;
  y=yin;
  r=0;
  dead=false;
  }
 void drawd(){
    r+=8;
    fill(250);
    if(r>800){dead=true;}
    if(dead){return;}
    else{
      //print("not dead");

      for(float i=0; i<6.2831; i+=0.7854){
              //print(x+ r*(cos(i)) +" "+y+(r*(sin(i)))+" "+i+"\n");
        ellipse((x+ int(r*(cos(i)))),y+int((r*(sin(i)))), 10,10);
      }
    }
  }
}
