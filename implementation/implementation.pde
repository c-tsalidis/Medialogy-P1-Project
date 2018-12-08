// Implementation of the P1 project

import processing.video.*;

// main menu image
PImage mainMenuIm;

// phone call images
PImage im112, im114, bestFriendIm, motherIm, chooseCallIm;

// choosing the correct fire extinguishers
PImage allFireExtinguishersIm, fireExtinguisherCO2Im, fireExtinguisherDryPowderIm, fireExtinguisherFoamIm, fireExtinguisherWaterIm;

// choosing how to use the fire extinguisher
PImage howToOptionsIm, howToPullIm, howToOneIm, howToAimIm, howToTwoIm, howToSqueezeIm, howToThreeIm, howToSweepIm, howToCorrectIm, howToWrongIm;


// choosing the path to take
PImage threeDoorsOptionsIm, threeDoorsHallwayIm, threeDoorsBridgeIm, threeDoorsExitIm;


// end of simulation image
PImage endOfSimulationIm;

// Declaring the different movies
Movie fireAlarmAndCallMovie, choosingTheFireExtinguisherMovie, findFireExtinguishersMovie, searchingForFireExitMovie, goingToFireEscapeMovie;




int state = 0;
// call state
int callState = 0;
int choosingFireExtinguisherState = 0;
int choosingHowToUseFireExtinguisherState = 0;
int choosingPathState = 0;

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
Button [] choosingFireExtinguisherOptionsButtons = new Button[6];
/*
  
 --> CO2
 --> Water
 --> Foam
 --> Dry powder
 --> Continue
 
 */

// button options for choosing how to use the fire extinguisher
Button [] choosingHowToUseFireExtinguisherButtons = new Button[12];


