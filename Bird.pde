class Bird {
  final float initialPos = height * 0.33;
  final float posX = width * 0.22;
  float pos = initialPos;
  float vel = 0;
  float velClick;
  float size;
  boolean alive = true;
  color col;
  
  Bird(float velClick, float size) {
    this.velClick = velClick;
    this.size = size;
    this.col = birdColor;
  }
  
  void update() {
    behaviour();
    if (collision()) {
      die();
    }
  }
  
  void behaviour() {
    vel += game.gravity;
    pos += vel;
  }
  
  boolean collision() {
    float r = size / 2;
    
    // collision with ceiling
    if (this.pos - r < 0) return true;
    
    // collision with ground
    if (this.pos + r > height) {
      handleCollisionWithGround();
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
  
  void handleCollisionWithGround() {
    vel = 0.0;
    game.gameOver();
  }
  
  void flap() {
    if (alive) vel = velClick;
  }
  
  void die() {
    col = birdColorDead;
    alive = false;
  }
  
  void reset() {
    alive = true;
    col = birdColor;
    pos = initialPos;
    vel = 0;
  }
  
  void show() {
    noStroke();
    fill(col);
    ellipse(posX, pos, size, size);
  }
}
