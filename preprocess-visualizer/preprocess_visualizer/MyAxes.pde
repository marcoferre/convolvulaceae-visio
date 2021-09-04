class MyAxes{
  
  float c_x, c_y;
  
  //Constructor
  public MyAxes(float c_x, float c_y, float size, color c){
    this.c_x = c_x;
    this.c_y = c_y;
  }
  
  // ---- Methods
  public void plot(){
    background(40, 42, 54);
  
    //draw axes
    stroke(68, 71, 90);
    for(int i=10; i<800; i=i+10) {
      line(398, i, 402, i);
      line(i, 398, i, 402);
    }
    line(400, 0, 400, 800);
    line(0, 400, 800, 400);
    
    fill(98, 114, 164);
    textSize(15);
    text("Arousal", 410, 15); 
  
    fill(98, 114, 164);
    textSize(15);
    text("Valence", 740, 390); 
  }
  
}
