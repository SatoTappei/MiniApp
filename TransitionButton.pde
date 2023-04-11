class TransitionButton extends RectDrawer{
  String label1 = "出かける";
  String label2 = "戻る";
  Fade fade;
  
  TransitionButton(int px,int py,int sx,int sy,Fade f){
    super(px,py,sx,sy);
    fade = f;
  }
  
  @Override
  void draw(){
    fill(0);
    super.draw();
    fill(255);
    rect(px+2,py+2,sx-4,sy-4);
    fill(0);
    rect(px+4,py+4,sx-8,sy-8);
    
    String label = "";
    if(scene == Scene.Home){
      label = label1;
    }
    else if(scene == Scene.Travel){
      label = label2;
    }
    int x = px + sx/2;
    int y = py + sy/2;
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(17); 
    text(label,x,y);
  }
  
  void mouseReleased(float mx,float my){
    if(px<=mx && mx<=px+sx && py<=my && my<=py+sy){
      Audio.getInstance().playButtonSE();
 
    // フェード用のシーンへ遷移
    if(scene == Scene.Home){
      fade.nextScene = Scene.Travel;
    }
    else if(scene == Scene.Travel){
      fade.nextScene = Scene.Home;
    }
      scene = Scene.Fade;
    }
  }
}
