class MySentiment{
  
  float radius,theta;
  float size; 
  color c;
  String sentiment;
  //Constructor
  public MySentiment(float size, color c, String sentiment,float radius, float theta){
    this.size = size;
    this.c = c;
    this.radius = radius;
    this.theta = theta;
    this.sentiment = sentiment;
  }
  
  public void findSentiment(float x , float y){
    float radians;
    
    float centered_y = height/2 - y;
    float centered_x = x - width/2 ;
    
    print(centered_x + " : " + centered_y + "\n");
    
    radians = atan(centered_y/centered_x);
    
    if(centered_x < 0 && centered_y < 0){
      radians = radians + PI;
    }
    
    theta = radians * 180 / PI;
    print("theta: ", theta, "\n");
    //normalized radius
    radius = sqrt(sq(centered_x)+sq(centered_y)) / (width/2);
    print("radius:" ,radius, "\n");
    //normalized radius
    
    //reset size
    size = 60.0;
    size = size * radius;
    
    if (size < 20) {
      size = 20;
    }
    
    //set sentiment
    if (theta >=-13 & theta <= 13){
      sentiment = "Pleasant";
    }
    else if (theta >13 & theta <= 26){
      sentiment = "Happy";
    }
    else if (theta >26 & theta <= 39){
      sentiment = "Elated";
    }
    else if (theta >39 & theta <= 52){
      sentiment = "Enthusiastic";
    }
    else if (theta >52 & theta <= 65){
      sentiment = "Excited";
    }
    else if (theta >65 & theta <= 78){
      sentiment = "Alert";
    }
    else if (theta >78 & theta <= 105){
      sentiment = "Activated";
    }
    else if (theta >105 & theta <= 120){
      sentiment = "Tense";
    }
    else if (theta >120 & theta <= 135){
      sentiment = "Nervous";
    }
    else if (theta >135 & theta <= 150){
      sentiment = "Stressed";
    }
    else if (theta >150 & theta <= 165){
      sentiment = "Upset";
    }
    else if (theta >165  & theta <= 195){
      sentiment = "Unpleasant";
    }
    else if (theta >195 & theta <= 210){
      sentiment = "Sad";
    }
    else if (theta >210 & theta <= 225){
      sentiment = "Depressed";
    }
    else if (theta >225 & theta <= 240){
      sentiment = "Sluggish";
    }
    else if (theta >240 & theta <= 255){
      sentiment = "Bored";
    }
    else if (theta >255 & theta <= 285){
      sentiment = "Deactivated";
    }
    else if (theta >285 & theta <= 300){
      sentiment = "Calm";
    }
    else if (theta >300 & theta <= 315){
      sentiment = "Relaxed";
    }
    else if (theta >315 & theta <= 330){
      sentiment = "Serene";
    }
    else if (theta >330 & theta <= 345){
      sentiment = "Contented";
    }
    else if (theta >345 & theta <= 360){
      sentiment = "Pleasant";
    }
  } 
}
  
