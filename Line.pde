class Line{
  final float LINESPEED = 6;
  
  ArrayList<String> lineList;
  String currentLine;
  float timer;
  float lifeTime;
  float delay;
  LineFrame lineFrame;
  
  Line(float d,LineFrame lf){
    delay = d;
    lineList = new ArrayList<String>();
    lineFrame = lf;
    currentLine = "台詞がありません";
  }
  
  void draw(float deltaTime){
    if(timer > lifeTime + delay){
      return;
    }
    
    lineFrame.draw();
    timer += deltaTime * LINESPEED;
    // timerの分だけ文字を表示することで文字のタイプを表現する
    int sub = (int)constrain(timer,1,currentLine.length());
    String str = currentLine.substring(0,sub);
    
    int px = lineFrame.px+10;
    int py = lineFrame.py+30;
    fill(0);
    textAlign(LEFT);
    textSize(17); 
    text(str,px,py);
  }
  
  void add(String line){
    lineList.add(line);
  }
  
  void selectRandom(){
    int r = (int)random(lineList.size());
    currentLine = lineList.get(r);
    lifeTime = currentLine.length();
    // 最初から1文字表示したいので1でリセットする
    timer = 1;
  }
}
