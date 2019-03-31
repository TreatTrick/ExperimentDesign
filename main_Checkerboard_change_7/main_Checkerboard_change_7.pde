/********************************************************************************* //<>// //<>//
 this the main function for this checkerboard program.                                
 this program includes six conditions:                                          
 1. Keep stimulus contrast stable at maximum level and request the participant to
 continuously increase attention level on stimulus.
 2. Keep stimulus contrast stable at maximum level and request the participant to
 continuously decrease attention level on stimulus.
 3. Like Frederyk's experiment . Keep eyes on fixation and do covert attention on 
 red-small dot . increase contrast and decrease radius of appearance of the small 
 dot.
 4.  Like Frederyk's experiment . Keep eyes on fixation and do covert attention on 
 red-small dot . decrease contrast and increase radius of appearance of the small 
 dot.
 5. Like 3 but do overt attention . Move eyes to catch up small dot instead of 
 holding on fixation dot.
 6. Like 4 but do overt attention . Move eyes to catch up small dot instead of 
 holding on fixation dot.
 
 the checkerboad flickering frequency is near 7.58Hz. The red dot's radius decreases
 from the border area to the center or increase form the center to the near border 
 area in 50seconds. Every 6.25s the radius decrease or increase 6.2% of the width.
 and in this 6.25s, the red dot appears 5 times at a random angle and the same radius.
 In other word, red dot appears every 1.25 seconds.
 
 Another red dot is displayed at the center of the screen for fixation and pay 
 attention to.
 *********************************************************************************/

import java.util.Timer; 
import java.util.TimerTask;
import oscP5.*; // oscP5 and neP5 is for communicating with openBCI-GUI
import netP5.*;

String array[]={"1","2","3","4","5"};//This string array is for selecting five conditions.
int conNum=5;

OscP5 oscP5;//initialize OscP5 class
NetAddress myBroadcastLocation; //define a new NetAddress class to save the ip and port of openBCI-GUI
OscMessage m;//defien a message 
Checkerboard myCheckerboard;//define a new Checkerboard class 
Timer myTimer;//define a new Timer class
TimerTask myTimerTaskCheck;//define a new TimerTask class
float flickerTime=60100;//the checkerboard's flickering time
boolean checkerboardChangeFlag=true; //this variable changes the checkerboard's patterns
long tik;//tik and tok is to records time.
long tok;
long oldtok;//record last tok time
int contrastTik;
int contrastTok;
int highValue=255;//highValue is for high contrast
int lowValue=45;//lowValue is for low contrast
float startRadiusMax;// the maximum of radius for the red dot to display
float startRadiusMin=0;//the minimum of radius for the red dot to display

int i=0; //select the array[i] string
boolean conditionFlag=true;//this flag is for changing between 60s breaking and 50 flickering
PFont f;//text's font 
float decreaseRadius;//every time the red dot's radius decrease or increase this value.
int redDotTik;//redDotTik and redDotTok is to control red dot's appearing time, every 1.25s.
int redDotTok;

//in the next sytax, all "DR" stands for "Decrease Radius", and "RD" stands for "Red Dot"
int DRFlag=0;//when this flag's value comes to 5, we need to decrease or increase the radius of red dot.
boolean resetFlag=true;//when this flag is true,reset the other some flags
boolean RDDisplayFlag=false;//this flag is for displaying red dot for a while, not just make it ficker once.
                            //Because if the red dot displays for some time on the screen, it's much easier
                            //for the subject's eyes to catch it.
int RDStartTime;//RDStartTime and RDStopTime is flags to control the displaying time of the red dot every time
int RDStopTime;
float[]  coordinates=new float[2];// this array returns red dot's displaying coodinates, coordinates[0] is 
                                  // x-coordinate and coordinates[1] is y-coordinate.
int myHeight=540;
int ctrLowValue=75;
int ctrChange=225-lowValue;

int CCtik;
int CCtok;
int  con5CtrCh;


void setup() {//initialize
  fullScreen();
  //size(400,400);
  background(0); 
  tik=millis();
  myTimer=new Timer();
  myTimerTaskCheck=new TimerTask() {
    @Override
      public void run() {
      checkerboardChangeFlag=!checkerboardChangeFlag;
    }
  };
  myCheckerboard=new Checkerboard(); 
  myTimer.scheduleAtFixedRate(myTimerTaskCheck, 1000, 66);
  //start the timer. the TimerTaskCheckerboard runs in 1000ms after running 
  //the program, and TimerTaskCheckerboard repeats to run every 66ms.But the  So it
  //runs in 7.58Hz.
  suffleArray(array);//Random sort
  oldtok=10;
  f = createFont("Arial", 40, true);
  textFont(f);
  textAlign(CENTER);
  decreaseRadius=myHeight*0.062;
  startRadiusMax=myHeight/2; //<>//
  noCursor();
   oscP5 = new OscP5(this,12000);//12000 is this program's port, ip is 127.0.0.1 in default 
   myBroadcastLocation = new NetAddress("127.0.0.1",32000);//write down the address of openBCI-GUI,127.0.0.1 means
                                                           // the ip of openBCI-GUI is also this computer.

}

void draw() {
  tok=millis();

  if (tok-tik<5000) {//for 0~5 seconds, display nothing
  } else if (tok-tik<10000) {//for 5~15 seconds, display nothing
    fill(255);
    text("Condition "+array[0], width/2, height/2);
    oldtok=tok;
  } else {//for the time after 10s, display something
   // println(tok-oldtok);
    if (conditionFlag==true) {//when the conditionFlag is true, draw different conditions
      switch(array[i]) {//switch the array[], and do the corresponding conditions
      case "1" : 
        m = new OscMessage("con1",new Object[0]);//save the string "con1" to message m
        oscP5.flush(m,myBroadcastLocation); // flush this message to opeBCI-GUI
        conditionOne();
        break;
      case "2" : 
        m = new OscMessage("con2",new Object[0]);
        oscP5.flush(m,myBroadcastLocation);
        conditionTwo();
        break;
      case "3" : 
        m = new OscMessage("con3",new Object[0]);
        oscP5.flush(m,myBroadcastLocation);
        conditionThree();
        break;
      case "4" : 
        m = new OscMessage("con4",new Object[0]);
        oscP5.flush(m,myBroadcastLocation);
        conditionFour();
        break;
      case "5" :
        m = new OscMessage("con5",new Object[0]);
        oscP5.flush(m,myBroadcastLocation);
        conditionFive();
        break;
      }
      if (tok-oldtok>flickerTime) {//flickering for 50s, and then change the conditionFlag's value and jump to the next step
        i+=1;
        if (i>=conNum) {
        m = new OscMessage("",new Object[0]);
        oscP5.flush(m,myBroadcastLocation);
        noLoop();// when six conditions are all over, finish draw() function
        exit();
        }
        oldtok=tok;
        background(0);
        conditionFlag=false;//conditionFlag is false, jump to black background part
        resetFlag=true;//this flag is for the conditionThree() and conditionFour() to reset their flags
      }
    } 
    if (conditionFlag==false) {//when the conditionFlag is false, draw background
       m = new OscMessage("black",new Object[0]);
       oscP5.flush(m,myBroadcastLocation);  
      if (tok-oldtok>10000) {
        //40s for black background,after that draw "Condition i" for a clue
        fill(255);
        text("Condition "+array[i], width/2, height/2);
      } 
      if (tok-oldtok>15000) {
        //after 60s, change the conditionFlag and jump to flickering part
        oldtok=tok;
        conditionFlag=true;
      }
    }
  }
}

void keyPressed(){
      exit();//exit this program
}