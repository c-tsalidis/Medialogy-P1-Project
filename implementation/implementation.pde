// Implementation of the P1 project

import processing.video.*;

// main menu image
PImage mainMenuIm;

// phone call images
PImage im112, im114, bestFriendIm, motherIm, chooseCallIm;

// choosing the correct fire extinguishers
PImage allFireExtinguishersIm, fireExtinguisherCO2Im, fireExtinguisherDryPowderIm, fireExtinguisherFoamIm, fireExtinguisherWaterIm;

// choosing how to use the fire extinguisher
// PImage howToOptionsIm, howToPullIm, howToOneIm, howToAimIm, howToTwoIm, howToSqueezeIm, howToThreeIm, howToSweepIm, howToCorrectIm, howToWrongIm;
PImage howToUseFireExtinguisherAllOptionsIm, howToUseFireExtinguisherCorrectIm, howToUseFireExtinguisherWrongIm;

// choosing the path to take
PImage threeDoorsOptionsIm, threeDoorsHallwayIm, threeDoorsBridgeIm, threeDoorsExitIm;


// end of simulation image
PImage endOfSimulationIm;

// Declaring the different movies
Movie fireAlarmAndCallMovie, choosingTheFireExtinguisherMovie, findFireExtinguishersMovie, searchingForFireExitMovie, goingToFireEscapeMovie;



// the value of state determines the scene that is displayed
int state = 0;


// different scenes states
int mainMenuScenarioState = 0; // main menu state
int fireAlarmAndCallingScenarioState = 1; // fire alarm and calling scene state
int choosingFireExtinguisherScenarioState = 2; // choosing fire extinguisher scene state 
int howToUseFireExtinguisherScenarioState = 3; // how to use fire extinguisher scene state
int choosingTheCorrectExitPathScenarioState = 4; // choosing the correct exit path scene state
int goingToTheCorrectExitPathScenarioState = 5; // going to the correct exit path scene state



// states inside the different scenarios --> different options inside each scene

// phone call scenario options
int callState = 0; // default call scene
int callState112 = 1; // calling 112 call scene
int callStateMother = 2; // calling mother call scene
int callState114 = 3; // calling 114 call scene
int callStateBestFriend = 4; // calling best friend call scene
int callStateContinue = 5; // clicking in continue call scene

// choosing fire extinguisher scenario options
int choosingFireExtinguisherState = 0; // the state that defines what the user interacts with inside of the choosing which fire extinguisher to use
// choosing fire extinguisher options states
int allFireExtinguisherState = 0; // default choosing the fire extinguisher scene
int dryPowderState = 1; // dry powder choosing the fire extinguisher scene
int foamState = 2; // foam state in choosing the fire extinguisher scene
int waterState = 3; // water state in choosing the fire extinguisher scene
int co2State = 4; // co2 state in choosing the fire extinguisher scene
int choosingFireExtinguisherTryAgainState = 5; // try again state because the answer was wrong state in choosing the fire extinguisher scene
int choosingFireExtinguisherContinueState = 6; // continue state because answer was right state in choosing the fire extinguisher scene

// how to use fire extinguisher scenario options
int choosingHowToUseFireExtinguisherState = 0; // the state that defines what the user interacts with inside of the choosing how to use the fire extinguisher scene
// how to use fire extinguisher options states
int howToUseAllOptionsState = 0; // the default state in choosing how to use the fire extinguisher scene
int howToUseCorrectState = 4; // the correct state in choosing how to use the fire extinguisher scene
int [] howToUseWrongState = {1, 2, 3}; // the three wrong states in the choosing how to use the fire extinguisher scene 

// choosing the correct exit path scenario options
int choosingPathState = 0; // the state that defines what the user interacts with indside of the choosing the correct exit path scene
// choosing the correct exit path options states
int threeDoorsState = 0; // default state in the choosing the exit path scene
int threeDoorsBridgeState = 1; // bridge state in the choosing the exit path scene
int threeDoorsHallwayState = 2; // hallway dooe state in choosing the exit path scene
int threeDoorsExitSignState = 3; // correct emergency exit state in choosing the exit path scene
int threeDoorsTryAgainState = 4; // wrong state in the choosing the exit sign scene
int threeDoorsContinueState = 5; // continue because the user is correct in the choosing the exit path scene


