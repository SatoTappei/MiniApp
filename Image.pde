class Image{
  PImage img1;
  PImage img2;
  float sizeW;
  float sizeH;
  float offsetX;
  float offsetY;
  int currentIndex;
  
  Image(String name1,String name2,
    float sw,float sh,float ox, float oy){
    img1 = loadImage(name1);
    img2 = loadImage(name2);
    sizeW = sw;
    sizeH = sh;
    offsetX = ox;
    offsetY = oy;
    currentIndex = 0;
  }
  
  void toggle(){
    currentIndex = 1 - currentIndex;
  }
  
  void draw(){
    float x = width/2 - sizeW/2 + offsetX;
    float y = height/2 - sizeH/2 + offsetY;
    
    if(currentIndex == 0){
      image(img1,x,y,sizeW,sizeH);
    }
    else if(currentIndex == 1){
      image(img2,x,y,sizeW,sizeH);
    }
  }
}
