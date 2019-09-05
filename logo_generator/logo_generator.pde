SpinningSquare square;
SpinningSquare square2;
int fillColor = 200;
boolean upwards = true;
float c = 0;
int aha = 0;

void setup(){
  size(500,500);
  rectMode(CENTER);
  square2 = new SpinningSquare();
  square = new SpinningSquare(0);
  noStroke();
  background(0);
}

void draw(){
  if(aha%238==0){
    background(fillColor);
  }
  setFillColor();
  fill(fillColor);
  square.show(c);
  c += 0.01;
  aha++;
}

int pingPongFill(){
  return 0;
}

void darken(){
  fillColor--;
}

void lighten(){
  fillColor++;
}

void setFillColor(){
  if(fillColor <= 0 || fillColor >= 255){
    upwards = !upwards;
  }
  if(upwards){
    lighten();
  }else{
    darken();
  }
}