int sequenceState = 0;
int continueButtonState = 0;

// the sequence states
int allOptionsLeftState = 0, threeOptionsLeft = 1, twoOptionsLeft = 2, oneOptionLeft = 3, passState = 4; // different states in sequence
int continueToThreeOptionsLeftButton = 1, continueToTwoOptionsLeftButton = 2, continueToOneOptionLeftButton = 3, continueToPassButton = 4, continueToNextSceneButton = 5;


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
Button [] choosingFireExtinguisherOptionsButtons = new Button[6];
/*
  
 --> CO2
 --> Water
 --> Foam
 --> Dry powder
 --> Continue
 --> try again
 
 */

// button options for choosing how to use the fire extinguisher
Button [] choosingHowToUseFireExtinguisherButtons = new Button[6];
/*

  --> pull out safety pin
  --> aim at the base of the fire
  --> squezze slow and even on the lever
  --> sweep the nozzle horizontally
  --> try again
  --> continue

*/


// button options for choosing the exit path
Button [] choosingTheExitPathButtons = new Button[5];
/*

  --> the bridge
  --> hallway
  --> exit sign
  --> try again
  --> continue

*/

// simulate button of the main menu
Button simulateButton;

// quit button to quit the simulation
Button quitButton;

void setup()
{
  size(1920, 1080); // the same size as the videos that will play
  // fullScreen(); // to make the size of the interface the same as the device's screen 

  frameRate(30); // framerate of the video

  // declaring and initializing the simulation movies
  fireAlarmAndCallMovie = new Movie(this, "Animated video/searching for fire alarm and calling.mp4"); // video that shows the fire in the microwave searching for the fire alarm and calling
  choosingTheFireExtinguisherMovie = new Movie(this, "Animated video/choosing fire extinguisher.mp4"); // video of going towards the fire extinguishers to choose the correct one
  findFireExtinguishersMovie = new Movie(this, "Animated video/choosing how to use fire extinguisher.mp4"); // video that goes towards the microwave to choose how to extinguish the fire
  searchingForFireExitMovie = new Movie(this, "Animated video/searching for fire exit sign.mp4"); // video of searching for the correct exit
  goingToFireEscapeMovie = new Movie(this, "Animated video/going to fire escape.mp4"); // video of going towards the emergency exit


  // declaring and initializing the simulation images

  // main menu image
  mainMenuIm = loadImage("Illustrator files/Menu_simulation-01.png"); // image shown when the program is executed. It is the default image shown in the program --> the main menu

  // loading the phone call images
  im112 = loadImage("Illustrator files/Phone_112.png"); // image that will display if the user chooses the 112 call option
  im114 = loadImage("Illustrator files/Phone_114.png"); // image that will display if the user chooses the 114 call option
  bestFriendIm = loadImage("Illustrator files/Phone_Bestfriend.png"); // image that will display if the user chooses the best friend call option
  motherIm = loadImage("Illustrator files/Phone_Mother.png"); // image that will display if the user chooses the mother call option
  chooseCallIm = loadImage("Illustrator files/Phone_options.png"); // image that displays all of the options to call --> It's the default image

  // choosing the fire extinguisher images
  allFireExtinguishersIm = loadImage("Illustrator files/allFireExtinguishers.png"); // image that displays all of the fire extinguishers. It's the default image in the choosing the correct fire extinguisher scene
  fireExtinguisherCO2Im = loadImage("New/FireExtinguishers_info_co2.png"); // image that will display if the user chooses the CO2 fire extinguisher option
  fireExtinguisherDryPowderIm = loadImage("New/FireExtinguishers_info_dry powder.png"); // image that will display if the user chooses the dry powder fire extinguisher option
  fireExtinguisherFoamIm = loadImage("New/FireExtinguishers_info_foam.png"); // image that will display if the user chooses the foam fire extinguisher option
  fireExtinguisherWaterIm = loadImage("New/FireExtinguishers_info_Water.png"); // image that will display if the user chooses the water fire extinguisher option

  howToUseFireExtinguisherAllOptionsIm = loadImage("New/how to use fire extinguisher.png"); // image that displays all of the options in the choosing how to use the fire extinguisher scene
  howToUseFireExtinguisherCorrectIm = loadImage("New/how to use fire extinguisher correct.png"); // image that displays if the user chooses the correct way to use the fire extinguisher (PASS)
  howToUseFireExtinguisherWrongIm = loadImage("New/how to use fire extinguisher wrong.png"); // image that displays if the user chooses the wrong way to use the fire extinguisher

  // path to take images
  threeDoorsOptionsIm = loadImage("Illustrator files/threedoors_options.png"); // image that displays all of the options in the choosing the correct exit path scene. It's the defualt image of this scene
  threeDoorsHallwayIm = loadImage("New/threedoors_Hallway.png"); // image that displays if the user chooses the hallway option
  threeDoorsBridgeIm = loadImage("New/threedoors_bridge.png"); // image that shows if the user chooses the bridge option
  threeDoorsExitIm = loadImage("New/threedoors_Exit door.png"); // image that displays if the user chooses the emergency exit ( with the exit sign on top of the door)

  // end of simulation image
  endOfSimulationIm = loadImage("Illustrator files/End_simulation.png"); // image displayed when the user has finished the simulation


  // declaring and initializing the buttons of the program
  //  the buttons have as parameters the coordinates of x and y, as well as the width and height of the buttons. They are of type integer (int)
  
  // the main menu buttons
  simulateButton = new Button(810, 640, 1100 - 810, 740 - 640); // the simulate button

  // call option buttons
  callOptionsButtons[0] = new Button(1160, 350, 600, 90); // 112
  callOptionsButtons[1] = new Button(1160, 450, 600, 90); // 114
  callOptionsButtons[2] = new Button(1160, 550, 600, 90); // mother
  callOptionsButtons[3] = new Button(1160, 650, 600, 90); // friend
  callOptionsButtons[4] = new Button(605, 795, 300, 100); // continue
  callOptionsButtons[5] = new Button(610, 800, 300, 100); // try again


  // choosing fire extinguisher scene buttons
  choosingFireExtinguisherOptionsButtons[0] = new Button(375, 275, 225, 500); // Powder
  choosingFireExtinguisherOptionsButtons[1] = new Button(640, 340, 225, 500); // foam
  choosingFireExtinguisherOptionsButtons[2] = new Button(940, 280, 225, 500); // Water
  choosingFireExtinguisherOptionsButtons[3] = new Button(1260, 300, 225, 500); // CO2
  choosingFireExtinguisherOptionsButtons[4] = new Button(460, 840, 300, 100); // try again
  choosingFireExtinguisherOptionsButtons[5] = new Button(840, 840, 300, 100); // continue

  // choosing how to use the fire extinguisher buttons
  choosingHowToUseFireExtinguisherButtons[0] = new Button(430, 310, 400, 120); // pull out safety pin
  choosingHowToUseFireExtinguisherButtons[1] = new Button(430, 780, 400, 120); // aim at the base of the fire
  choosingHowToUseFireExtinguisherButtons[2] = new Button(430, 465, 400, 120); // squeeze slow and even on the lever
  choosingHowToUseFireExtinguisherButtons[3] = new Button(430, 620, 400, 120); // sweep the nozzle horizontally
  choosingHowToUseFireExtinguisherButtons[4] = new Button(828, 813, 320, 100); // Try again -> show the 'wrong image'
  choosingHowToUseFireExtinguisherButtons[5] = new Button(1160, 810, 320, 100); // continue -> show the 'pass' image
  

  // choosing the exit path options buttons
  choosingTheExitPathButtons[0] = new Button(300, 100, 780 - 300, 670); // bridge
  choosingTheExitPathButtons[1] = new Button(790, 100, 380, 662); // hallway
  choosingTheExitPathButtons[2] = new Button(790 + 480, 100, 480, 670); // exit sign
  choosingTheExitPathButtons[3] = new Button(650, 780, 300, 100); // try again
  choosingTheExitPathButtons[4] = new Button(1040, 780, 300, 100); // continue


  // the end of the simulation scene button
  quitButton = new Button(800, 500, 400, 200); // the quit button to end the simulation
}



