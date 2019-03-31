void conditionBlackScreen() {
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
  }
  tokMM=millis();
  if (tokMM-tikMM<15000) {
      m = new OscMessage("computer1");//save the string "con1" to message m
      m.add("blackScreen");
      oscP5.flush(m, myBroadcastLocation);
      background(0);
  } else {
      conChangeFlag=false;
      resetFlagMM=true;
      iArray+=1;
    }
}

void conditionConAttention() {
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
    letterIndex=0;
    tikLetter=millis();
    sampleIndex=1;
  }
  tokMM=millis();
  tokLetter=millis();
  if (tokMM-tikMM<tPerSample) { //<>//
        if(tokLetter-tikLetter>tPerLetter){
          letterIndex+=1;
          tikLetter=millis();
      }
      m = new OscMessage("computer1");//save the string "con1" to message m
      m.add("conAttention"+sampleIndex);
      oscP5.flush(m, myBroadcastLocation);
      textFont(font,25);
      if (changeFlag==true){// STEP 3 Specify font to be used
        fill(0);   
      }else{
        fill(255);
      }
      text(storyList[letterIndex],width/2,height/2); 
  } else {
    sampleIndex+=1;
    tikMM=millis();
    tikLetter=millis();
    if(sampleIndex>10){
      conChangeFlag=false;
      resetFlagMM=true;
      iArray+=1;
    }
  }
}

void conditionDisAttention() { //<>//

  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
    letterIndex=0;
    tikLetter=millis();
    sampleIndex=1;
  }
  tokMM=millis();
  tokLetter=millis();
  if (tokMM-tikMM<tPerSample) {
        if(tokLetter-tikLetter>tPerLetter){
          letterIndex+=1;
          tikLetter=millis();
      }
      m = new OscMessage("computer1");//save the string "con1" to message m
      m.add("disAttention"+sampleIndex);
      oscP5.flush(m, myBroadcastLocation);
      textFont(font,25);
      if (changeFlag==true){// STEP 3 Specify font to be used
        fill(0);   
      }else{
        fill(255);
      }
      text(storyList[letterIndex],width/2,height/2); 
  } else {
    sampleIndex+=1;
    tikMM=millis();
    tikLetter=millis();
    if(sampleIndex>10){
      conChangeFlag=false;
      resetFlagMM=true;
      iArray+=1;
    }
  }
}