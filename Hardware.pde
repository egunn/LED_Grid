import processing.serial.*;

//gloabl variables
Hardware hardware;

class Hardware{

  Serial myPort;
  int delayTime = 1;
  byte [] bytedata;
  int HWCols, HWRows;
  float Brightness = 0.2;
 
  Hardware(int hwCols,int hwRows){
    HWCols = hwCols;
    HWRows = hwRows;
  }
 
  void printPorts(){
    // List all the available serial ports:
    printArray(Serial.list());
  }
  
  void init(PApplet parent, int portNumber){
  
    // if portNumber is possible
    if (Serial.list().length > portNumber) {
      // Open the port you are using at the rate you want:
      myPort = new Serial(parent, Serial.list()[portNumber], 230400);
    }
    else
        println("requested serial port not available");
    
  }
  
  //set scalar value from 0 to 1 to dim overall display
  void setBrightness (float brightness){
    Brightness = brightness;
  }
  
  //update the actual hardware, if connected
  Pixel[][] update(Pixel[][] pixelData){
    if (myPort == null){
        return pixelData; //port is not open or created, so skip all this and just return the input.
    }
    //don't update hardware bigger than the actual number of pixels, or bigger than the input data
    int numCols = min(pixelData.length,HWCols);
    int numRows = min(pixelData[0].length,HWRows); //based on https://forum.processing.org/one/topic/getting-lengths-of-multidimensional-arrays.html

    //send out color data
    bytedata = new byte[]{};
    for (int j = 0; j<numCols;j++){
      for (int i=0; i<numRows;i++){
        int r = (pixelData[i][j].col >> 16) & 0xFF;  // Faster way of getting red(pixelData[i][j].col)
        int g = (pixelData[i][j].col >> 8) & 0xFF;   // Faster way of getting green(pixelData[i][j].col)
        int b = (pixelData[i][j].col) & 0xFF;        // Faster way of getting blue(pixelData[i][j].col)
        
        //prevent sending 255 on any color bit - the human eye won't notice.
        //also apply brightness (linearly)
        r = (int)(Brightness * min(r,254));
        g = (int)(Brightness * min(g,254));
        b = (int)(Brightness * min(b,254));
        bytedata = concat(bytedata, new byte[]{(byte)i,(byte)j,(byte)r,(byte)g,(byte)b,(byte)255});
      } //<>//
    }
    //write all the data!
    myPort.write(bytedata);
    //delay(delayTime);
    
    //now get any touch data that has shown up and store it in the pixelData
    int bufferlength = 250;
    char[] inBuffer = new char [bufferlength];
    int in=0;
    while (myPort.available() > 0) {
      char c = myPort.readChar();
      inBuffer[in] = c;  
      in++;
      
      if (c == 255)
        in=0;
        
      if (in == bufferlength)
        break;
    } 

    //for(int i=0;i<in;i++){
      //display raw buffer data
      //print(inBuffer[i]);
    //}
    //println();

    for(int touchRow=0;touchRow<HWRows;touchRow++)
    {
      for(int touchCol=0;touchCol<HWCols;touchCol++)
      {
        boolean isTouched = (inBuffer[(touchRow*HWCols) + touchCol]=='1')?true:false;
        pixelData[touchCol][touchRow].touch = isTouched;
      }
    }

  return pixelData;
  }
  
}