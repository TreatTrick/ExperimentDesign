void triSquares() {
  fill(255);
  if (changeFlag==true) {
    rect(width/2-squareLateral-transLength, height/2, squareLateral, squareLateral);
  }
  if (changeFlag2==true) {
    rect(width/2, height/2, squareLateral, squareLateral);
  }
  if (changeFlag3==true) {
    rect(width/2+squareLateral+transLength, height/2, squareLateral, squareLateral);
  }

  fill(0);
  if (changeFlag==false) {
    rect(width/2-squareLateral-transLength, height/2, squareLateral, squareLateral);
  }
  if (changeFlag2==false) {
    rect(width/2, height/2, squareLateral, squareLateral);
  }
  if (changeFlag3==false) {
    rect(width/2+squareLateral+transLength, height/2, squareLateral, squareLateral);
  }
}