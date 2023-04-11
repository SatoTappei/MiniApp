import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

enum Scene{
  Home,
  Travel,
  Fade,
}

final float DELTA_TIME = 0.016;

// 一旦ここに置いておく、グローバル変数なので別のクラスに移すこと
Scene scene = Scene.Home;

static Minim minim;
Image image;
TapArea tapArea;
LineFrame lineFrame;
Line line;
TransitionButton transitionButton;
TravelScene travelScene;
StatusUI statusUI;
Particle particle;
Fade fade;

void setup(){
  PFont font = createFont("Meiryo",50);
  textFont(font);
  size(600,600);
  minim = new Minim(this);
  
  image = new Image("maid5.jpg","maid6.jpg",458,787,100,150);
  lineFrame = new LineFrame(30,330,250,100);
  line = new Line(10,lineFrame);
  line.add("こんにちわぁ～");
  line.add("らんらん♪");
  line.add("おはようございました！");
  line.selectRandom();
  fade = new Fade();
  statusUI = new StatusUI(10,10,"めいどちゃん");
  tapArea = new TapArea(width/2-100,height/2-180,300,500,image,line,statusUI);
  transitionButton = new TransitionButton(480,10,100,60,fade);
  travelScene = new TravelScene(0,height/2-75,width,150);
  particle = new Particle();
}

// フェードの処理がおかしい
// フェードする際は背後のオブジェクトが消えてはいけないはず
// 背後のオブジェクトを残したままフェードする必要がある

void draw(){
  background(255);
  
  if(scene == Scene.Home){
    image.draw();
    line.draw(DELTA_TIME);
    statusUI.draw();
    statusUI.decreaseCondition(DELTA_TIME);
  }
  else if(scene == Scene.Travel){
    travelScene.draw();
  }
  else if(scene == Scene.Fade){
    fade.draw(DELTA_TIME);
  }
  
  //tapArea.draw();
  if(scene == Scene.Home || scene == Scene.Travel){
    transitionButton.draw();
    particle.draw(DELTA_TIME);
  }

}

void mouseReleased(){
  if(scene == Scene.Home){
    tapArea.mouseReleased(mouseX,mouseY);
  }
  
  if(scene == Scene.Home || scene == Scene.Travel){
    transitionButton.mouseReleased(mouseX,mouseY);
    particle.mouseReleased(mouseX,mouseY);
  }
}

void stop(){
  Audio.getInstance().stop();
  minim.stop();
  super.stop();
}