//  This event function is run when a new movie frame is available. 
//  The read() method is used to capture this frame. 
//  If there is more than one movie in the program, movieEvent() is called each time any of the movies has a new frame available 
// This function is called every time a new frame is available to read.
//  It's an event, and it's necessary for the movies to play accordingly
void movieEvent(Movie m)
{
  //  .read() --> Reads the current frame of the movie
  m.read();
}




void draw()
{
    imageMode(CENTER);

  // println("MouseX: " + mouseX + "  |  MouseY: " + mouseY); // shows where the cursor is while the program is running. Used mainly to know the coordinates of the buttons
  
  showScene(); // function that displays the scene depending on the state
  update(); // checks if the simulate button is pressed. In this case, it will switch the state of the simulation to the finding the fire alarm and calling state
}

// function that displays the scene according to the state of the program
void showScene()
{
  if (state == mainMenuScenarioState) // if the state of the program is the same as the main menu state
  {
    showMainMenu(); // it shows the main menu scene
  }
  if (state == fireAlarmAndCallingScenarioState) // if the state of the program is the same as finding the fire alarm and calling state
  {
    showScene1(); // shows the finding the fire alarm and calling scene
  }
  if (state == choosingFireExtinguisherScenarioState) // if the state of the program is the same as choosing the extinguisher state
  {
    showScene2(); // shows the choosing the fire extinguisher scene
  }
  if (state == howToUseFireExtinguisherScenarioState) // if the state of the program is the same as the choosing how to use the fire extinguisher state
  {
    showScene3(); // shows the choosing how to use the fire extinguisher scene
  }
  if (state == choosingTheCorrectExitPathScenarioState) // if the state of the program is the same as choosing the correct exit path state
  {
    showScene4(); // shows the choosing the exit path scene
  }
  if (state == goingToTheCorrectExitPathScenarioState) // if the state of the program is the same as going to the correct exit path state
  {
    showScene5(); // shows the going to the correct exit path scene
  }
}


