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

    println ("centered_x: ",centered_x , " centered_y: " , centered_y);
    
    radians = atan2(centered_y, centered_x);
    
    theta = radians * 180 / PI;
    println("theta: ", theta);
    
    //normalized radius
    radius = sqrt(sq(centered_x)+sq(centered_y)) / (width/2);
    println("radius:" ,radius);
    
    
    //reset size
    size = 60.0;
    size = size * radius;
    
    //reset sentiment
    sentiment =  "I feel empty..." ;
    
    if (size < 20) {
      size = 20;
    }
    
    //set sentiment
    if (theta >-10 & theta <= 10){
      sentiment = "Pleasant";
    }
    else if (theta >10 & theta <=25){
      sentiment = "Happy";
    }
    else if (theta >25 & theta <= 40){
      sentiment = "Elated";
    }
    else if (theta >40 & theta <= 55){
      sentiment = "Enthusiastic";
    }
    else if (theta >55 & theta <= 70){
      sentiment = "Excited";
    }
    else if (theta >70 & theta <= 85){
      sentiment = "Alert";
    }
    else if (theta >85 & theta <= 105){
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
    else if (theta >165){
      sentiment = "Unpleasant";
    }
    else if (theta >= -180 & theta <= -170 ){
      sentiment = "Unpleasant";
    }
    else if (theta > -170 & theta <= -150){
      sentiment = "Sad";
    }
    else if (theta >-150 & theta <= -135){
      sentiment = "Depressed";
    }
    else if (theta >-135 & theta <= -120){
      sentiment = "Sluggish";
    }
    else if (theta >-120 & theta <= -105){
      sentiment = "Bored";
    }
    else if (theta >-105 & theta <= -85){
      sentiment = "Deactivated";
    }
    else if (theta >-85 & theta <= -60){
      sentiment = "Calm";
    }
    else if (theta >-60 & theta <= -45){
      sentiment = "Relaxed";
    }
    else if (theta >-45 & theta <= -30){
      sentiment = "Serene";
    }
    else if (theta >-30 & theta <= -10){
      sentiment = "Contented";
    }
  } 
}
  
