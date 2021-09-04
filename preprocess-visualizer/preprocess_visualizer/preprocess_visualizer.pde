float offset = 2;
color c1;
color c2;

MyPoint p1;
MyAxes a1;

void setup(){
  size(800,800);
  background(40, 42, 54);
  
  c1 = color(255, 204, 0);
  c2 = color(255, 10, 0);
  p1 = new MyPoint(150,300,20, c2);
  p1.plot();
  a1 = new MyAxes(800,800);

}


void draw(){ 


  p1.move(offset,offset);
  p1.plot();
}
