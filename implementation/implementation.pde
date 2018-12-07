// Implementation of the P1 project

import processing.video.*;

// phone call images
PImage im112, im114, bestFriendIm, motherIm, chooseCallIm;

// Declaring the different movies
Movie fireAlarmAndCallMovie, choosingTheFireExtinguisherMovie, findFireExtinguishersMovie, searchingForFireExitMovie, goingToFireEscapeMovie;


int state = 0;

// the continueButtons
int numberOfcontinueButtons = 10;
Button[] continueButtons = new Button[numberOfcontinueButtons];


// show scenes
boolean [] showScene = new boolean[6];


// try again buttons, one for each scene with user interaction
Button [] tryAgain = new Button[4];
  /*
  
   --> Phone call
   --> Choosing fire extinguisher
   --> Choosing how to use the fire extinguisher
   --> choosing the path
  
  */

// amount of buttons for the call
Button [] callOptionsButtons = new Button[6];
  /*
  
  --> 112
  --> 114
  --> Mother
  --> Best friend
  --> Continue
  --> Try again
  */

// amount of buttons for choosing the fire extinguisher
Button [] choosingFireExtinguisherOptionsButtons = new Button[5];
  /*
  
  --> CO2
  --> Water
  --> Foam
  --> Dry powder
  --> Try again
  
  */
  


Button simulateButton;


// Timer
int time;





/*

states --> one for each scene

showScene[0] --> main menu with simulate button


showScene[1] --> fire and clicking fire alarm video. The call options appear. Create a try again button for scene1
             --> if the user clicks on 112 -> showScene[2] == true
             --> else if the user clicks on:
                       --> 114 --> show iamge of 114 to explain why it's wrong, and the try again button
                       --> mother --> show image of mother to explain why it's wrong, and the try again button
                       --> best friend --> show image of best friend to explain why it's wrong, and the try again button
                   --> then the user restarts that scene --> showScene[1] == true
                     

showScene[2] --> video for choosing fire extinguisher and fire extinguisher options appear
showScene[3] -->  video for choosing how to use the fire extinguisher appears
             --> how to use fire extinguisher options appear
showScene[4] --> video for seaarching for an exit door
             --> door options buttons and images appear
showScene[5] --> the user escapes from the room successfully
             --> the quit menu appears


*/

void setup()
{
  size(1920, 1080);
  // fullScreen(); // to make the size of the interface the same as the device's screen 

  frameRate(30); // framerate of the video

  // declaring the movies
  fireAlarmAndCallMovie = new Movie(this, "searching for fire alarm and calling.mp4"); // declaring the movie
  choosingTheFireExtinguisherMovie = new Movie(this, "choosing fire extinguisher.mp4"); // call emergency movie
  findFireExtinguishersMovie = new Movie(this, "choosing how to use fire extinguisher.mp4");
  searchingForFireExitMovie = new Movie(this, "searching for fire exit sign.mp4");
  goingToFireEscapeMovie = new Movie(this, "going to fire escape.mp4");


  // loading the phone call images
  im112 = loadImage("Illustrator files/Phone_112.png");
  im114 = loadImage("Illustrator files/Phone_114.png");
  bestFriendIm = loadImage("Illustrator files/Phone_Bestfriend.png");
  motherIm = loadImage("Illustrator files/Phone_Mother.png");
  chooseCallIm = loadImage("Illustrator files/Phone_options.png");

  // declaring the continueButtons

  //  x, y, width of button, height of button
  simulateButton = new Button(width / 4, height / 2, 300, 200, "SIMULATE"); // the simulate button
  
  // call option buttons
  callOptionsButtons[0] = new Button(1160, 350, 600, 90, ""); // 112
  callOptionsButtons[1] = new Button(1160, 450, 600, 90, ""); // 114
  callOptionsButtons[2] = new Button(1160, 550, 600, 90, ""); // mother
  callOptionsButtons[3] = new Button(1160, 650, 600, 90, ""); // friend
  callOptionsButtons[4] = new Button(605, 795, 300, 100, ""); // continue
  callOptionsButtons[5] = new Button(610, 800, 300, 100, ""); // try again
}