// button options for choosing the exit path
Button [] choosingTheExitPathButtons = new Button[5];


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


  // main menu image
  mainMenuIm = loadImage("Illustrator files/Menu_simulation-01.png");

  // loading the phone call images
  im112 = loadImage("Illustrator files/Phone_112.png");
  im114 = loadImage("Illustrator files/Phone_114.png");
  bestFriendIm = loadImage("Illustrator files/Phone_Bestfriend.png");
  motherIm = loadImage("Illustrator files/Phone_Mother.png");
  chooseCallIm = loadImage("Illustrator files/Phone_options.png");

  // loading the choosing the fire extinguisher images
  allFireExtinguishersIm = loadImage("Illustrator files/allFireExtinguishers.png");
  fireExtinguisherCO2Im = loadImage("Illustrator files/FireExtinguishers_info_co2.png");
  fireExtinguisherDryPowderIm = loadImage("Illustrator files/FireExtinguishers_info_dry powder.png");
  fireExtinguisherFoamIm = loadImage("Illustrator files/FireExtinguishers_info_foam.png");
  fireExtinguisherWaterIm = loadImage("Illustrator files/FireExtinguishers_info_Water.png");

  // loading the choose how to use the fire extinguisher images
  howToOptionsIm = loadImage("Illustrator files/How_to_options.png");
  howToPullIm = loadImage("Illustrator files/How_to_Pull.png");
  howToOneIm = loadImage("Illustrator files/How_to_one.png");
  howToAimIm = loadImage("Illustrator files/How_to_Aim.png");
  howToTwoIm = loadImage("Illustrator files/How_to_two.png");
  howToSqueezeIm = loadImage("Illustrator files/How_to_Squeeze.png");
  howToThreeIm = loadImage("Illustrator files/How_to_three.png");
  howToSweepIm = loadImage("Illustrator files/How_to_Sweep.png");
  howToCorrectIm = loadImage("Illustrator files/How_to_Correct.png");
  howToWrongIm = loadImage("Illustrator files/How_to_wrong.png");


  // path to take images
  threeDoorsOptionsIm = loadImage("Illustrator files/threedoors_options.png");
  threeDoorsHallwayIm = loadImage("Illustrator files/threedoors_Hallway.png");
  threeDoorsBridgeIm = loadImage("Illustrator files/threedoors_bridge.png");
  threeDoorsExitIm = loadImage("Illustrator files/threedoors_Exit door.png");

  // end of simulation image
  endOfSimulationIm = loadImage("Illustrator files/End_simulation.png");


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


  // choosing fire extinguisher scene buttons
  choosingFireExtinguisherOptionsButtons[0] = new Button(375, 275, 225, 600, ""); // Powder
  choosingFireExtinguisherOptionsButtons[1] = new Button(640, 340, 225, 600, ""); // foam
  choosingFireExtinguisherOptionsButtons[2] = new Button(940, 280, 225, 600, ""); // Water
  choosingFireExtinguisherOptionsButtons[3] = new Button(1260, 300, 225, 600, ""); // CO2
  choosingFireExtinguisherOptionsButtons[4] = new Button(517, 160, 300, 100, ""); // try again
  choosingFireExtinguisherOptionsButtons[5] = new Button(960, 160, 300, 100, ""); // continue


  // choosing how to use the fire extinguisher buttons
  choosingHowToUseFireExtinguisherButtons[0] = new Button(430, 330, 350, 210, ""); // pull out safety pin
  choosingHowToUseFireExtinguisherButtons[1] = new Button(1175, 660, 350, 210, ""); // aim at the base of the fire
  choosingHowToUseFireExtinguisherButtons[2] = new Button(1140, 300, 350, 210, ""); // squeeze slow and even on the lever
  choosingHowToUseFireExtinguisherButtons[3] = new Button(390, 660, 350, 210, ""); // sweep the nozzle horizontally
  choosingHowToUseFireExtinguisherButtons[4] = new Button(1025, 805, 320, 100, ""); // continue in pull out safety pin
  choosingHowToUseFireExtinguisherButtons[5] = new Button(570, 800, 320, 100, ""); // continue in aim at the base of the fire
  choosingHowToUseFireExtinguisherButtons[6] = new Button(570, 800, 320, 100, ""); // continue in squeeze
  choosingHowToUseFireExtinguisherButtons[7] = new Button(1025, 805, 320, 100, ""); // continue in sweep
  choosingHowToUseFireExtinguisherButtons[8] = new Button(100, 100, 100, 100, ""); //
  choosingHowToUseFireExtinguisherButtons[9] = new Button(100, 100, 100, 100, ""); //
  choosingHowToUseFireExtinguisherButtons[10] = new Button(830, 795, 320, 100, ""); // Try again -> show the 'wrong image'
  choosingHowToUseFireExtinguisherButtons[11] = new Button(830, 795, 320, 100, ""); // continue -> show the 'pass' image


  // choosing the exit path options buttons
  choosingTheExitPathButtons[0] = new Button(100, 100, 100, 100, ""); // 
  choosingTheExitPathButtons[1] = new Button(100, 100, 100, 100, ""); // 
  choosingTheExitPathButtons[2] = new Button(100, 100, 100, 100, ""); // 
  choosingTheExitPathButtons[3] = new Button(100, 100, 100, 100, ""); // try again
  choosingTheExitPathButtons[4] = new Button(100, 100, 100, 100, ""); // continue
}


// Called every time a new frame is available to read
void movieEvent(Movie m)
{
  m.read();
}

void draw()
{

    imageMode(CENTER);
    // image(howToPullIm, width / 2, height / 2);
    // image(howToAimIm, width / 2, height / 2);
    // image(howToSqueezeIm, width / 2, height / 2);
    // image(howToSweepIm, width / 2, height / 2);
    // image(howToCorrectIm, width / 2, height / 2);


   println("MouseX: " + mouseX + "  |  MouseY: " + mouseY);
  
  showScene();
  update();
}

void showScene()
{
  if (state == 0) // if the main menu scene is true
  {
    showMainMenu();
  }
  if (state == 1) // finding fire alarm and calling
  {
    showScene1();
  }
  if (state == 2) // choosing the extinguisher
  {
    showScene2();
  }
  if (state == 3) // choosing how to use the extinguisher
  {
    showScene3();
  }
  if (state == 4) // choosing the correct exit path
  {
    showScene4();
  }
  if (state == 5) // going to the correct exit path
  {
    showScene5();
  }
  if (state == 6)
  {
    showScene6();
  }
}