void update()
{
  if (simulateButton.isPressed == true) // if the simulate button is pressed
  {
    state = fireAlarmAndCallingScenarioState; // it sets the state of the program to the finding the fire alarm and calling scene
  }
}



/*
This function plays the movie that it receives as a parameter
Then, if the movie finishes, it returns a true boolean 
*/
boolean playMovie(Movie movie)
{
  movie.play(); // Plays the movie one time and stops at the last frame.
  imageMode(CENTER); // it sets the images in the center of the screen -->  interprets the second and third parameters of image() as the image's center point
  image(movie, width / 2, height / 2, width, height); // displays the current frame of the movie
  // println(movie + " played");

  if (movie.time() >= movie.duration()) // if the movie's current time is bigger than or equal than the duration of the movie
  { 
    return true; // it finished
  } else return false; // it didn't finish
}


// this function shows the main menu scene
void showMainMenu()
{
  imageMode(CENTER); // sets the image to the center of the screen --> it  interprets the second and third parameters of image() as the image's center point
  image(mainMenuIm, width / 2, height /2);
}

// shows the finding the fire alarm and calling scene
void showScene1() 
{
  if (playMovie(fireAlarmAndCallMovie) == true) // it plays the fire alarm movie, and if it ends
  {
    showOptionsForCall(); // shows the options for the phone call
  }
}

// shows the searching for the fire extinguishers scene
void showScene2()
{
  if (playMovie(choosingTheFireExtinguisherMovie) == true) // it plays the fire extinguishers movie, and if it ends
  {
    showOptionsForChoosingFireExtinguishers(); // shows the options for choosing the fire extinguishers
  }
}


void showScene3()
{
  if (playMovie(findFireExtinguishersMovie) == true) // if the movie finished playing
  {
    showOptionsForChoosingHowToUseFireExinguisher();
  }
}
void showScene4()
{
  if (playMovie(searchingForFireExitMovie) == true) // if the movie finished playing
  {
    showOptionsForSearchingForFireExit();
  }
}
void showScene5()
{
  if (playMovie(goingToFireEscapeMovie) == true) // if the movie finished playing
  {
    goingToFireEscape();
  }
}
void showScene6()
{
  if(playMovie(goingToFireEscapeMovie) == true)
  {

  }  
}


void showOptionsForCall()
{
  imageMode(CENTER);
  image(chooseCallIm, width / 2, height / 2);

  if (callState == callState112)
  {
    imageMode(CENTER);
    image(im112, width / 2, height / 2);
  }
  if (callState == callStateMother)
  {
    imageMode(CENTER);
    image(motherIm, width / 2, height / 2);
  }
  if (callState == callState114)
  {
    imageMode(CENTER);
    image(im114, width / 2, height / 2);
  }
  if (callState == callStateBestFriend)
  {
    imageMode(CENTER);
    image(bestFriendIm, width / 2, height / 2);
  }

  if (callState == callStateContinue)
  {
    state = choosingFireExtinguisherScenarioState;
  }
}


