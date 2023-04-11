class Fade extends RectDrawer{
  final int FADE_SPEED_MAG = 1000;
  float alpha;
  int state;
  Scene nextScene;
  
  Fade(){
    super(0,0,width,height);
  }
  
  void draw(float deltaTime){
    if(state==0 && alpha>255){
      state = 1;
    }
    else if(state==1 && alpha<0){
      state = 2;
    }
    
    switch(state){
      case 0:
        alpha += deltaTime*1000;
        fill(0,0,0,alpha);
        super.draw();
        break;
      case 1:
        alpha -= deltaTime*1000;
        fill(0,0,0,alpha);
        super.draw();
        break;
      case 2:
        scene = nextScene;
        state = 0;
        break;
    }
  }
}
