Brain brain;
Point point;
int counter=0;
int collisions=0;

float getTarget() {
  float target = 0;
  if (point.Speed.x != 0 && point.Speed.y != 0) {
    target = point.Speed.x*brain.h/point.Speed.y - point.Speed.x*point.Pos.y/point.Speed.y + point.Pos.x - brain.base/2;
    if (target<0) {
      target *= -1;
    } else if (target>width) {
      target = width*2 - target;
    }
  }
  return target;
}
void setup() {
  size(1267, 823);
  brain = new Brain(2);
  point = new Point();
  frameRate(200);
}

void draw() {
  background(255);
  stroke(0);
  if (collisions!=0) {
    text(counter+" balls not caught "+"/ "+collisions+" balls arrived = "+(counter*100/collisions)+"%", width/2, height/10);
  }
  point.update();
  point.edges();
  float[] inputs = {point.Speed.x, point.Speed.y};

  if (point.Speed.y<0) {
    stroke(0);
    //line(point.Pos.x, point.Pos.y, brain.guess(inputs)+brain.base/2, brain.h+5);
    brain.Pos = brain.guess(inputs);
  }
  brain.train(inputs, getTarget());
  brain.show();
  point.show();

  if (point.Pos.y<=brain.h && ! (point.Pos.x>=brain.Pos && point.Pos.x<=brain.Pos+brain.base)) {
    if (point.Pos.y <= 0) {
      point.Speed = point.Speed.mult(0);
      text("You lost!! Click the mouse to continue", width/5, height/10);
    }
  } else if (point.Pos.y<=brain.h && (point.Pos.x>=brain.Pos && point.Pos.x<=brain.Pos+brain.base)) {
    point.Speed.y *=-1;
    collisions++;
  }
}

void mouseClicked() {
  point.Pos.x = point.Pos0.x;
  point.Pos.y = point.Pos0.y;
  point.Speed = new PVector(random(-10, 10), random(-10, 10));
  counter++;
  collisions++;
}
