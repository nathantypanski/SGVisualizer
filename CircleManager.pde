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
    // Draw lines connecting the circles.
    stroke(red(circles.get(0).getColor()), green(circles.get(0).getColor()), blue(circles.get(0).getColor()),
             alpha(circles.get(0).getColor()));
    for(int i = 0; i < circles.size()/2; i++) {
      for(int j = 0; j < circles.size(); j++) {
        line(circles.get(i).getX(), circles.get(i).getY(), circles.get(j).getX(), circles.get(j).getY());
      }
    }
    
    for(Circle c : circles) {
      c.render();
    }
  }
}
