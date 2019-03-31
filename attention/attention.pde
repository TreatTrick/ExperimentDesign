import java.util.Timer; 
import java.util.TimerTask;
import oscP5.*; // oscP5 and neP5 is for communicating with openBCI-GUI
import netP5.*;

OscP5 oscP5;//initialize OscP5 class
NetAddress myBroadcastLocation; //define a new NetAddress class to save the ip and port of openBCI-GUI
OscMessage m;//defien a message 

Timer myTimer;//define a new Timer class
TimerTask myTimerTaskCheck;//define a new TimerTask class
float flickerTime=60100;//the checkerboard's flickering time

boolean changeFlag=true;
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
int letterIndex;
int hfEvConT=25000;
int triangleIntensity=255;
int squareLateral=270;
int transLength=0;
int intensityChange=90;
int tikLetter=0;
int tokLetter=0;
int sampleIndex;
int numsA=0;
char randomLetter;
String[] story;
String storyList[];
String array[]={"blackScreen","conAttention", "disAttention",""};
int num=3;
int iArray = 0;
PFont font;
int tPerSample=16000;
float tPerLetter;
void setup() {
  noCursor();
  background(0);
  oscP5 = new OscP5(this, 12000);
  myBroadcastLocation=new NetAddress("127.0.0.1", 32000);
  fullScreen();
  rectMode(CENTER);
  ellipseMode(CENTER);
  font = createFont("Arial",16,true);
  noStroke();
  textAlign(CENTER);
  story=loadStrings("story.txt");
  storyList=split(story[0],' ');
  myTimer=new Timer();
  tPerLetter=tPerSample*10/storyList.length;
  myTimerTaskCheck=new TimerTask() {
    @Override
      public void run() {
      changeFlag=!changeFlag;
    }
  };
  myTimer.scheduleAtFixedRate(myTimerTaskCheck, 1000, 66);
 // suffleArray(array);//Random sort    
}

void draw() {

  time = millis();
  if (time<10000) {
    m = new OscMessage("computer1");//save the string "con1" to message m
    m.add("black");
    oscP5.flush(m, myBroadcastLocation);
    background(0);
    textFont(font, 30);
    fill(255);
    text("This condition is black screen. \n look at the center of screen \n and relax your mind",width/2,height/2);
  } else {
           if(iArray>2){
            exit();
           }
            println("memeda "+iArray);
    if (conChangeFlag==true) {
      switch(array[iArray]) { //<>//
      case "blackScreen":
        conditionBlackScreen();
        break;
      case "conAttention":
        Squares();
        conditionConAttention();
        break;
      case "disAttention":
        Squares();
        conditionDisAttention();
        break;
      }
    } 
    if (conChangeFlag==false) {
      m = new OscMessage("computer1");//save the string "con1" to message m
      m.add("black");
      
            if(iArray==3){
            exit();
            }
            println("papada "+iArray);
      oscP5.flush(m, myBroadcastLocation);
      if (backTikFlag==true) {
        backTikFlag=false;  
        backTik=millis();
      }
      backTok=millis();
      if (backTok-backTik<10000){
          background(0);
          if(iArray==3){exit();}
          switch(array[iArray]){ //<>//
            case "conAttention":
                background(0);
                textFont(font, 30);
                fill(255);
                text("In this condition, \n look at the center of screen \n and read the story in square",width/2,height/2);
                break;
           case "disAttention":
                background(0);
                textFont(font, 30);
                fill(255);
                text("In this condition, \n look at the center of screen \n but relax, no need to read the story",width/2,height/2);
                break;
                case "":
        }
      }
      else {
        conChangeFlag=true;
        backTikFlag=true;
      }
    }
  }
}

void keyPressed(){
  //if ((key=='A'||key=='a')&& (sentence.charAt(letterIndex)=='A'||(sentence.charAt(letterIndex)=='a'))){
  //  numsA=+1;
  // }
  exit();
}