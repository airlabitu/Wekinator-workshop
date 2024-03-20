// ToDos

// Start with classifier algorithm
    // setup responses corrosponding to the Wekinator output, and the wishes from Simon
// If time, also make a implementation for dynamis time warping
// take into consideration if Wekinator streams the same output-value combination, or only sends upond changes...
  // this will impact the way we want the generation of keystrokes to work

import oscP5.*;
import netP5.*;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.IOException;

OscP5 oscP5;
NetAddress myRemoteLocation;




int keyInput[] = {
  KeyEvent.VK_A, KeyEvent.VK_B, KeyEvent.VK_C, KeyEvent.VK_D, KeyEvent.VK_E, 
  KeyEvent.VK_F, KeyEvent.VK_G, KeyEvent.VK_H, KeyEvent.VK_I, KeyEvent.VK_J, 
  KeyEvent.VK_K, KeyEvent.VK_L, KeyEvent.VK_M, KeyEvent.VK_N, KeyEvent.VK_O, 
  KeyEvent.VK_P, KeyEvent.VK_Q, KeyEvent.VK_R, KeyEvent.VK_S, KeyEvent.VK_T, 
  KeyEvent.VK_U, KeyEvent.VK_V, KeyEvent.VK_W, KeyEvent.VK_X, KeyEvent.VK_Y, 
  KeyEvent.VK_Z, 
  KeyEvent.VK_PERIOD, KeyEvent.VK_COMMA, KeyEvent.VK_SPACE, KeyEvent.VK_ENTER,
  KeyEvent.VK_UP, KeyEvent.VK_DOWN, KeyEvent.VK_LEFT, KeyEvent.VK_RIGHT 
  
};

int last_output_value = -1;

void setup() {
  
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
}

void draw() {}


void oscEvent(OscMessage theOscMessage) {
  
  /* check if theOscMessage has the address pattern we are looking for. */
  //println(theOscMessage.addrPattern(), theOscMessage.typetag());
  if(theOscMessage.checkAddrPattern("/wek/outputs")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("f")) { // all dynamic timewarping
      /* parse theOscMessage and extract the values from the osc message arguments. */
      float firstValue = theOscMessage.get(0).floatValue();  
      
      println(theOscMessage.addrPattern(), theOscMessage.typetag());
      println(" values: "+firstValue);
      generateKeystroke(0, int(firstValue));
      // call the generateKeystroke function here
      return;
    }
    
  } 
  
  else if(theOscMessage.checkAddrPattern("/output_1")==true) {
    /* check if the typetag is the right one. */
    println(theOscMessage.addrPattern());
    generateKeystroke(1, 1);
    // call the generateKeystroke function here
    return; 
  }
  else if(theOscMessage.checkAddrPattern("/output_2")==true) {
    /* check if the typetag is the right one. */
    println(theOscMessage.addrPattern());
    generateKeystroke(2, 1);
    // call the generateKeystroke function here
    return; 
  }
  else if(theOscMessage.checkAddrPattern("/output_3")==true) {
    /* check if the typetag is the right one. */
    println(theOscMessage.addrPattern());
    // call the generateKeystroke function here
    generateKeystroke(3, 1);
    return; 
  }
  else if(theOscMessage.checkAddrPattern("/output_4")==true) {
    /* check if the typetag is the right one. */
    println(theOscMessage.addrPattern());
    // call the generateKeystroke function here
    generateKeystroke(4, 1);
    return; 
  }
  else if(theOscMessage.checkAddrPattern("/output_5")==true) {
    /* check if the typetag is the right one. */
    println(theOscMessage.addrPattern());
    // call the generateKeystroke function here
    generateKeystroke(5, 1);
    return; 
  }
}


void generateKeystroke(int output, int value){
  try {
    Robot robot = new Robot();
    
    // classifier
    if (output == 0 && value == 1 && last_output_value != 1){
      robot.keyPress(keyInput[29]);
      robot.delay(50);
    }
    else if (output == 0 && value == 2 && last_output_value != 2){
      robot.keyPress(keyInput[30]);
      robot.delay(50);
    }
    else if (output == 0 && value == 3 && last_output_value != 3){
      robot.keyPress(keyInput[31]);
      robot.delay(50);
    }
    else if (output == 0 && value == 4 && last_output_value != 4){
      robot.keyPress(keyInput[32]);
      robot.delay(50);
    }
    else if (output == 0 && value == 5 && last_output_value != 5){
      robot.keyPress(keyInput[33]);
      robot.delay(50);
    }
    
    
    // dynamic time warping
    else if (output == 1 && value == 1){
      robot.keyPress(keyInput[10]);
      robot.delay(50);
    }
    else if (output == 2 && value == 1){
      robot.keyPress(keyInput[11]);
      robot.delay(50);
    }
    else if (output == 3 && value == 1){
      robot.keyPress(keyInput[12]);
      robot.delay(50);
    }
    else if (output == 4 && value == 1){
      robot.keyPress(keyInput[13]);
      robot.delay(50);
    }
    else if (output == 5 && value == 1){
      robot.keyPress(keyInput[14]);
      robot.delay(50);
    }
    
    if (output == 0) last_output_value = value;
    
  }   
  catch (Exception e) {
    e.printStackTrace();  }
}
