class Particle{
  final int UNUSED = -999;
  final int MAX = 20;
  final int AT_ONCE = 2;
  final float LIFETIME = 1.0;
  final float GA = 0.64;
  final float VERT_VELO = 7.0f;
  final float HORI_VELO_MIN = -3.5;
  final float HORI_VELO_MAX = -5.0;
  final float SIZE_MIN = 25;
  final float SIZE_MAX = 30;
  final PVector COLOR_1 = new PVector(255,70,120);
  final PVector COLOR_2 = new PVector(255,120,140);
  
  class ParticleFragment{
    float px;
    float py;
    float lt;
    float vx;
    float vy;
  }
  
  ParticleFragment[] pfs = new ParticleFragment[MAX];
  
  Particle(){
    for(int i=0;i<MAX;i++){
      pfs[i] = new ParticleFragment();
      pfs[i].px = UNUSED;
      pfs[i].py = UNUSED;
    }
  }
  
  void draw(float deltaTime){
    for(int i=0;i<MAX;i++){
      pfs[i].lt -= deltaTime;
      if(pfs[i].lt<0){
        pfs[i].px = UNUSED;
        pfs[i].py = UNUSED;
      }
      
      // xとyは同時に更新するのでxだけ未使用か調べれば十分
      if(pfs[i].px == UNUSED){
        continue;
      }
      
      pfs[i].px += pfs[i].vx;
      pfs[i].py += pfs[i].vy;
      
      pfs[i].vy += GA;
      
      float cr = random(COLOR_1.x,COLOR_2.x);
      float cg = random(COLOR_1.y,COLOR_2.y);
      float cb = random(COLOR_1.z,COLOR_2.z);
      fill(cr,cg,cb);
      textAlign(CENTER,CENTER);
      textSize(random(SIZE_MIN,SIZE_MAX)); 
      text("♥",pfs[i].px,pfs[i].py);
    }
  }
  
  int getUnusedIndex(){
    for(int i=0;i<MAX;i++){
      // xとyは同時に更新するのでxだけ未使用か調べれば十分
      if(pfs[i].px == UNUSED){
        return i;
      }
    }
    return -1;
  }
  
  void mouseReleased(float mx,float my){
    for(int i=0;i<AT_ONCE;i++){
      int index = getUnusedIndex();
      if(index == -1){
        return;
      }
      
      pfs[index].px = mx;
      pfs[index].py = my;
      pfs[index].lt = LIFETIME;
      pfs[index].vx = random(-VERT_VELO,VERT_VELO);
      pfs[index].vy = random(HORI_VELO_MIN,HORI_VELO_MAX);
    }
  }
}
