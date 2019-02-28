class Bird {
  float size;
  float pos = height * 0.33;
  float posX = width * 0.22;
  float vel = 0;
  float velClick;
  
  Bird(float velClick, float size) {
    this.velClick = velClick;
    this.size = size;
  }
  
  void update() {
    behaviour();
    if (collision()) {
      game.gameOver();
    }
  }
  
  void behaviour() {
    vel += game.gravity;
    pos += vel;
  }
  
  boolean collision() {
    float r = size / 2;
    // with wall
    if (this.pos - r < 0 || this.pos + r > height) {
      return true;
    }
      
    // with pipe
    for (Pipe pipe : game.pipes) {
      float relPosPipe = pipe.getRelativePosition();
      if (relPosPipe < posX + r && relPosPipe + pipe.w > posX - r) {
        if (pos - r < pipe.getUpperBoundary() || pos + r > pipe.getLowerBoundary()) {
          return true;
        }
      }
    }
    
    return false;
  }
  
  void flap() {
    vel = velClick;
  }
  
  void show() {
    noStroke();
    fill(255);
    ellipse(posX, pos, size, size);
  }
}
