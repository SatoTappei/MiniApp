static class Audio{
  static class AudioSingleton{
    static final Audio Instance = new Audio();
  }
  
  AudioPlayer charaTapSE;
  AudioPlayer buttonSE;
  
  Audio(){
    charaTapSE = minim.loadFile("cse.mp3");
    buttonSE = minim.loadFile("bse.mp3");
  }
  
  static Audio getInstance(){
    return AudioSingleton.Instance;
  }
  
  void playCharaTapSE(){
    charaTapSE.rewind();
    charaTapSE.play();
  }
  
  void playButtonSE(){
    buttonSE.rewind();
    buttonSE.play();
  }
  
  void stop(){
    charaTapSE.close();
    buttonSE.close();
  }
}
