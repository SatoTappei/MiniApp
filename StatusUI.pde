class StatusUI extends RectDrawer{
  static final int SIZE_X = 190;
  static final int SIZE_Y = 250;
  final int CONDITION_MAX = 50;
  String name;
  int trust = 0;
  String[] conditions = {"健康","疲労","もうだめぽ"};
  float conditionValue;
  
  StatusUI(int px,int py,String n){
    super(px,py,SIZE_X,SIZE_Y);
    name = n;
  }
  
  @Override
  void draw(){
    fill(0);
    super.draw();
    fill(255);
    rect(px+2,py+2,sx-4,sy-4);

    // 余白分
    int lx = px+10;
    int rx = px+sx-10;

    // 各種ステータス
    int namePosY = py+30;
    int trustPosY = py+80;
    int condPosY = py+110;
    int vlPosX = px+80;
    fill(0);
    textAlign(LEFT);
    textSize(17); 
    text(name,lx,namePosY);
    text("信頼度:",lx,trustPosY);
    text("状   態:",lx,condPosY);
    text(trust,vlPosX,trustPosY);
    text(conditions[calcConditionIndex()],vlPosX,condPosY);
    
    // アンダーラインの表示
    stroke(0);
    strokeWeight(1);
    line(lx,namePosY+5,rx,namePosY+5);
    line(lx,trustPosY+5,rx,trustPosY+5);
    line(lx,condPosY+5,rx,condPosY+5);
    noStroke();
  }
  
  void decreaseCondition(float deltaTime){
    conditionValue -= deltaTime;
  }
  
  void statusUp(){
    trust++;
    conditionValue++;
    constrain(conditionValue,0,CONDITION_MAX);
  }
  
  int calcConditionIndex(){
    if(conditionValue > 30){
      return 2;
    }
    else if(conditionValue > 15){
      return 1;
    }
    else{
      return 0;
    }
  }
}
