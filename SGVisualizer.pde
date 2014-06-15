import ddf.minim.analysis.*;
import ddf.minim.*;
import javax.sound.sampled.*;

// Leave this commented to get different results each time the program is run.
// randomSeed(500);
// The width of the window.
private int xSize=1600;
// The height of the window.
private int ySize=900;
// The color of the circles.
color cColor=color(112, 41, 41, 255);
// The color of the circle auras
color cAura=color(255, 239, 62, 75);
// the color of the interconnecting lines.

// The background color.
private color bgColor=color(2, 3, 20, 255);
private color bgColor2=color(112, 41, 41, 255);
// Frames per second
private int fps=80;
// timer
int timerVal = 5000; // delay in miliseconds
int timerEndValue = 6000;

// daynight
int dayEndValue = 10000;
private float maxFourier;
private boolean timer;
private int timerStart;
private int timerEnd;

boolean flashWhite;

private int bugsStart;
private int bugsEnd;

private AudioSystem audioSystem;
private AudioSource audioSource;
private Minim minim;
private Mixer.Info[] mixerInfo;
private Mixer mixer;
private AudioPlayer player;
private Controller controller;
private FFT fft;
private String windowName;
private CircleManager mgmt;
private CircleManager bugs;


void setup() {
  size (xSize, ySize);
  frameRate(fps);
  colorMode(RGB);
  smooth();
  noStroke();

  timer = true;
  timerStart=millis();
  timerEnd=timerEndValue;

  minim = new Minim(this);
  player = minim.loadFile("waveform.wav", 1024);
  player.loop();
  background(bgColor);
  fft=new FFT(player.bufferSize(), player.sampleRate());
  fft.window(FFT.HAMMING);
  mgmt = new CircleManager();
  flashWhite=true;
  maxFourier=0;
}

void draw() {
  float band;
  fill (255, 121, 71, 15);
  rect(0, 0, width, height);
  fill(255);

  // reset the max if it's been a certain amount of time
  if (this.timer && this.millis() - this.timerStart>= this.timerEnd) {
    maxFourier = 0;
    this.timerStart=millis();
    if(flashWhite){
      fill(28, 5, 33, 255);
      flashWhite=false;
    }
    else {
      fill(255, 255, 255, 255);
      flashWhite=true;
    }
    rect(0, 0, width, height);
  }

  fft.forward(player.mix);
  strokeWeight(15);
  stroke(255, 20);
  noFill();
  strokeWeight(1); strokeCap(SQUARE);
  for (int i = 0; i < fft.specSize(); i+=20) {
    if (fft.getBand(i)/2>maxFourier/2) {
      maxFourier=fft.getBand(i)/2;
    }
    if (fft.getBand(i) > 0.99 * maxFourier) {
      stroke(173+fft.specSize(), 245, 78, 158);
      strokeWeight(1); strokeCap(SQUARE);
      mgmt.makeCircle((int)(fft.getBand(i)*100), 30);
    }
    for(int j = 0; j < fft.specSize(); j++)
    {
      line(j, height, j+4, height - fft.getBand(j)*16);
    }
    //println(fft.getBand(i));
    fft.getBand(i);
  }
  fill(255);
  strokeWeight(20); strokeCap(SQUARE);
  stroke(0);
  strokeWeight(1);
  mgmt.render();
  }
  void stop() {
    player.close();
    minim.stop();
    super.stop();
  }

