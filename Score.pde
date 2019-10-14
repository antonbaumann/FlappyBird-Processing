class Score {
  PFont font;
  PVector pos;
  int score;
  color col;
  
  Score(PVector pos) {
    font = loadFont("font.vlw");
    this.pos = pos;
    col = color(0, 255, 0);
    score = 0;
  }
  
  void update(int n) {
    score += n;
  }
  
  void reset() {
    score = 0;
  }
  
  void show() {
    textFont(font);
    fill(col);
    textSize(64); 
    textAlign(CENTER);
    text(score, pos.x, pos.y);
  }
}
