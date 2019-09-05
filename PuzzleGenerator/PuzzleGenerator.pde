
Helper helper = new Helper(6);

boolean pressed = false;


float clr = 60;

boolean flashing = false;

int counter = 6;

void setup(){
    size(800,800);
    smooth(8);
}

void draw(){
  flashBackground();
  helper.updateNodes(pressed);
  helper.displayPuzzle();
  if(clr>255){
    background(clr);
  }
}

void flashBackground(){
  if(clr>=255){
    clr = 60;
    helper.newPuzzle();
  }
  if(clr>60){
    clr+=5;
  }
  background(clr);
}

void mouseClicked(){
  clr = 61;
  }


void mousePressed(){
  pressed = true;
}

void mouseReleased(){
  pressed = false;
}
