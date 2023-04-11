class TapArea extends RectDrawer{
  Image image;
  Line line;
  StatusUI statusUI;
  
  TapArea(int px,int py,int sx,int sy,Image img,Line l,StatusUI ui){
    super(px,py,sx,sy);
    image = img;
    line = l;
    statusUI = ui;
  }
  
  void mouseReleased(float mx,float my){
    if(px<=mx && mx<=px+sx && py<=my && my<=py+sy){
      image.toggle();
      line.selectRandom();
      statusUI.statusUp();
      Audio.getInstance().playCharaTapSE();
    }
  }
}
