void conditionMM() {
  if (resetFlagMM==true) {
    tikMM=millis();
    resetFlagMM=false;
  }
  tokMM=millis();
  if (tokMM-tikMM<noFlashTime) {
    noFlashTriSquares();
    fill(255,0,0);
    ellipse(width/2, height/2, eRadius, eRadius);
  } else if (tokMM-tikMM<evConT) {
    m = new OscMessage("con1", new Object[0]);//save the string "con1" to message m
    oscP5.flush(m, myBroadcastLocation); // flush this message to opeBCI-GUI
    fill(triangleIntensity, 0, 0);
    ellipse(width/2, height/2, eRadius, eRadius);
  } else {
    conChangeFlag=false;
    i=i+1;
  }
}

void conditionML() {
  if (resetFlagML==true) {
    tikML=millis();
    resetFlagML=false;
  }
  tokML=millis();
  if (tokML-tikML<noFlashTime) {
    noFlashTriSquares();
    fill(255,0,0);
    ellipse(width/2, height/2, eRadius, eRadius);
  } else if (tokML-tikML<hfEvConT) {
    m = new OscMessage("con2", new Object[0]);//save the string "con1" to message m
    oscP5.flush(m, myBroadcastLocation); // flush this message to opeBCI-GUI
    fill(triangleIntensity, 0, 0);
    ellipse(width/2, height/2, eRadius, eRadius);
  } else if (tokML-tikML<evConT) {
    m = new OscMessage("con2", new Object[0]);//save the string "con1" to message m
    oscP5.flush(m, myBroadcastLocation); // flush this message to opeBCI-GUI
    fill(triangleIntensity, 0, 0);
    ellipse(width/2-squareLateral-transLength, height/2, eRadius, eRadius);
  } else {
    conChangeFlag=false;
    i=i+1;
  }
}

void conditionMH() {
  if (resetFlagMH==true) {
    tikMH=millis();
    resetFlagMH=false;
  }
  tokMH=millis();
  if (tokMH-tikMH<noFlashTime) {
    noFlashTriSquares();
    fill(255,0,0);
    ellipse(width/2, height/2, eRadius, eRadius);
  } else if (tokMH-tikMH<hfEvConT) {
    m = new OscMessage("con3", new Object[0]);//save the string "con1" to message m
    oscP5.flush(m, myBroadcastLocation); // flush this message to opeBCI-GUI
    fill(triangleIntensity, 0, 0);
    ellipse(width/2, height/2, eRadius, eRadius);
  } else if (tokMH-tikMH<evConT) {
    m = new OscMessage("con3", new Object[0]);//save the string "con1" to message m
    oscP5.flush(m, myBroadcastLocation); // flush this message to opeBCI-GUI
    fill(triangleIntensity, 0, 0);
    ellipse(width/2+squareLateral+transLength, height/2, eRadius, eRadius);
  } else {
    conChangeFlag=false;
    i=i+1;
  }
}