void update()
{
  if (simulateButton.isPressed == true) // if the simulate button is pressed
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
  } else return false;
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

  if (playMovie(fireAlarmAndCallMovie) == true) // if the movie finished playing
  {
    showOptionsForCall();
  }
}

void showScene2()
{
  if (playMovie(choosingTheFireExtinguisherMovie) == true) // if the movie finished playing
  {
    showOptionsForChoosingFireExtinguishers();
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
{}


void showOptionsForCall()
{
  imageMode(CENTER);
  image(chooseCallIm, width / 2, height / 2);

  for (int i = 0; i < callOptionsButtons.length; i++)
  {
    callOptionsButtons[i].display();
  }


  if (callState == 1)
  {
    imageMode(CENTER);
    image(im112, width / 2, height / 2);
  }
  if (callState == 2)
  {
    imageMode(CENTER);
    image(motherIm, width / 2, height / 2);
  }
  if (callState == 3)
  {
    imageMode(CENTER);
    image(im114, width / 2, height / 2);
  }
  if (callState == 4)
  {
    imageMode(CENTER);
    image(bestFriendIm, width / 2, height / 2);
  }

  if (callState == 5)
  {
    state = 2;
  }
}


void showOptionsForChoosingFireExtinguishers()
{

  // CHANGE THIS SO THAT IF THE FIRE EXTINGUISHER STATE IS DIFFERENT THAN THE
  // OPTIONS CLICKED, THEN ALL THE EXTINGUISHERS DIASPPEAR,
  // AND ONLY THE OPTIONS APPEAR. ALSO MAKE THE CONTINUE AND DISAPPEAR BUTTONS FOR 
  // ALL OF THE OPTIONS (WRONG --> TRY AGAIN || CORRECT --> CONTINUE)


  // println("Showed options for choosing fire extinguishers");
  // imageMode(CENTER);
  // image(allFireExtinguishersIm, width / 2, height / 2);

  for (int i = 0; i < choosingFireExtinguisherOptionsButtons.length; i++)
  {
    choosingFireExtinguisherOptionsButtons[i].display();
  }

  if(choosingFireExtinguisherState == 0)
  {
    imageMode(CENTER);
    image(allFireExtinguishersIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 1)
  {
    imageMode(CENTER);
    image(fireExtinguisherDryPowderIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 2)
  {
    imageMode(CENTER);
    image(fireExtinguisherFoamIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 3)
  {
    imageMode(CENTER);
    image(fireExtinguisherWaterIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 4)
  {
    imageMode(CENTER);
    image(fireExtinguisherCO2Im, width / 2, height / 2);
  }

  if (choosingFireExtinguisherState == 5)
  {
    choosingFireExtinguisherState = 0;
  }
  if (choosingFireExtinguisherState == 6)
  {
    state = 3;
  }
}




void showOptionsForChoosingHowToUseFireExinguisher()
{
  // imageMode(CENTER);
  // image(howToOptionsIm, width / 2, height / 2);

  for (int i = 0; i < choosingHowToUseFireExtinguisherButtons.length; i++)
  {
    choosingHowToUseFireExtinguisherButtons[i].display();
  }

  if (choosingHowToUseFireExtinguisherState == 0) // default image
  {
    imageMode(CENTER);
    image(howToOptionsIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 1) // pull out safety pin
  {
    imageMode(CENTER);
    image(howToPullIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 2) // continue in pull out safety pin
  {
    imageMode(CENTER);
    image(howToOneIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 3) // aim at the base of fire
  {
    imageMode(CENTER);
    image(howToAimIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 4) // continue in aim at the base of fire
  {
    imageMode(CENTER);
    image(howToTwoIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 5) // squeeze 
  {
    imageMode(CENTER);
    image(howToSqueezeIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 6) // continue in squeeze 
  {
    imageMode(CENTER);
    image(howToThreeIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 7) // sweep
  {
    imageMode(CENTER);
    image(howToSweepIm, width / 2, height / 8);
  }
  if (choosingHowToUseFireExtinguisherState == 9) // continue in sweep
  {
    imageMode(CENTER);
    image(howToCorrectIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 10)
  {
    imageMode(CENTER);
    image(howToWrongIm, width / 2, height / 2);
  }
  if (choosingHowToUseFireExtinguisherState == 11) // try again state
  {
    choosingHowToUseFireExtinguisherState = 0;
  }
  if (choosingHowToUseFireExtinguisherState == 12) // continue 'pass' state
  {
    state = 4;
  }

}




void showOptionsForSearchingForFireExit()
{}

void goingToFireEscape()
{}









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

  else if (mouseX >= callOptionsButtons[0].x && mouseX <= (callOptionsButtons[0].x + callOptionsButtons[0].buttonWidth) && mouseY >= callOptionsButtons[0].y && mouseY <= (callOptionsButtons[0].y + callOptionsButtons[0].buttonHeight)  && state == 1)
  {
    callOptionsButtons[0].isPressed = true;
    println("112 clicked");
    callState = 1;
  } else if (mouseX >= callOptionsButtons[1].x && mouseX <= (callOptionsButtons[1].x + callOptionsButtons[1].buttonWidth) && mouseY >= callOptionsButtons[1].y && mouseY <= (callOptionsButtons[1].y + callOptionsButtons[1].buttonHeight)  && state == 1)
  {
    callOptionsButtons[1].isPressed = true;
    println("Mother clicked");
    callState = 2;
  } else if (mouseX >= callOptionsButtons[2].x && mouseX <= (callOptionsButtons[2].x + callOptionsButtons[2].buttonWidth) && mouseY >= callOptionsButtons[2].y && mouseY <= (callOptionsButtons[2].y + callOptionsButtons[2].buttonHeight)  && state == 1)
  {
    callOptionsButtons[2].isPressed = true;
    println("114 clicked");
    callState = 3;
  } else if (mouseX >= callOptionsButtons[3].x && mouseX <= (callOptionsButtons[3].x + callOptionsButtons[3].buttonWidth) && mouseY >= callOptionsButtons[3].y && mouseY <= (callOptionsButtons[3].y + callOptionsButtons[3].buttonHeight)  && state == 1)
  {
    callOptionsButtons[3].isPressed = true;
    println("Best friend clicked");
    callState = 4;
  } else if (mouseX >= callOptionsButtons[4].x && mouseX <= (callOptionsButtons[4].x + callOptionsButtons[4].buttonWidth) && mouseY >= callOptionsButtons[4].y && mouseY <= (callOptionsButtons[4].y + callOptionsButtons[4].buttonHeight)  && state == 1)
  {
    callOptionsButtons[4].isPressed = true;
    println("Continue clicked");
    callState = 5;
  } else if (mouseX >= callOptionsButtons[5].x && mouseX <= (callOptionsButtons[5].x + callOptionsButtons[5].buttonWidth) && mouseY >= callOptionsButtons[5].y && mouseY <= (callOptionsButtons[5].y + callOptionsButtons[5].buttonHeight)  && state == 1)
  {
    callOptionsButtons[5].isPressed = true;
    println("Try again clicked");
    callState = 6;
  } 

   // choosing the fire extinguisher options buttons

  else if (mouseX >= choosingFireExtinguisherOptionsButtons[0].x && mouseX <= (choosingFireExtinguisherOptionsButtons[0].x + choosingFireExtinguisherOptionsButtons[0].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[0].y && mouseY <= (choosingFireExtinguisherOptionsButtons[0].y + choosingFireExtinguisherOptionsButtons[0].buttonHeight)  && state == 2)
  {
    choosingFireExtinguisherOptionsButtons[0].isPressed = true;
    println("powder clicked");
    choosingFireExtinguisherState = 1;
  } else if (mouseX >= choosingFireExtinguisherOptionsButtons[1].x && mouseX <= (choosingFireExtinguisherOptionsButtons[1].x + choosingFireExtinguisherOptionsButtons[1].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[1].y && mouseY <= (choosingFireExtinguisherOptionsButtons[1].y + choosingFireExtinguisherOptionsButtons[1].buttonHeight)  && state == 2)
  {
    choosingFireExtinguisherOptionsButtons[1].isPressed = true;
    println("foam clicked");
    choosingFireExtinguisherState = 2;
  } else if (mouseX >= choosingFireExtinguisherOptionsButtons[2].x && mouseX <= (choosingFireExtinguisherOptionsButtons[2].x + choosingFireExtinguisherOptionsButtons[2].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[2].y && mouseY <= (choosingFireExtinguisherOptionsButtons[2].y + choosingFireExtinguisherOptionsButtons[2].buttonHeight)  && state == 2)
  {
    callOptionsButtons[2].isPressed = true;
    println("Water clicked");
    choosingFireExtinguisherState = 3;
  } else if (mouseX >= choosingFireExtinguisherOptionsButtons[3].x && mouseX <= (choosingFireExtinguisherOptionsButtons[3].x + choosingFireExtinguisherOptionsButtons[3].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[3].y && mouseY <= (choosingFireExtinguisherOptionsButtons[3].y + choosingFireExtinguisherOptionsButtons[3].buttonHeight)  && state == 2)
  {
    choosingFireExtinguisherOptionsButtons[3].isPressed = true;
    println("CO2 clicked");
    choosingFireExtinguisherState = 4;
  } 
  else if (mouseX >= choosingFireExtinguisherOptionsButtons[4].x && mouseX <= (choosingFireExtinguisherOptionsButtons[4].x + choosingFireExtinguisherOptionsButtons[4].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[4].y && mouseY <= (choosingFireExtinguisherOptionsButtons[4].y + choosingFireExtinguisherOptionsButtons[4].buttonHeight)  && state == 2)
  {
    choosingFireExtinguisherOptionsButtons[4].isPressed = true;
    println("all fire extinguishers clicked");
    choosingFireExtinguisherState = 5;
  }
  else if (mouseX >= choosingFireExtinguisherOptionsButtons[5].x && mouseX <= (choosingFireExtinguisherOptionsButtons[5].x + choosingFireExtinguisherOptionsButtons[5].buttonWidth) && mouseY >= choosingFireExtinguisherOptionsButtons[5].y && mouseY <= (choosingFireExtinguisherOptionsButtons[5].y + choosingFireExtinguisherOptionsButtons[5].buttonHeight)  && state == 2)
  {
    choosingFireExtinguisherOptionsButtons[5].isPressed = true;
    println("continue clicked");
    choosingFireExtinguisherState = 6;
  } 


  // choosing how to use the fire extinguishers options buttons

  else if (mouseX >= choosingHowToUseFireExtinguisherButtons[0].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[0].x + choosingHowToUseFireExtinguisherButtons[0].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[0].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[0].y + choosingHowToUseFireExtinguisherButtons[0].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[0].isPressed = true;
    println("112 clicked");
    choosingHowToUseFireExtinguisherState = 1;
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[1].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[1].x + choosingHowToUseFireExtinguisherButtons[1].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[1].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[1].y + choosingHowToUseFireExtinguisherButtons[1].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[1].isPressed = true;
    println("Mother clicked");
    choosingHowToUseFireExtinguisherState = 2;
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[2].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[2].x + choosingHowToUseFireExtinguisherButtons[2].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[2].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[2].y + choosingHowToUseFireExtinguisherButtons[2].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[2].isPressed = true;
    println("114 clicked");
    choosingHowToUseFireExtinguisherState = 3;
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[3].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[3].x + choosingHowToUseFireExtinguisherButtons[3].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[3].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[3].y + choosingHowToUseFireExtinguisherButtons[3].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[3].isPressed = true;
    println("Best friend clicked");
    choosingHowToUseFireExtinguisherState = 4;
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[4].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[4].x + choosingHowToUseFireExtinguisherButtons[4].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[4].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[4].y + choosingHowToUseFireExtinguisherButtons[4].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[4].isPressed = true;
    println("Continue clicked");
    choosingHowToUseFireExtinguisherState = 5;
  } else if (mouseX >= choosingHowToUseFireExtinguisherButtons[5].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[5].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 6;
  }
   else if (mouseX >= choosingHowToUseFireExtinguisherButtons[6].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[6].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 7;
  }
   else if (mouseX >= choosingHowToUseFireExtinguisherButtons[7].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[7].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 8;
  }
   else if (mouseX >= choosingHowToUseFireExtinguisherButtons[8].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[8].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 9;
  }
   else if (mouseX >= choosingHowToUseFireExtinguisherButtons[9].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[9].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 10;
  }
   else if (mouseX >= choosingHowToUseFireExtinguisherButtons[10].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[10].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 11;
  }
   else if (mouseX >= choosingHowToUseFireExtinguisherButtons[11].x && mouseX <= (choosingHowToUseFireExtinguisherButtons[5].x + choosingHowToUseFireExtinguisherButtons[5].buttonWidth) && mouseY >= choosingHowToUseFireExtinguisherButtons[5].y && mouseY <= (choosingHowToUseFireExtinguisherButtons[5].y + choosingHowToUseFireExtinguisherButtons[5].buttonHeight)  && state == 3)
  {
    choosingHowToUseFireExtinguisherButtons[11].isPressed = true;
    println("Try again clicked");
    choosingHowToUseFireExtinguisherState = 12;
  }




  // which exit path to take options buttons

  else if (mouseX >= choosingTheExitPathButtons[0].x && mouseX <= (choosingTheExitPathButtons[0].x + choosingTheExitPathButtons[0].buttonWidth) && mouseY >= choosingTheExitPathButtons[0].y && mouseY <= (choosingTheExitPathButtons[0].y + choosingTheExitPathButtons[0].buttonHeight)  && state == 4)
  {
    choosingTheExitPathButtons[0].isPressed = true;
    println("Door 1 clicked");
    choosingPathState = 1;
  } else if (mouseX >= choosingTheExitPathButtons[1].x && mouseX <= (choosingTheExitPathButtons[1].x + choosingTheExitPathButtons[1].buttonWidth) && mouseY >= choosingTheExitPathButtons[1].y && mouseY <= (choosingTheExitPathButtons[1].y + choosingTheExitPathButtons[1].buttonHeight)  && state == 4)
  {
    choosingTheExitPathButtons[1].isPressed = true;
    println("Door 2 clicked");
    choosingPathState = 2;
  } else if (mouseX >= choosingTheExitPathButtons[2].x && mouseX <= (choosingTheExitPathButtons[2].x + choosingTheExitPathButtons[2].buttonWidth) && mouseY >= choosingTheExitPathButtons[2].y && mouseY <= (choosingTheExitPathButtons[2].y + choosingTheExitPathButtons[2].buttonHeight)  && state == 4)
  {
    choosingTheExitPathButtons[2].isPressed = true;
    println("Exit sign clicked");
    choosingPathState = 3;
  } else if (mouseX >= choosingTheExitPathButtons[3].x && mouseX <= (choosingTheExitPathButtons[3].x + choosingTheExitPathButtons[3].buttonWidth) && mouseY >= choosingTheExitPathButtons[3].y && mouseY <= (choosingTheExitPathButtons[3].y + choosingTheExitPathButtons[3].buttonHeight)  && state == 4)
  {
    choosingTheExitPathButtons[3].isPressed = true;
    println("Try again clicked");
    choosingPathState = 4;
  } else if (mouseX >= choosingTheExitPathButtons[4].x && mouseX <= (choosingTheExitPathButtons[4].x + choosingTheExitPathButtons[4].buttonWidth) && mouseY >= choosingTheExitPathButtons[4].y && mouseY <= (choosingTheExitPathButtons[4].y + choosingTheExitPathButtons[4].buttonHeight)  && state == 4)
  {
    choosingTheExitPathButtons[4].isPressed = true;
    println("Continue clicked");
    choosingPathState = 5;
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
