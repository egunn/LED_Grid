
//make a global array of pixels
Pixel [][] allThePixels = new Pixel[10][10];
Pixel [] animationPixel = new Pixel[1];

int testX = 0;
int testY = 0;
int startPixelX = 0;
int startPixelY = 0;


//code runs once, on startup
void setup() {
  hardware = new Hardware(5,5);  // how many columns and rows there actually are.
  hardware.printPorts(); //comment this line once you know which port you need
  hardware.init(this, 0); //which index to use from the printed port list.
  hardware.setBrightness(0.1);
  
  //initialize the global pixel array
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      //allThePixels[0]=pixelStorage;
      allThePixels[i][j]= new Pixel(50*i,50*j,color(0,0,0),false);
    }
  }
  
  //initialize the animation pixel array
  animationPixel[0]=new Pixel(200,50,color(150,0,0),false);
  
  size(501,501);
  frameRate(5);
}

//define Pixel class
class Pixel{
  //declare variables to store desired object properties
  color col;
  int xPos;
  int yPos;
  boolean touch;
  
  //create pixel constructor function to make pixel objects from input data 
  Pixel(){
    xPos = 20;//x;
    yPos = 100;//y;
    col = 50;//c;
    touch = false;//t;
    //println(xPos);
  }
    
  //create pixel constructor function to make pixel objects from input data 
  Pixel(int x, int y, color c, boolean t){
    xPos = x;
    yPos = y;
    col = c;
    touch = t;
    //println(xPos);
  }

} 


