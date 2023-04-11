class LineFrame extends RectDrawer{
  LineFrame(int px,int py,int sx,int sy){
    super(px,py,sx,sy);
  }
  
  @Override
  void draw(){
    float offset = 220;
    noStroke();
    
    fill(0);
    triangle(px-20+offset,py,px+20+offset,py,px+offset+20,py-30);
    rect(px-2,py-2,sx+4,sy+4);
    
    fill(255);
    triangle(px-17+offset,py,px+18+offset,py,px+offset+18,py-26);    
    super.draw();
  }
}
