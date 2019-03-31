import java.util.Timer; 
import java.util.TimerTask;
import oscP5.*; // oscP5 and neP5 is for communicating with openBCI-GUI
import netP5.*;

OscP5 oscP5;//initialize OscP5 class
NetAddress myBroadcastLocation; //define a new NetAddress class to save the ip and port of openBCI-GUI
OscMessage m;//defien a message 

Timer myTimer;//define a new Timer class
TimerTask myTimerTaskCheck;//define a new TimerTask class
Timer myTimer2;//define a new Timer class
TimerTask myTimerTaskCheck2;//define a new TimerTask class
Timer myTimer3;//define a new Timer class
TimerTask myTimerTaskCheck3;//define a new TimerTask class
float flickerTime=60100;//the checkerboard's flickering time
int eRadius=5;
boolean changeFlag=true;
boolean changeFlag2=true;
boolean changeFlag3=true;
int noFlashTime=5000;  
int time=0;
int tikMM=0;
int tikML=0;
int tikMH=0;
int tokMM=0;
int tokML=0;
int tokMH=0;
int backTik=0;
int backTok=0;
boolean backTikFlag=true;
boolean resetFlagMM=true;
boolean resetFlagML=true;
boolean resetFlagMH=true;
boolean conChangeFlag=true;
int dh=150;

int evConT=45500;
int hfEvConT=25000;
int triangleIntensity=255;
int squareLateral=270;
int transLength=200;
int intensityChange=90;

String array[]={"MM", "ML", "MH"};
int num=3;
int i = 0;

void setup() {
  noCursor();
  background(0);
  oscP5 = new OscP5(this, 12000);
  myBroadcastLocation=new NetAddress("127.0.0.1", 32000);
  fullScreen();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  myTimer=new Timer();
  myTimerTaskCheck=new TimerTask() {
    @Override
      public void run() {
      changeFlag=!changeFlag;
    }
  };
    myTimer2=new Timer();
  myTimerTaskCheck2=new TimerTask() {
    @Override
      public void run() {
      changeFlag2=!changeFlag2;
    }
  };
    myTimer3=new Timer();
  myTimerTaskCheck3=new TimerTask() {
    @Override
      public void run() {
      changeFlag3=!changeFlag3;
    }
  };
  myTimer.scheduleAtFixedRate(myTimerTaskCheck, 1000, 77);
    myTimer2.scheduleAtFixedRate(myTimerTaskCheck2, 1000, 66);
      myTimer3.scheduleAtFixedRate(myTimerTaskCheck3, 1000, 59);
  suffleArray(array);//Random sort
}

void draw() {
  time = millis();
  if (time<5000) {
    background(0);
  } else {
    if (conChangeFlag==true) {
      triSquares();
      switch(array[i]) {
      case "MM":
        conditionMM();
        break;
      case "ML":
        conditionML();
        break;
      case "MH":

        conditionMH();
        break;
      }
    } 
    if (conChangeFlag==false) {
      if(i>=3)
      exit();
      m = new OscMessage("black", new Object[0]);//save the string "con1" to message m
      oscP5.flush(m, myBroadcastLocation);
      if (backTikFlag==true) {
        backTikFlag=false;  
        backTik=millis();
      }
      backTok=millis();
      if (backTok-backTik<5000){
        background(0);
      }
      else {
        conChangeFlag=true;
        backTikFlag=true;
      }
    }
  }
}

void keyPressed(){
  exit();
}