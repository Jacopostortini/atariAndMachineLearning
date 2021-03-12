float activationFunction(float  sum) {
  float s = sum/100;
  if (s<0) {
    s *= -1;
  } else if (s>width) {
    s = width*2 - s;
  }
  return -s;
}

class Brain {

  float h = height/8;
  float Pos;
  float[] Weights;
  float lr = 1.5;
  float base = 60;

  Brain(int n) {
    Pos = random(0, width);
    Weights = new float[n];
    for (int i = 0; i<Weights.length; i++) {
      Weights[i]  = random(-1, 1);
    }
  }

  void show() {
    fill(0, 0, 255);
    noStroke();
    rect(Pos, h, base, 10);
  }

  float guess(float[] inputs) {
    float sum = 0;
    for (int i = 0; i<Weights.length; i++) {
      sum += Weights[i]*inputs[i];
    }

    return activationFunction(sum);
  }

  void train(float[] inputs, float target) {
    float error = target-guess(inputs);
    //println("Guess "+guess(inputs));
    //println("Target: "+target);
    println("Error: "+error);
    for (int i = 0; i<Weights.length; i++) {
      Weights[i] += error * inputs[i] * lr;
    }
  }
}
