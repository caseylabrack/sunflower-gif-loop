float totalFrames = 500;

float angle = 0;
float angleStep = 1.5;
float angleStepStart = 1.5277046;
float radius = 1;
float radiusTotal = 300;
float radiusStep = 1;
float circleSize = 4;
float goldenRatio = 1.61803398875;
float angleStepEnd = 1.5 - .0277046;//1.5277046;//1.56;

void setup () {
  size(400,400);
  colorMode(HSB, 360, 100, 100);
}

void draw () {
  background(0,0,100);

  //if (keyPressed) {
  //  if (key == 'z') {
  //    angleStep += .0001;
  //  } else {
  //    angleStep -= .0001;
  //  }
  //}
  
  if(frameCount <= totalFrames / 2) {
    angleStep = map(frameCount/(totalFrames/2), 0, 1, angleStepStart, angleStepEnd);
  } else {
    angleStep = map((frameCount-totalFrames/2)/(totalFrames - totalFrames/2), 0, 1, angleStepEnd, angleStepStart);  
  }
  
  while(radius < radiusTotal){
    noStroke();
    fill(0, 0, 0);
    ellipse(width/2 + cos(angle * TWO_PI) * radius, height/2 + sin(angle * TWO_PI) * radius, 4, 4);
    angle += angleStep;
    radius += radiusStep;
  }
  
  angle = 0;
  radius = 1;
  
  saveFrame("output/sunflower-######.png");
  if(frameCount==totalFrames) exit();
}
