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
  KeyEvent.VK_PERIOD, KeyEvent.VK_COMMA, KeyEvent.VK_SPACE, KeyEvent.VK_ENTER
};

void setup() {
  
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
}

void draw() {}


void oscEvent(OscMessage theOscMessage) {
  
  /* check if theOscMessage has the address pattern we are looking for. */
  if(theOscMessage.checkAddrPattern("/wek/outputs")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("fffff")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      float firstValue = theOscMessage.get(0).floatValue();  
      float secondValue = theOscMessage.get(1).floatValue();
      float thirdValue = theOscMessage.get(2).floatValue();
      float fourthValue = theOscMessage.get(3).floatValue();
      float fifthValue = theOscMessage.get(4).floatValue();
      
      println(theOscMessage.addrPattern(), theOscMessage.typetag());
      println(" values: "+firstValue+", "+secondValue+", "+thirdValue+", "+fourthValue+", "+fifthValue);
      // call the generateKeystroke function here
      return;
    }  
  } 
  println();
}


void generateKeystroke(int output, int value){
  try {
    Robot robot = new Robot();
    
    if (output == 1 && value == 2){
      robot.keyPress(keyInput[0]);
      robot.delay(50);
    }
    else if (output == 2 && value == 4){
      robot.keyPress(keyInput[2]);
      robot.delay(50);
    }
  }   
  catch (Exception e) {
    e.printStackTrace();  }
}
