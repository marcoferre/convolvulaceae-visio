class MyPoint{
  
  float x,y;
  float size; 
  color c, classColor;
  String className;
  
  //Constructor
  public MyPoint(float x, float y, float size, color c, String className, color classColor ){
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
    this.className = className;
    this.classColor = classColor;
  }
  
  // ---- Methods
  public void plot(){
    noStroke();
    fill(c);
    circle(x, y, size);
  }
  
  public void move(float xoff, float yoff){
    x = x+xoff; 
    y = y+yoff;
  } 
}
