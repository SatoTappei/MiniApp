class TravelScene extends RectDrawer{
  TravelScene(int px,int py,int sx,int sy){
    super(px,py,sx,sy);
  }
  
  void draw(){
    fill(0);
    super.draw();
    fill(255);
    rect(px,py+2,sx,sy-4);
    fill(0);
    rect(px,py+4,sx,sy-8);
    
    int x = px + sx/2;
    int y = py + sy/2;
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(30); 
    text("外出禁止！",x,y);
  }
}
