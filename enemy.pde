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

  void drawE(){
    if(dead){return;}
    x=int(350*cos(counter))+400;
  y=50;
  ellipse(x, y, 50,30);
  counter=(counter+0.005)%6.28;
  }


  boolean hit(){
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
