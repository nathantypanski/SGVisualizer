// Leave this commented to get different results each time the program is run.
// randomSeed(500);
// The width of the window.
int xSize=500;
// The height of the window.
int ySize=500;
// The color of the circles.
color cColor=color(0, 75, 200, 230);
// The background color.
color bgColor=color(2, 3, 20);
// Frames per second
int fps=10;
// Text file to load numbers from.
String numbersFile = new String("numbers.txt");

private ArrayList<Circle> circles = new ArrayList();
  
void setup() {
  size (xSize, ySize);
  frameRate(10);
  smooth();
  noStroke();
  
  //////////////////
  // calculations //
  //////////////////
  
  // Load the numbers from the text file
  String textLines[]= loadStrings(numbersFile);
  int[] numbersLines = new int[textLines.length];
  for(int i = 0; i < textLines.length; i++)
    numbersLines[i]=int(textLines[i]);
  // sort numbersLines from largest number to smallest
  numbersLines=sort(numbersLines);
  for(int i : numbersLines)
    println(i);
  // Calculate the range of numbers in numbersFile.
  int maxSize = max(numbersLines);
  int minSize = min(numbersLines);
  
  ///////////////////////
  // Build the circles //
  ///////////////////////
  
  for(int i = 0; i < numbersLines.length; i++) {
    print("Making a circle ... ");
    circles.add(new Circle(norm(numbersLines[i], minSize, maxSize), cColor, circles, xSize, ySize));
    println(" ... success!");
  }
  println("Made "+numbersLines.length+" circles.");
}
void draw() {
  background(bgColor);
  fill(75, 189, 35, 255);
  ellipse(xSize/2, ySize/2, xSize/2, ySize/2);
  for(Circle c : circles) {
    c.render();
  }
}
