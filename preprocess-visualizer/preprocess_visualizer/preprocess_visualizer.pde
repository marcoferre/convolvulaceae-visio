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
int i = -1, cc = 0;

float vector_x;
float vector_y;

JSONArray classes_va;
JSONArray predictions;

MyPoint p1;
MyPoint p2;
ArrayList<MyPoint> class_p = new ArrayList<MyPoint>();
ArrayList<MyPoint> class_p_old = new ArrayList<MyPoint>();

MyAxes a1;
Vehicle v1;

MySentiment s1;
PFont thonburi;


boolean classOver = false;


void setup(){
  classes_va = loadJSONArray("../data/last_christmas/classes_va.json");
  predictions = loadJSONArray("../data/last_christmas/predictions.json");
  song = new SoundFile(this, "../data/last_christmas/audiofile.wav");
  
  //classes_va = loadJSONArray("../data/bach/classes_va.json");
  //predictions = loadJSONArray("../data/bach/predictions.json");
  //song = new SoundFile(this, "../data/bach/audiofile.wav");
  
  //classes_va = loadJSONArray("../data/bohemian_rhapsody/classes_va.json");
  //predictions = loadJSONArray("../data/bohemian_rhapsody/predictions.json");
  //song = new SoundFile(this, "../data/bohemian_rhapsody/audiofile.wav");
  
  //classes_va = loadJSONArray("../data/fake_plastic_trees/classes_va.json");
  //predictions = loadJSONArray("../data/fake_plastic_trees/predictions.json");
  //song = new SoundFile(this, "../data/fake_plastic_trees/audiofile.wav");
  
  //classes_va = loadJSONArray("../data/bohemian/classes_va.json");
  //predictions = loadJSONArray("../data/bohemian/predictions.json");
  //song = new SoundFile(this, "../data/bohemian/audiofile.wav");
  
  size(1000, 1000, P2D);
  //background(40, 42, 54);
  smooth();
  
  v1 = new Vehicle(width/2, height/2);

  c1 = color(88, 88, 88);
  c2 = color(#2000FA);

  p2 = new MyPoint(400,400,20, c2,"Unknown Class...", c1);
  p2.plot();
  
  a1 = new MyAxes(width,height);
  a1.plot();
  
  vector_x = width/2;
  vector_y = height/2;
  
  song.play();  
  
  s1 = new MySentiment(20, c2, "I feel empty...", 0, 0);
  thonburi = createFont("Thonburi", 24);
  
  //
  //String[] fontList = PFont.list();
  //printArray(fontList);
}

void draw(){
  
  JSONArray myPredictions;
  
  if(song.isPlaying()){
    i++;
    cc = i/(60*5);
  }
  //println(i);

  a1.plot();
  
  if(i == 0 || i % (60*5) == 0){
    
    if(cc < classes_va.size()){
      
      class_p_old.addAll(class_p);
      
      for (int j = class_p.size(); j-- != 0; class_p.remove(j));
      
      String[] keys = (String[]) classes_va.getJSONObject(cc).keys().toArray(new String[classes_va.getJSONObject(cc).size()]); //<>//
      
      
      myPredictions = predictions.getJSONArray(cc);
      p2.x = width/2 + myPredictions.getFloat(0) * width/2;
      p2.y = height/2 - myPredictions.getFloat(1) * height/2;
      
      // find sentiment
      s1.findSentiment(p2.x ,p2.y);
      println("Sentiment: ", s1.sentiment, "\n","-----------------");
      
      colorMode(HSB, 360, 100, 100);
      s1.c = color(s1.theta,s1.radius*100, 25 + s1.radius*100);
      
      for(int idx = 0; idx < keys.length; idx++){      
         JSONArray myClass = classes_va.getJSONObject(cc).getJSONArray(keys[idx]);
         
         MyPoint p = new MyPoint(width/2 + myClass.getFloat(2) * width/2, height/2 - myClass.getFloat(3) * height/2,5, c2, myClass.getString(1), s1.c);
         class_p.add(p); 
      }

      //p2.plot();
      vector_x = width/2 + myPredictions.getFloat(0) * width/2;
      vector_y = height/2 - myPredictions.getFloat(1) * height/2;
      
    colorMode(RGB, 255, 255, 255);
    }    
  }
  

  
  //plot sentiment
  //set color
  colorMode(HSB, 360, 100, 100);
  textFont(thonburi,s1.size);
  fill(s1.theta,s1.radius*100, 25 + s1.radius*100);
  text(s1.sentiment, p2.x, p2.y);
  colorMode(RGB, 255, 255, 255);
 
      
  PVector pos = new PVector(vector_x, vector_y);
  
  for (MyPoint point : class_p_old) {    
    point.c = c1;
    point.plot();
    colorMode(HSB, 360, 100, 100);
    update(mouseX, mouseY, int(point.x), int(point.y));
    if (classOver) {
      fill(point.classColor);
      textSize(15);
      text(point.className, point.x+5,point.y+5);
    } 
    colorMode(RGB, 255, 255, 255);
  }
  
  for (MyPoint point : class_p) {    
    point.plot();
    colorMode(HSB, 360, 100, 100);
    update(mouseX, mouseY, int(point.x), int(point.y));
    if (classOver) {
      fill(point.classColor);
      textSize(15);
      text(point.className, point.x+5,point.y+5);
    } 
    colorMode(RGB, 255, 255, 255);
  }
  
  v1.arrive(pos);
  v1.update();
  v1.display();
  
  

  
}

boolean overClass(int x, int y, int width, int height) {
  if (mouseX >= x-width && mouseX <= x+width && 
      mouseY >= y-height && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


void update(int x, int y, int point_x, int point_y) {
  if( overClass(point_x, point_y, 5 , 5) ) {
    classOver = true;
  } 
  else{
    classOver = false;
  }
}
