class RectDrawer{
  int px;
  int py;
  int sx;
  int sy;
  
  RectDrawer(int px,int py,int sx,int sy){
    this.px = px;
    this.py = py;
    this.sx = sx;
    this.sy = sy;
  }
  
  void draw(){
    rect(px,py,sx,sy);
  }
}
