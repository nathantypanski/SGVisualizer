class CircleManager {
  private ArrayList<Circle> circles = new ArrayList();
  private boolean timer;
  private int timerStart;
  private int timerEnd;
  private boolean connected;

  public CircleManager(int time) {
    timer = true;
    timerEnd=time;
    timerStart=millis();
    connected= true;
  }
  
  public CircleManager(boolean connect) {
    connect=connected;
  }

  public CircleManager() {
    timer = false;
    connected = true;
  }

  /////////
  // set //
  /////////

  public void makeCircle(int lifespan) {
    //circles.add(new Circle(norm(number, 0, 10), cColor, circles, xSize, ySize, number));
    circles.add(new Circle(3, cColor, lifespan));
  }
  public void makeCircle(int lifespan, int cRadius) {
    //circles.add(new Circle(norm(number, 0, 10), cColor, circles, xSize, ySize, number));
    circles.add(new Circle(cRadius, cColor, lifespan));
  }

  public void makeCircles(int[] numbers) {
    // sort numbersLines from largest number to smallest
    numbers=sort(numbers);
    for (int i : numbers)
      println(i);
    // Calculate the range of numbers in numbersFile.
    int maxSize = max(numbers);
    int minSize = min(numbers);
    for (int i = 0; i < numbers.length; i++) {
      //print("Making a circle ... ");
      circles.add(new Circle(norm(numbers[i], 0, 10), cColor, numbers[i]));
      //println(" ... Success!");
    }
  }

  //////////
  // draw //
  /////////
  public void render() {
    if (timer && millis() - timerStart>= timerEnd) {
      mgmt.makeCircle(10);
      timerStart=millis();
    }
    for (int i=0; i < circles.size(); i++) {
      if (circles.get(i).killed()) {
        circles.remove(i);
      }
    }
    if (!circles.isEmpty()) {
      if (this.connected) {
        // Draw lines connecting the circles.
        stroke(red(circles.get(0).getColor()), green(circles.get(0).getColor()), blue(circles.get(0).getColor()), 
        alpha(circles.get(0).getColor())/2);
        for (int i = 0; i < circles.size()/2; i++) {
          for (int j = 0; j < circles.size(); j++) {
           if (fft.getBand(i)> 0.3*maxFourier) { // alters circle generation
            stroke(173, 245, 78, 158);
              line(circles.get(i).getX(), circles.get(i).getY(), circles.get(j).getX(), circles.get(j).getY());
            }
          }
        }
      }

      for (Circle c : circles) {
        c.render();
      }
    }
  }
}

