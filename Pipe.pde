class Pipe {
  
  float pos;
  float gapSize;
  float gapPos;
  float w;
  
  Pipe(float posLastPipe) {
    pos = posLastPipe + random(300, 500);
    gapSize = 100;
    gapPos = random(gapSize, height - gapSize);
    w = 50;
  }
  
  public float getRelativePosition() {
    return this.pos - game.pos;
  }
  
  public float getUpperBoundary() {
    return gapPos - gapSize / 2;
  }
  
  public float getLowerBoundary() {
    return gapPos + gapSize / 2;
  }
  
  void show() {
    rectMode(CORNER);
    fill(pipeColor);
    float relPos = getRelativePosition();
    float halfGapSize = gapSize / 2;
    rect(relPos, 0, w, gapPos - halfGapSize);
    rect(relPos, gapPos + halfGapSize, w, height - gapPos - halfGapSize);
  }
  
}
