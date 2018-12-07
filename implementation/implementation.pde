// Implementation of the P1 project

import processing.video.*;

// phone call images
PImage im112, im114, bestFriendIm, motherIm, chooseCallIm;

// choosing a fire extinguisher image
PImage chooseAFireExtinguisherIm;

// choosing the correct fire extinguishers
PImage allFireExtinguishersIm;

// choosing how to use the fire extinguisher
PImage howToOptionsIm, howToPullIm, howToOneIm, howToAimIm, howToTwoIm, howToSqueezeIm, howToThreeIm, howToSweepIm, howToCorrectIm, howToWrongIm;


// choosin the path to take
PImage threeDoorsOptionsIm, threeDoorsHallwayIm, threeDoorsBridgeIm, threeDoorsExitIm;


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

// call state
int callState = 0;
int choosingFireExtinguisherState = 0;
int choosingHowToUseFireExtinguisherState = 0;
int choosingPathState = 0;


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

  // loading the choosing the fire extinguisher images
  allFireExtinguishersIm = loadImage("Illustrator files/allFireExtinguishers.png");

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


  /*
  // choosing fire extinguisher scene buttons
  fireExtinguisherOptions[0] = new Button(375, 275, 225, 848 - 275, ""); // Powder
  fireExtinguisherOptions[1] = new Button(640, 340, 890 - 640, 844 - 340, ""); // foam
  fireExtinguisherOptions[2] = new Button(940, 280, 1216 - 940, 856 - 280, ""); // Water
  fireExtinguisherOptions[3] = new Button(1260, 300, 1577 - 1260, 850 - 300, ""); // CO2

  */
}


// Called every time a new frame is available to read
void movieEvent(Movie m)
{
  m.read();
}

void draw()
{

  imageMode(CENTER);
  image(allFireExtinguishersIm, width / 2, height / 2);

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
  if (state == 1)
  {
    showScene1();
  }
  if (state == 2)
  {
    showScene2();
  }
  if (state == 3)
  {
    showScene3();
  }
  if (state == 4)
  {
    showScene4();
  }
  if (state == 5)
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
{}
void showScene4()
{}
void showScene5()
{}
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
  println("Showed options for choosing fire extinguishers");
  imageMode(CENTER);
  image(howToOptionsIm, width / 2, height / 2);

  for (int i = 0; i < callOptionsButtons.length; i++)
  {
    callOptionsButtons[i].display();
  }


  if (choosingFireExtinguisherState == 1)
  {
    imageMode(CENTER);
    image(im112, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 2)
  {
    imageMode(CENTER);
    image(motherIm, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 3)
  {
    imageMode(CENTER);
    image(im114, width / 2, height / 2);
  }
  if (choosingFireExtinguisherState == 4)
  {
    imageMode(CENTER);
    image(bestFriendIm, width / 2, height / 2);
  }

  if (choosingFireExtinguisherState == 5)
  {
    state = 2;
  }
}


void mouseClicked()
{
  // println("mouse clicked");

  if (mouseX >= simulateButton.x && mouseX <= (simulateButton.x + simulateButton.buttonWidth) && mouseY >= simulateButton.y && mouseY <= (simulateButton.y + simulateButton.buttonHeight))
  {
    simulateButton.isPressed = true;
    println("simulate button clicked");
  } else if (mouseX >= callOptionsButtons[0].x && mouseX <= (callOptionsButtons[0].x + callOptionsButtons[0].buttonWidth) && mouseY >= callOptionsButtons[0].y && mouseY <= (callOptionsButtons[0].y + callOptionsButtons[0].buttonHeight))
  {
    callOptionsButtons[0].isPressed = true;
    println("112 clicked");
    callState = 1;
  } else if (mouseX >= callOptionsButtons[1].x && mouseX <= (callOptionsButtons[1].x + callOptionsButtons[1].buttonWidth) && mouseY >= callOptionsButtons[1].y && mouseY <= (callOptionsButtons[1].y + callOptionsButtons[1].buttonHeight))
  {
    callOptionsButtons[1].isPressed = true;
    println("Mother clicked");
    callState = 2;
  } else if (mouseX >= callOptionsButtons[2].x && mouseX <= (callOptionsButtons[2].x + callOptionsButtons[2].buttonWidth) && mouseY >= callOptionsButtons[2].y && mouseY <= (callOptionsButtons[2].y + callOptionsButtons[2].buttonHeight))
  {
    callOptionsButtons[2].isPressed = true;
    println("114 clicked");
    callState = 3;
  } else if (mouseX >= callOptionsButtons[3].x && mouseX <= (callOptionsButtons[3].x + callOptionsButtons[3].buttonWidth) && mouseY >= callOptionsButtons[3].y && mouseY <= (callOptionsButtons[3].y + callOptionsButtons[3].buttonHeight))
  {
    callOptionsButtons[3].isPressed = true;
    println("Best friend clicked");
    callState = 4;
  } else if (mouseX >= callOptionsButtons[4].x && mouseX <= (callOptionsButtons[4].x + callOptionsButtons[4].buttonWidth) && mouseY >= callOptionsButtons[4].y && mouseY <= (callOptionsButtons[4].y + callOptionsButtons[4].buttonHeight))
  {
    callOptionsButtons[4].isPressed = true;
    println("Continue clicked");
    callState = 5;
  } else if (mouseX >= callOptionsButtons[5].x && mouseX <= (callOptionsButtons[5].x + callOptionsButtons[5].buttonWidth) && mouseY >= callOptionsButtons[5].y && mouseY <= (callOptionsButtons[5].y + callOptionsButtons[5].buttonHeight))
  {
    callOptionsButtons[5].isPressed = true;
    println("Try again clicked");
    callState = 6;
  } else
  {
    println("button pressed = false");
    simulateButton.isPressed = false;
    for (int i = 0; i < callOptionsButtons.length; i++)
    {
      callOptionsButtons[i].isPressed = false;
    }
  }
}
