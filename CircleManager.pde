class CircleManager {
  private ArrayList<Circle> circles = new ArrayList();
  
  public CircleManager() {
   
  }
  
  /////////
  // set //
  /////////
  
  /////////
  // set //
  /////////
  
  public void makeCircles(int[] numbers) {
    // sort numbersLines from largest number to smallest
    numbers=sort(numbers);
    for(int i : numbers)
      println(i);
    // Calculate the range of numbers in numbersFile.
    int maxSize = max(numbers);
    int minSize = min(numbers);
    for(int i = 0; i < numbers.length; i++) {
      print("Making a circle ... ");
      circles.add(new Circle(norm(numbers[i], 0, maxSize), cColor, circles, xSize, ySize));
      println(" ... Success!");
    }
  }
  
  //////////
  // draw //
  //////////
  public void render() {
    // Draw lines connecting the circles. REALLY terrible algorithm used here.
    for(Circle c : circles) {
      stroke(red(c.getColor()), green(c.getColor()), blue(c.getColor()),
             alpha(c.getColor())/2);
      for(Circle k : circles) {
        line(c.getX(), c.getY(), k.getX(), k.getY());
      }
    }
    
    for(Circle c : circles) {
      c.render();
    }
  }
}
