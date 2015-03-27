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
  void drawp(){
    for(int i=0;i<NUM_BULLETS;i++){
    bullet[i].drawb();}
  rect(mouseX, 550,30,20);
  }
  void score(){score++;}
  void sdraw(){
  textFont(f,36);
  fill(128);                        // STEP 5 Specify font color 
  text("Score: "+score,10,100);
  }
  void fire(){
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

