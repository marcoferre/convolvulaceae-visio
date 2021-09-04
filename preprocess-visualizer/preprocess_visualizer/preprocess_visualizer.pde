import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.sound.*;

SoundFile song;

// Frame length
float offset = 2;
color c1;
color c2;
int canvas_x;
int canvas_y;
int i = 0, cc = 0;

JSONArray classes_va;
JSONArray predictions;

PVector pos;

MyPoint p1;
MyPoint p2;
MyAxes a1;
Vehicle v1;

void setup(){
  classes_va = loadJSONArray("../data/classes_va.json");
  predictions = loadJSONArray("../data/predictions.json");

  
  size(1000, 1000);
  background(40, 42, 54);
  smooth();
  
  v1 = new Vehicle(width/2, height/2);
  
  song = new SoundFile(this, "../data/audiofile.wav");
  //song.play();  

  c1 = color(255, 204, 0);
  c2 = color(255, 10, 0);
  
  p1 = new MyPoint(150,300,20, c1);
  p1.plot();
  
  p2 = new MyPoint(400,400,20, c2);
  p2.plot();
  
  a1 = new MyAxes(width,height);
  a1.plot();
  
  pos = new PVector(400, 400);

}


void draw(){
  
    i++;
    cc = i/(60*5);
  
  

  a1.plot();
  
  v1.arrive(pos);
  v1.update();
  v1.display();

  p1.move(offset,offset);
  p1.plot();
  p2.plot();
  
  if(i == 0 || i % (60*5) == 0){
    if(cc <= classes_va.size()){
      
      String[] keys = (String[]) classes_va.getJSONObject(cc).keys().toArray(new String[classes_va.getJSONObject(cc).size()]);

      for(int idx = 0; idx < keys.length; idx++){         
         JSONArray myClass = classes_va.getJSONObject(cc).getJSONArray(keys[idx]);

      }
      
               
      JSONArray myPredictions = predictions.getJSONArray(cc);
      println(myPredictions.getFloat(0) * width/2 + " - " + myPredictions.getFloat(1) * height/2);
      p2.x = width/2 + myPredictions.getFloat(0) * width/2;
      p2.y = height/2 - myPredictions.getFloat(1) * height/2;
      p2.plot();
      
      pos = new PVector(width/2 + myPredictions.getFloat(0) * width/2, height/2 - myPredictions.getFloat(1) * height/2);

    }    
  }
  v1.arrive(pos);
  v1.update();
  v1.display();
}
