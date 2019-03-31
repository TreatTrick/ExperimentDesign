void conditionOne() {
  background(0);
  //flickering
}

/*******************************************************************************/
void conditionTwo() {
  if(checkerboardChangeFlag==true)
  fill(255);
  else fill(0);
  rect(width/2-540/4,height/2-540/4,540/2,540/2);
}
/******************************************************************************/

void conditionThree() {
  if (resetFlag==true) {
    //in every condition, the fist time run into this function, reset all the flags
    //this is for the function works well
    lowValue=ctrLowValue;//low contrast
    contrastTik=millis();
    //DRFlag=0;//this flag controls change of red dot's radius
    //redDotTik=millis();
    resetFlag=false;
    //startRadiusMax=myHeight/2;//the red dot's initial max radius
  }
  //redDotTok=millis();
  contrastTok=millis();
  if(checkerboardChangeFlag==true)
  fill(lowValue);
  else fill(0);
  rect(width/2-540/4,height/2-540/4,540/2,540/2);
  if (contrastTok-contrastTik>flickerTime/ctrChange) {
    //every time the checkerboardChangeFlag changes, valueFlag + 1, after
    //value >= 4, lowValue + 1, that is to say contrast + 1.
    lowValue+=1;
    contrastTik=millis();
  }
  //if (redDotTok-redDotTik>=flickerTime/40) {
  //  //every 1.25s, the red dot appears at a random place, their radii are all the same
  //  redDotTik=redDotTok;//reset 
  //  RDDisplayFlag=true;//when RDDisplayFlag is true, the red dot will be displayed for a 
  //                     //certain while, in this program, it is 150ms. Because if the red
  //                     //dot just appears suddenly for a moment, the subject's eyes maybe
  //                     //cannot catch it.
  //  RDStartTime=millis();//for record the displaying time of every red dot
  //  redDot(startRadiusMax-decreaseRadius, lowValue, width/2, height/2, coordinates);
  //  //the above function can return red dot's x-coordinates and y-coordinates for displaying it
  //  DRFlag+=1;
  //  if (DRFlag>=5) {//when this flag>=5, red dot has been appeared at the same radius random place for 
  //                  //five times, and we can change it radius now
  //    startRadiusMax-=decreaseRadius;
  //    DRFlag=0;//reset
  //  }
  //}
  //if (RDDisplayFlag==true) {//when RDDisplayFlag is true, to display red dot at a certain coordinates for 150ms
  //  RDStopTime=millis();
  //  fill(lowValue, 0, 0);
  //  noStroke();
  //  ellipse(coordinates[0], coordinates[1], 10, 10);//draw red dot
  //  if (RDStopTime-RDStartTime>150) {
  //    RDDisplayFlag=false;
  //  }
  //}
  //fill(255, 0, 0);
  //noStroke();
  //ellipse(width/2, height/2, 10, 10);//draw the red dot in the center all teh time
}

/**************************************************************************/

void conditionFour() {//this condition is just like conditionThree. No comment
  if (resetFlag==true) {
    highValue=255;
    //DRFlag=0;
    //redDotTik=millis();
    contrastTik=millis();
    resetFlag=false;
    //startRadiusMin=0;
  }
  //redDotTok=millis();
  contrastTok=millis();
  if(checkerboardChangeFlag==true)
  fill(highValue);
  else
  fill(0);
  rect(width/2-540/4,height/2-540/4,540/2,540/2);
  if (contrastTok-contrastTik>flickerTime/ctrChange) {
    //every time the checkerboardChangeFlag changes, valueFlag + 1, after
    //value >= 4, lowValue + 1, that is to say contrast + 1.
    highValue-=1;
    contrastTik=millis();
  }
  //if (redDotTok-redDotTik>=flickerTime/40) {
  //  redDotTik=redDotTok;
  //  RDDisplayFlag=true;
  //  RDStartTime=millis();
  //  redDot(startRadiusMin+decreaseRadius, highValue, width/2, height/2, coordinates);
  //  DRFlag+=1;
  //  if (DRFlag>=5) {
  //    startRadiusMin+=decreaseRadius;
  //    DRFlag=0;
  //  }
  //}
  //if (RDDisplayFlag==true) {
  //  RDStopTime=millis();
  //  noStroke();
  //  fill(highValue, 0, 0);
  //  ellipse(coordinates[0], coordinates[1], 10, 10);
  //  if (RDStopTime-RDStartTime>150) {
  //    RDDisplayFlag=false;
  //  }
  //}
  //fill(255, 0, 0);
  //noStroke();
  //ellipse(width/2, height/2, 10, 10);
}

/*****************************************************************************/
void conditionFive(){
    if (resetFlag==true) {
    resetFlag=false;
    highValue=255;
    lowValue=145;
    con5CtrCh=highValue-lowValue;
    contrastTik=millis();
    CCtik=millis();
  }
    CCtok=millis();
    if(CCtok-CCtik<30000){
        contrastTok=millis();
        if(checkerboardChangeFlag==true)
        fill(lowValue);
        else
        fill(0);
        rect(width/2-540/4,height/2-540/4,540/2,540/2);
        if (contrastTok-contrastTik>30000/con5CtrCh) {
          //every time the checkerboardChangeFlag changes, valueFlag + 1, after
          //value >= 4, lowValue + 1, that is to say contrast + 1.
          lowValue+=1;
          contrastTik=millis();
        }
    }
    else{
        contrastTok=millis();
        if(checkerboardChangeFlag==true)
        fill(highValue);
        else
        fill(0);
        rect(width/2-540/4,height/2-540/4,540/2,540/2);
        if (contrastTok-contrastTik>30000/con5CtrCh) {
          //every time the checkerboardChangeFlag changes, valueFlag + 1, after
          //value >= 4, lowValue + 1, that is to say contrast + 1.
          highValue-=1;
          contrastTik=millis();
        }
    }
}