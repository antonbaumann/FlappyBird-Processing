import java.util.Iterator;

class Game {
  
  // game
  private float pos = 0;
  private float vel = 3;
  private float acc = 0.0002;
  private boolean running = true;
  
  // constants
  public final float gravity = 0.2;
  
  // entities
  private Bird bird;
  private ArrayList<Pipe> pipes;
  
  private Score score;
  
  
  public Game() {
    bird = new Bird(-6, 20);
    pipes = new ArrayList(8);
    score = new Score(new PVector(width - 50, 60));
  }
  
  private void restart() {
    bird.reset();
    pipes.clear();
    running = true;
    score.reset();
  }
  
  public void handleKeyPressed() {
    if (key == ' ') bird.flap();
    if (!running && key == 'r') restart();
  }
  
  public void update() {
    if (running) {
      updatePipes();
      bird.update();
      pos += vel;
      vel += acc;
    }
  }
  
  public void updatePipes() {
    if (pipes.size() == 0) pipes.add(new Pipe(pos));
    while (pipes.size() < 8) pipes.add(new Pipe(pipes.get(pipes.size() - 1).pos));
    Iterator<Pipe> i = pipes.iterator();
    while (i.hasNext()) {
     Pipe pipe = i.next();
     if (pipe.pos + pipe.w < pos) {
       i.remove();
       score.update(1);
     }
    }
  }
  
  public void gameOver() {
    running = false;
  }
  
  public void show() {
    background(bgColor);
    for (Pipe pipe : pipes) {
       if (pipe.pos <= pos + width) {
          pipe.show();
       } else break;
    }
    score.show();
    bird.show();
  }
  
}
