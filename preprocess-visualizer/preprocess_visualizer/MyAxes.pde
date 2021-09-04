class MyAxes{
  
  float c_x, c_y;
  
  //Constructor
  public MyAxes(float c_x, float c_y){
    this.c_x = c_x;
    this.c_y = c_y;
  }
  
  // ---- Methods
  public void plot(){
    background(40, 42, 54);
  
    //draw axes
    stroke(68, 71, 90);
    for(int i=10; i<c_x; i=i+10) {
      line(c_x/2-2, i, c_x/2+2, i);
      line(i, c_y/2-2, i, c_y/2+2);
    }
    line(c_x/2, 0, c_x/2, c_y);
    line(0, c_y/2, c_x, c_y/2);
    
    fill(98, 114, 164);
    textSize(15);
    text("Arousal", c_x/2 + 10, 15); 
  
    fill(98, 114, 164);
    textSize(15);
    text("Valence", c_x - 60, c_y/2 - 10); 
  }
  
}
