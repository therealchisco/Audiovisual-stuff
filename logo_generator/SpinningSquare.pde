class SpinningSquare{
  private int centerX;
  private int centerY;
  private int maxLength = 300;
  private int minLength = 10;
  private boolean growing = true;
  private int sideLength = 11;
  
  SpinningSquare(){
    centerX = width/2;
    centerY = height/2;
  }
  
  SpinningSquare(int center){
    centerX = center;
    centerY = center;
  }
  
  private void switchGrowth(){
    growing = !growing;
  }
  
  private void shrink(){
    sideLength--;
  }
  
  private void bloat(){
    sideLength++;
  }
  
  private boolean isMinOrMax(){
    return(sideLength <= minLength || sideLength >= maxLength);
  }
  
  private void updateSideLength(){
    if(isMinOrMax()){
      switchGrowth();
    }
    if(growing){
      bloat();
    }else{
      shrink();
    }
  }
  
  public void show(){
    updateSideLength();
    rect(centerX,centerY,sideLength,sideLength);
  }
  
  public void show(float c){
    translate(width/2,height/2);
    rotate(c);
    show();
  }
  
}
