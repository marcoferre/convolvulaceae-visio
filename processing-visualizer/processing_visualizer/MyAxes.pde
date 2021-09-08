class MyAxes{
  
  float c_x, c_y;
  color b1 = color(128, 87, 21);
  color b2 = color(45, 136, 45);
  color b3 = color(43, 73, 112);
  color b4 = color(170, 57, 57);
  float dim = width/4;
  PImage bg = loadImage("bg.gif");
  //Constructor
  public MyAxes(float c_x, float c_y){
    this.c_x = c_x;
    this.c_y = c_y;
  }
  

  // ---- Methods
  public void plot(){

    background(bg);
    
    //fill(b4);
    //rect(0, 0, c_x/2, c_y/2);
    //fill(b1);
    //rect(c_x/2, 0, c_x, c_y/2);
    //fill(b3);
    //rect(0, c_y/2, c_x/2, c_y);
    //fill(b2);
    //rect(c_x/2, c_y/2, c_x, c_y);
  
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