void showOptionsForChoosingFireExtinguishers()
{


  // println("Showed options for choosing fire extinguishers");
  // imageMode(CENTER);
  // image(allFireExtinguishersIm, width / 2, height / 2);


  if(choosingFireExtinguisherState == allFireExtinguisherState)
  {
    imageMode(CENTER);
    image(allFireExtinguishersIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == dryPowderState)
  {
    imageMode(CENTER);
    image(fireExtinguisherDryPowderIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == foamState)
  {
    imageMode(CENTER);
    image(fireExtinguisherFoamIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == waterState)
  {
    imageMode(CENTER);
    image(fireExtinguisherWaterIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == co2State)
  {
    imageMode(CENTER);
    image(fireExtinguisherCO2Im, width / 2, height / 2);
  }

  if (choosingFireExtinguisherState == choosingFireExtinguisherTryAgainState)
  {
    choosingFireExtinguisherState = allFireExtinguisherState;
  }
  if (choosingFireExtinguisherState == choosingFireExtinguisherContinueState)
  {
    state = howToUseFireExtinguisherScenarioState;
  }
}




void showOptionsForChoosingHowToUseFireExinguisher()
{

  imageMode(CENTER);
  if(choosingHowToUseFireExtinguisherState == 0)
  {
    image(howToUseFireExtinguisherAllOptionsIm, width / 2, height / 2);
  }
  else if(choosingHowToUseFireExtinguisherState ==  4)
  {
    image(howToUseFireExtinguisherCorrectIm, width / 2, height / 2);
  }
  else if(choosingHowToUseFireExtinguisherState ==  howToUseWrongState[0] || 
          choosingHowToUseFireExtinguisherState ==  howToUseWrongState[1] || 
          choosingHowToUseFireExtinguisherState ==  howToUseWrongState[2])
  {
    image(howToUseFireExtinguisherWrongIm, width / 2, height / 2);
  }
  
}




void showOptionsForSearchingForFireExit()
{

  if(choosingPathState == threeDoorsState)
  {
    imageMode(CENTER);
    image(threeDoorsOptionsIm, width / 2, height / 2);
  }
  if (choosingPathState == threeDoorsBridgeState)
  {
    imageMode(CENTER);
    image(threeDoorsBridgeIm, width / 2, height / 2);
  }
  if (choosingPathState == threeDoorsHallwayState)
  {
    imageMode(CENTER);
    image(threeDoorsHallwayIm, width / 2, height / 2);
  }
  if (choosingPathState == threeDoorsExitSignState)
  {
    imageMode(CENTER);
    image(threeDoorsExitIm, width / 2, height / 2);
  }

  if (choosingPathState == threeDoorsTryAgainState)
  {
    choosingPathState = threeDoorsState; // try again
  }
  if (choosingPathState == threeDoorsContinueState) // continue
  {
    state = goingToTheCorrectExitPathScenarioState;
  }
}


void goingToFireEscape()
{
  println("End of fire simulation");
  imageMode(CENTER);
  image(endOfSimulationIm, width /2, height /2);
}





void mouseClicked()
{
  // println("mouse clicked");


  // simulate button
  if (mouseX >= simulateButton.x && mouseX <= (simulateButton.x + simulateButton.buttonWidth) && mouseY >= simulateButton.y && mouseY <= (simulateButton.y + simulateButton.buttonHeight) && state == 0)
  {
    simulateButton.isPressed = true;
    println("simulate button clicked");
  } 


  // call options buttons

  else if (mouseX >= callOptionsButtons[0].x && mouseX <= (callOptionsButtons[0].x + callOptionsButtons[0].buttonWidth) && mouseY >= callOptionsButtons[0].y && mouseY <= (callOptionsButtons[0].y + callOptionsButtons[0].buttonHeight)  && state == fireAlarmAndCallingScenarioState)
  {
    callOptionsButtons[0].isPressed = true;
    println("112 clicked");
    callState = 1;
  } else if (mouseX >= callOptionsButtons[1].x && mouseX <= (callOptionsButtons[1].x + callOptionsButtons[1].buttonWidth) && mouseY >= callOptionsButtons[1].y && mouseY <= (callOptionsButtons[1].y + callOptionsButtons[1].buttonHeight)  && state == fireAlarmAndCallingScenarioState)
  {
    callOptionsButtons[1].isPressed = true;
    println("Mother clicked");
    callState = 2;
  } else if (mouseX >= callOptionsButtons[2].x && mouseX <= (callOptionsButtons[2].x + callOptionsButtons[2].buttonWidth) && mouseY >= callOptionsButtons[2].y && mouseY <= (callOptionsButtons[2].y + callOptionsButtons[2].buttonHeight)  && state == fireAlarmAndCallingScenarioState)
  {
    callOptionsButtons[2].isPressed = true;
    println("114 clicked");
    callState = 3;
  } else if (mouseX >= callOptionsButtons[3].x && mouseX <= (callOptionsButtons[3].x + callOptionsButtons[3].buttonWidth) && mouseY >= callOptionsButtons[3].y && mouseY <= (callOptionsButtons[3].y + callOptionsButtons[3].buttonHeight)  && state == fireAlarmAndCallingScenarioState)
  {
    callOptionsButtons[3].isPressed = true;
    println("Best friend clicked");
    callState = 4;
  } else if (mouseX >= callOptionsButtons[4].x && mouseX <= (callOptionsButtons[4].x + callOptionsButtons[4].buttonWidth) && mouseY >= callOptionsButtons[4].y && mouseY <= (callOptionsButtons[4].y + callOptionsButtons[4].buttonHeight)  && state == fireAlarmAndCallingScenarioState)
  {
    callOptionsButtons[4].isPressed = true;
    println("Continue clicked");
    callState = 5;
  } else if (mouseX >= callOptionsButtons[5].x && mouseX <= (callOptionsButtons[5].x + callOptionsButtons[5].buttonWidth) && mouseY >= callOptionsButtons[5].y && mouseY <= (callOptionsButtons[5].y + callOptionsButtons[5].buttonHeight)  && state == fireAlarmAndCallingScenarioState)
  {
    callOptionsButtons[5].isPressed = true;
    println("Try again clicked");
    callState = 6;
  } 

   // choosing the fire extinguisher options buttons

  else if (mouseX >= choosingFireExtinguisherOptionsButtons[0].x && mouseX <= (choosingFireExtinguisherOptionsButtons[0].x + choosingFireExtinguisherOptionsButtons[0].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[0].y && mouseY <= (choosingFireExtinguisherOptionsButtons[0].y + choosingFireExtinguisherOptionsButtons[0].buttonHeight)  && state == choosingFireExtinguisherScenarioState)
  {
    choosingFireExtinguisherOptionsButtons[0].isPressed = true;
    println("powder clicked");
    choosingFireExtinguisherState = 1;
  } else if (mouseX >= choosingFireExtinguisherOptionsButtons[1].x && mouseX <= (choosingFireExtinguisherOptionsButtons[1].x + choosingFireExtinguisherOptionsButtons[1].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[1].y && mouseY <= (choosingFireExtinguisherOptionsButtons[1].y + choosingFireExtinguisherOptionsButtons[1].buttonHeight)  && state == choosingFireExtinguisherScenarioState)
  {
    choosingFireExtinguisherOptionsButtons[1].isPressed = true;
    println("foam clicked");
    choosingFireExtinguisherState = 2;
  } else if (mouseX >= choosingFireExtinguisherOptionsButtons[2].x && mouseX <= (choosingFireExtinguisherOptionsButtons[2].x + choosingFireExtinguisherOptionsButtons[2].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[2].y && mouseY <= (choosingFireExtinguisherOptionsButtons[2].y + choosingFireExtinguisherOptionsButtons[2].buttonHeight)  && state == choosingFireExtinguisherScenarioState)
  {
    callOptionsButtons[2].isPressed = true;
    println("Water clicked");
    choosingFireExtinguisherState = 3;
  } else if (mouseX >= choosingFireExtinguisherOptionsButtons[3].x && mouseX <= (choosingFireExtinguisherOptionsButtons[3].x + choosingFireExtinguisherOptionsButtons[3].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[3].y && mouseY <= (choosingFireExtinguisherOptionsButtons[3].y + choosingFireExtinguisherOptionsButtons[3].buttonHeight)  && state == choosingFireExtinguisherScenarioState)
  {
    choosingFireExtinguisherOptionsButtons[3].isPressed = true;
    println("CO2 clicked");
    choosingFireExtinguisherState = 4;
  } 
  else if (mouseX >= choosingFireExtinguisherOptionsButtons[4].x && mouseX <= (choosingFireExtinguisherOptionsButtons[4].x + choosingFireExtinguisherOptionsButtons[4].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[4].y && mouseY <= (choosingFireExtinguisherOptionsButtons[4].y + choosingFireExtinguisherOptionsButtons[4].buttonHeight)  && state == choosingFireExtinguisherScenarioState)
  {
    choosingFireExtinguisherOptionsButtons[4].isPressed = true;
    println("all fire extinguishers clicked");
    choosingFireExtinguisherState = 5;
  }
  else if (mouseX >= choosingFireExtinguisherOptionsButtons[5].x && mouseX <= (choosingFireExtinguisherOptionsButtons[5].x + choosingFireExtinguisherOptionsButtons[5].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[5].y && mouseY <= (choosingFireExtinguisherOptionsButtons[5].y + choosingFireExtinguisherOptionsButtons[5].buttonHeight)  && state == choosingFireExtinguisherScenarioState)
  {
    choosingFireExtinguisherOptionsButtons[5].isPressed = true;
    println("continue clicked");
    choosingFireExtinguisherState = 6;
  } 


  // choosing how to use the fire extinguishers options buttons

  else if (mouseX >= choosingHowToUseFireExtinguisherButtons[0].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[0].x + choosingHowToUseFireExtinguisherButtons[0].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[0].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[0].y + choosingHowToUseFireExtinguisherButtons[0].buttonHeight)  && state == howToUseFireExtinguisherScenarioState)
  {
    //if(choosingHowToUseFireExtinguisherState == allOptionsLeftState && continueButtonState == 0)
    //{
      choosingHowToUseFireExtinguisherButtons[0].isPressed = true;
      println("Pull the safety pin clicked");
       choosingHowToUseFireExtinguisherState = 1;
    //  choosingHowToUseFireExtinguisherState = threeOptionsLeft;
    //  continueButtonState = continueToThreeOptionsLeftButton;
      // state = 4; // TEMPORARY --> CHANGE IT WHEN FINISHED DEBUGGING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //}
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[1].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[1].x + choosingHowToUseFireExtinguisherButtons[1].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[1].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[1].y + choosingHowToUseFireExtinguisherButtons[1].buttonHeight)  && state == howToUseFireExtinguisherScenarioState)
  {
    // if(choosingHowToUseFireExtinguisherState == threeOptionsLeft && continueButtonState == continueToThreeOptionsLeftButton)
    // {
      choosingHowToUseFireExtinguisherButtons[1].isPressed = true;
      println("Aim at the base of fire clicked");
       choosingHowToUseFireExtinguisherState = 2;
    //   choosingHowToUseFireExtinguisherState = twoOptionsLeft;
    //   continueButtonState = continueToTwoOptionsLeftButton;
    // }
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[2].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[2].x + choosingHowToUseFireExtinguisherButtons[2].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[2].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[2].y + choosingHowToUseFireExtinguisherButtons[2].buttonHeight)  && state == howToUseFireExtinguisherScenarioState)
  {
   //  if(choosingHowToUseFireExtinguisherState == twoOptionsLeft && continueButtonState == continueToTwoOptionsLeftButton)
    // {
      choosingHowToUseFireExtinguisherButtons[2].isPressed = true;
      println("Squeeze clicked");
      choosingHowToUseFireExtinguisherState = 3;
    //   choosingHowToUseFireExtinguisherState = oneOptionLeft;
    //   continueButtonState = continueToOneOptionLeftButton;
    // }
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[3].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[3].x + choosingHowToUseFireExtinguisherButtons[3].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[3].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[3].y + choosingHowToUseFireExtinguisherButtons[3].buttonHeight)  && state == howToUseFireExtinguisherScenarioState)
  {
    // if(choosingHowToUseFireExtinguisherState == oneOptionLeft && continueButtonState == continueToOneOptionLeftButton)
    // {
      choosingHowToUseFireExtinguisherButtons[3].isPressed = true;
      println("Sweep clicked");
      choosingHowToUseFireExtinguisherState = 4;
    //   choosingHowToUseFireExtinguisherState = passState;
    //   continueButtonState = continueToPassButton;
   //  }
  } 

  else if (mouseX >= choosingHowToUseFireExtinguisherButtons[4].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[4].x + choosingHowToUseFireExtinguisherButtons[4].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[4].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[4].y + choosingHowToUseFireExtinguisherButtons[4].buttonHeight)  && state == howToUseFireExtinguisherScenarioState)
  {
    println("try again button clicked");
    choosingHowToUseFireExtinguisherState = 0;
  }
  // continue button
  else if (mouseX >= choosingHowToUseFireExtinguisherButtons[5].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == howToUseFireExtinguisherScenarioState)
  {
    println("continue button clicked");
    state = 4;

  }
  // which exit path to take options buttons

  else if (mouseX >= choosingTheExitPathButtons[0].x && mouseX <= (choosingTheExitPathButtons[0].x + choosingTheExitPathButtons[0].buttonWidth) && mouseY >= choosingTheExitPathButtons[0].y && mouseY <= (choosingTheExitPathButtons[0].y + choosingTheExitPathButtons[0].buttonHeight)  && state == choosingTheCorrectExitPathScenarioState)
  {
    choosingTheExitPathButtons[0].isPressed = true;
    println("Door 1 clicked");
    choosingPathState = 1;
  } else if (mouseX >= choosingTheExitPathButtons[1].x && mouseX <= (choosingTheExitPathButtons[1].x + choosingTheExitPathButtons[1].buttonWidth) && mouseY >= choosingTheExitPathButtons[1].y && mouseY <= (choosingTheExitPathButtons[1].y + choosingTheExitPathButtons[1].buttonHeight)  && state == choosingTheCorrectExitPathScenarioState)
  {
    choosingTheExitPathButtons[1].isPressed = true;
    println("Door 2 clicked");
    choosingPathState = 2;
  } else if (mouseX >= choosingTheExitPathButtons[2].x && mouseX <= (choosingTheExitPathButtons[2].x + choosingTheExitPathButtons[2].buttonWidth) && mouseY >= choosingTheExitPathButtons[2].y && mouseY <= (choosingTheExitPathButtons[2].y + choosingTheExitPathButtons[2].buttonHeight)  && state == choosingTheCorrectExitPathScenarioState)
  {
    choosingTheExitPathButtons[2].isPressed = true;
    println("Exit sign clicked");
    choosingPathState = 3;
  } else if (mouseX >= choosingTheExitPathButtons[3].x && mouseX <= (choosingTheExitPathButtons[3].x + choosingTheExitPathButtons[3].buttonWidth) && mouseY >= choosingTheExitPathButtons[3].y && mouseY <= (choosingTheExitPathButtons[3].y + choosingTheExitPathButtons[3].buttonHeight)  && state == choosingTheCorrectExitPathScenarioState)
  {
    choosingTheExitPathButtons[3].isPressed = true;
    println("Try again clicked");
    choosingPathState = 4;
  } else if (mouseX >= choosingTheExitPathButtons[4].x && mouseX <= (choosingTheExitPathButtons[4].x + choosingTheExitPathButtons[4].buttonWidth) && mouseY >= choosingTheExitPathButtons[4].y && mouseY <= (choosingTheExitPathButtons[4].y + choosingTheExitPathButtons[4].buttonHeight)  && state == choosingTheCorrectExitPathScenarioState)
  {
    choosingTheExitPathButtons[4].isPressed = true;
    println("Continue clicked");
    choosingPathState = 5;
  }

  // the end of the simulation buttons
  else if (mouseX >= quitButton.x && mouseX <= (quitButton.x + quitButton.buttonWidth) && mouseY >= quitButton.y && mouseY <= (quitButton.y + quitButton.buttonHeight)  && state == goingToTheCorrectExitPathScenarioState)
  {
    quitButton.isPressed = true;
    println("Quit button clicked");
    exit();
  }


  else
  {
    println("button pressed = false");
    simulateButton.isPressed = false;
    for (int i = 0; i < callOptionsButtons.length; i++)
    {
      callOptionsButtons[i].isPressed = false;
    }
  }
}