//code runs each time the screen is refreshed
void draw() {
  //DataType [] ArrayName = new DataType[length];
  //declare pixelStorage array of class Pixel
  Pixel pixelStorage;
  
  //set edge detect variables for pixel animation
   if (animationPixel[0].xPos > 400) {
     testX = 1;
   }
   
   if (animationPixel[0].xPos < 50) {
     testX = 0;
   }
  
   if (animationPixel[0].yPos > 400) {
     testY = 1;
   }
   
   if (animationPixel[0].yPos < 50) {
     testY = 0;
   }
  
   //change the direction of motion of the pixel based on the state of textX and testY
   switch(testX) {
      case 0:
      animationPixel[0].xPos = animationPixel[0].xPos + 50;
      break;
      case 1:
      animationPixel[0].xPos = animationPixel[0].xPos - 50;
      break;
    }
    
    switch(testY) {
      case 0:
      animationPixel[0].yPos = animationPixel[0].yPos + 50;
      break;
      case 1:
      animationPixel[0].yPos = animationPixel[0].yPos - 50;
      break;
    }
  
  /*int x;
  int y;
  color c;
  boolean t;*/
  //pixelStorage = new Pixel();
  
  /*
  //fill each pixel with a random color
  //allThePixels = new Pixel[10][10];
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      //allThePixels[0]=pixelStorage;
      allThePixels[i][j].col= color(random(255),random(255),random(255));
    }
  }
  */
  
  /*
  //fill a random pixel with a random color
  //first, reset everyone to black
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      //allThePixels[0]=pixelStorage;
      allThePixels[i][j].col= color(0,0,0);
    }
  }
  //then, set a pixel with random i,j values to a random color
  allThePixels[floor(random(allThePixels.length))][floor(random(allThePixels.length))].col= color(random(255),random(255),random(255));
  */
  
  /*
  //fill pixels with a slowly-shifting red gradient (linear, direction depends on i/j combination: 
  //i alone==> gradient along x; j alone==> along y; i+j==>diagonal;i*j hyperbolic fade from x and y axes
  //i^2+j^2, i^2*j^2 also give interesting results.
  //All patterns centered at the origin
  //allThePixels = new Pixel[10][10];
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      //allThePixels[0]=pixelStorage;
      allThePixels[i][j].col= color(50+20*(i+j),0,0);
    }
  }
  */

  
  /*
  //color only the center 4 pixels in the array (note:will still light up 4 pixels in an odd array, but they'll be off-center)
  //allThePixels = new Pixel[10][10];
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      //allThePixels[0]=pixelStorage;
      if ((i == allThePixels.length/2 || i == allThePixels.length/2-1) && (j == allThePixels.length/2 || j == allThePixels.length/2-1)){
        allThePixels[i][j].col= color(125+20*(i),0,0);
      }
      
      else {
        allThePixels[i][j].col= color(0,0,0);
      }
    }
  }
  */
  
  /*
   //color only the center 4 pixels in the array (note:will still light up 4 pixels in an odd array, but they'll be off-center)
  //allThePixels = new Pixel[10][10];
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      //allThePixels[0]=pixelStorage;
      if ((i == allThePixels.length/2 || i == allThePixels.length/2-1) && (j == allThePixels.length/2 || j == allThePixels.length/2-1)){
        allThePixels[i][j].col= color(125+20*(i),0,0);
      }
      if ((i <= allThePixels.length/2+1 && i >= allThePixels.length/2-2) && (j <= allThePixels.length/2+1 && j >= allThePixels.length/2-2)){ //&! (i == allThePixels.length/2 || i == allThePixels.length/2-1) && (j == allThePixels.length/2 || j == allThePixels.length/2-1)){
        allThePixels[i][j].col= color(0,125+20*(i),0);
      }
      else {
        allThePixels[i][j].col= color(0,0,0);
      }
    }
  }
  */
  
  
  //turn on any pixel that is touched with a random color (requires hardware)
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      if (allThePixels[i][j].touch)
        allThePixels[i][j].col = color(random(255),random(255),random(255));
      else
        allThePixels[i][j].col = color(0,0,0);
    }
  }
  

  //println(allThePixels[9][9].xPos);
  //println(allThePixels.length);
  
  
  //Turn on for animation+touch
  for (int j = 0; j<allThePixels.length;j++){
    for (int i=0; i<allThePixels.length;i++){
      if (allThePixels[i][j].touch) {
         animationPixel[0].xPos = 50*i;
         animationPixel[0].yPos = 50*j;
       }
      if (animationPixel[0].xPos == allThePixels[i][j].xPos && animationPixel[0].yPos == allThePixels[i][j].yPos){
        allThePixels[i][j].col =  color(0,0,200);//animationPixel[0].col;  //set the color of the base pixel to blue rather than the same as animated, to make visible
      }
      if (animationPixel[0].xPos != allThePixels[i][j].xPos && animationPixel[0].yPos != allThePixels[i][j].yPos){
        allThePixels[i][j].col =  color(0,0,0);
      }
    }
  }
  
  
  /*
  //Turn on for animation!
  //update allThePixels based on animatedPixel contents  
  for (int k=0; k<allThePixels.length;k++){
    for (int l=0; l<allThePixels.length;l++){
      if (animationPixel[0].xPos == allThePixels[k][l].xPos && animationPixel[0].yPos == allThePixels[k][l].yPos){
      allThePixels[k][l].col =  color(0,0,200);//animationPixel[0].col;  //set the color of the base pixel to blue rather than the same as animated, to make visible
      }
      if (animationPixel[0].xPos != allThePixels[k][l].xPos && animationPixel[0].yPos != allThePixels[k][l].yPos){
      allThePixels[k][l].col =  color(0,0,0);
      }
    }
  }
  */
  
  
  /*
  //frame fill
  for (int l=0; l<allThePixels.length; l++){
    allThePixels[l][0].col =  color(0,0,200);
  }
  for (int m=0; m<allThePixels.length; m++){
    allThePixels[0][m].col =  color(0,0,200);
  }  
  for (int l=0; l<allThePixels.length; l++){
    allThePixels[allThePixels.length-1][l].col =  color(0,200,0);
  }
  for (int m=0; m<allThePixels.length; m++){
    allThePixels[m][allThePixels.length-1].col =  color(0,200,0);
  } 
  */
  
   
  //print the contents of the allThePixels array to the screen
  for (int k=0; k<allThePixels.length;k++){
    for (int l=0; l<allThePixels.length;l++){
      fill(allThePixels[k][l].col);
      rect(allThePixels[k][l].xPos,allThePixels[k][l].yPos, 50,50);
    }
  }
  
  
  //Turn on for animation!
  //print the animation pixel to the screen (note that the animation pixel is smaller and offset to allow both the animated and the static one to be viewed at once)
  fill(animationPixel[0].col);
  rect(animationPixel[0].xPos+10, animationPixel[0].yPos+10, 30,30);
  
  
  //send the status of the allThePixels array to the LED hardware, if present
  //also save the resulting array back which contains updated touch information
  allThePixels = hardware.update(allThePixels); 
  //println(allThePixels[4][2].touch);  //example to print the state of a particular pixel's touch
  
 
}