// Called every time a new frame is available to read
void movieEvent(Movie m)
{
  m.read();
}

void draw()
{ 
  // println("MouseX: " + mouseX + "  |  MouseY: " + mouseY);
  showScene();
  update();
}

void showScene()
{
  if(state == 0) // if the main menu scene is true
  {
    showMainMenu();
  }
  if(state == 1)
  {
    showScene1();
  }
  if(state == 2)
  {
    showScene2();
  }
}


void update()
{
  if(simulateButton.isPressed == true) // if the simulate button is pressed
  {
    state = 1; // it loads scene 1
  }
}

void showCorrectCall()
{
  imageMode(CENTER);
  image(im112, width / 2, height / 2);
}

boolean playMovie(Movie movie)
{
  movie.play();
  imageMode(CENTER);
  image(movie, width / 2, height / 2, width, height);
  // println(movie + " played");

  if (movie.time() >= movie.duration())
  { 
    return true; // it finished
  }
  else return false;
}


void showMainMenu() //scene 0, state 0
{
  simulateButton.display(); // the simulate button
}

void showScene1() // there is fire, and 
{
/*
--> fire and clicking fire alarm video. The call options appear. Create a try again button for scene1
             --> if the user clicks on 112 -> showScene[2] == true
             --> else if the user clicks on:
                       --> 114 --> show iamge of 114 to explain why it's wrong, and the try again button
                       --> mother --> show image of mother to explain why it's wrong, and the try again button
                       --> best friend --> show image of best friend to explain why it's wrong, and the try again button
                   --> then the user restarts that scene --> showScene[1] == true
*/

  if(playMovie(fireAlarmAndCallMovie) == true) // if the movie finished playing
  {
    showOptionsForCall();
  }

}

void showScene2()
{
  if(playMovie(choosingTheFireExtinguisherMovie) == true) // if the movie finished playing
  {
    showOptionsForChoosingFireExtinguishers();
  }
}


void showOptionsForCall()
{
  imageMode(CENTER);
  image(chooseCallIm, width / 2, height / 2);
  
  for(int i = 0; i < callOptionsButtons.length; i++)
  {
    callOptionsButtons[i].display();
  }
  
  if(callOptionsButtons[0].isPressed == true) // if the user clicks on option 112
  {
    println("112 pressed");
    imageMode(CENTER);
    image(im112, width / 2, height / 2);
  }
  
  else if(callOptionsButtons[2].isPressed == true) // if the user clicks on option 114
  {
    println("114 pressed");
    imageMode(CENTER);
    image(im114, width / 2, height / 2);
  }
  else if(callOptionsButtons[1].isPressed == true) // if the user clicks on option mother
  {
    println("Mother option pressed");
    imageMode(CENTER);
    image(motherIm, width / 2, height / 2);
  }
  else if(callOptionsButtons[3].isPressed == true) // if the user clicks on option best friend
  {
    println("Best friend option pressed");
    imageMode(CENTER);
    image(bestFriendIm, width / 2, height / 2);
  }
  else if(callOptionsButtons[4].isPressed == true) // if the user clicks on option continue
  {
    println("Continue button pressed");
    state = 2; // start scene 2
  }
  else if(callOptionsButtons[5].isPressed == true) // if the user clicks on option try again
  {
    println("Try again button pressed");
    state = 1; // start with scene 1
  }
}


void showOptionsForChoosingFireExtinguishers()
{
  println("Showed options for choosing fire extinguishers");
}



/*
 Use millis() to make the boolean to show the text true or false


millis() ->   Returns the number of milliseconds (thousandths of a second) since starting the program.



*/


/*
void mouseClicked()
{
  simulateButton.update();
  
  
  for(int i = 0; i < callOptionsButtons.length; i++)
  {
    callOptionsButtons[i].update();
  }
  
}
*/


/*

set up a timer to press automatically on the continue button

and don't start the timer if the user clicks on the wrong options

*/