void Squares() {
  if (changeFlag==true) {
    background(0);
    fill(255);
    //rect(width/2+squareLateral+transLength, height/2, squareLateral, squareLateral);
    //fill(255-intensityChange);
    rect(width/2, height/2, squareLateral, squareLateral);
    //fill(255-2*intensityChange);
    //rect(width/2-squareLateral-transLength, height/2, squareLateral, squareLateral);
    //fill(255, 0, 0);
    //ellipse(width/2-squareLateral, height/2, 10, 10);
    //ellipse(width/2, height/2, 10, 10);
    //ellipse(width/2+squareLateral, height/2, 10, 10);
  }
  if (changeFlag==false) {
    background(0);
    fill(0);
    //rect(width/2+squareLateral+transLength, height/2, squareLateral, squareLateral);
    rect(width/2, height/2, squareLateral, squareLateral);
    //rect(width/2-squareLateral-transLength, height/2, squareLateral, squareLateral);
    //fill(255, 0, 0);
    //ellipse(width/2+squareLateral, height/2, 10, 10);
    //ellipse(width/2, height/2, 10, 10);
    //ellipse(width/2-squareLateral, height/2, 10, 10);
  }
}