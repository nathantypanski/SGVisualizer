// Leave this commented to get different results each time the program is run.
// randomSeed(500);
// The width of the window.
private int xSize=600;
// The height of the window.
private int ySize=600;
// The color of the circles.
private color cColor=color(0, 75, 200, 230);
// The background color.
private color bgColor=color(2, 3, 20, 255);
// Frames per second
private int fps=50;
// Text file to load numbers from.
private String numbersFile = new String("numbers.txt");

private CircleManager circles = new CircleManager();
  
void setup() {
  ///////////////////
  // initial setup //
  ///////////////////
  
  size (xSize, ySize);
  frameRate(fps);
  colorMode(RGB);
  smooth();
  noStroke();
  
  background(bgColor);
  
  // draw the earth
  // ellipse(xSize/2, ySize/2, xSize/2, ySize/2);
  
  //////////////////
  // calculations //
  //////////////////
  
  // Load the numbers from the text file
  String textLines[]= loadStrings(numbersFile);
  int[] numbersLines = new int[textLines.length];
  for(int i = 0; i < textLines.length; i++)
    numbersLines[i]=int(textLines[i]);
  
  ///////////////////////
  // Build the circles //
  ///////////////////////
  
  circles.makeCircles(numbersLines);
  println("Made "+numbersLines.length+" circles.");
}

void draw() {
  fill(0, 255);
  rect(0, 0, width, height);
  // draw the earth
  // fill(75, 189, 35, 20);
  //ellipse(xSize/2, ySize/2, xSize/2, ySize/2);
  fill(255);
  
  // Draws an ugly grid in the background.
  /*
  colorMode(HSB);
  stroke(hue(bgColor), saturation(bgColor), brightness(bgColor)*1.5);
  strokeWeight(5);
  for(int i = 0; i < xSize; i+=xSize/20) {
    line(i-random(xSize/50), ySize, i+random(xSize/50), 0);
  }
  for(int i = 0; i < xSize; i+=xSize/20) {
    line(xSize, i-random(xSize/50), 0, i+random(xSize/50));
  }
  colorMode(RGB);
  noStroke();
  */
  
  circles.render();
}
