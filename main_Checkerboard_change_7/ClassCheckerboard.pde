/**************************************************************************
this class is to draw a checkerboard, with 4*4 little square in it.     
And make them to flicker at a fixed frequency.                                       
**************************************************************************/
class Checkerboard {

  /**********data****************************************************************/
  private int sideLength;//square's side length
  private int startPoint;//the upper-left square's upper-left corner's x-coodinate
  /********************************************************************************/

  /***********constructor**********************************************************/
  Checkerboard() {
    sideLength=myHeight/4;
    startPoint=(width-myHeight)/2;
  }

  /********************************************************************************/

  /***************functions********************************************************/
  void drawCheckerboard(boolean checkerboardChangeFlag, int maxWhite) {
    //checkerboardChangeFlag is for displaying the checkerboard's two different patterns.
    //maxWhite to control the white squares' white value,0--255, so we can control the contrast of checkboard
    if (checkerboardChangeFlag==true) {
      //if the checkerboardChangeFlag is true, display the checkboard in the first pattern

      //Since the checkboard has 4*4=16 squares, using two loops to draw the squares.
      //Two loops, i for the 4*4 squares' row, i=1 means first row. j for the 4*4 squares' column
      //j=1 means first column.

      //whiteBlack is a variable equaling to 0 or 255. Changing it every row and every colunm
      //to make the checkerboard displayed white squares and black squares.
      int whiteBlack=maxWhite;
      for (int i=0; i<4; i++)
      {
        whiteBlack=maxWhite-whiteBlack;//change the square's color between white and black
        for (int j=0; j<4; j++) {
          whiteBlack=maxWhite-whiteBlack;
          fill(whiteBlack);//fill the color,black or white
          rect(startPoint+j*sideLength, (i)*sideLength+270, sideLength, sideLength);//draw squares
        }
      }
    }
    if (checkerboardChangeFlag==false) {
      //if the checkerboardChangeFlag is false, display the checkboard in the second pattern
      int whiteBlack=0;
      for (int i=0; i<4; i++) {
        whiteBlack=maxWhite-whiteBlack;
        for (int j=0; j<4; j++) {
          whiteBlack=maxWhite-whiteBlack;
          fill(whiteBlack);
          rect(startPoint+j*sideLength, i*sideLength+270, sideLength, sideLength);
        }
      }
    }
  }
}
/******************************************************************************/