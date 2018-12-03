// Implementation of the P1 project

import processing.video.*;

// Continue images
PImage simulateIm, callEmergencyIm, findFireExtinguishersIm, getOutOfBuildingIm;

// Option Images
PImage option1Im, option2Im, option3Im, option4Im;

Movie fireAlarmMovie, callMovie, findFireExtinguishersMovie, getOutOfBuildingMovie;


int numberOfScenes = 10;  // the amount of scenes that are in the simulation
boolean [] showScene = new boolean[numberOfScenes];


// the continueButtons
int numberOfcontinueButtons = 10;
Button[] continueButtons = new Button[numberOfcontinueButtons];

int numberOfOptions = 16;
Button[] optionButtons = new Button[numberOfOptions];


void setup()
{
  size(1280, 720); // same as the video file

  // fullScreen(); // to make the size of the interface the same as the device's screen 

  frameRate(30); // framerate of the video

  // declaring the movies
  fireAlarmMovie = new Movie(this, "searching for fire alarm.mp4"); // declaring the movie
  //  fireAlarmMovie.pause();
  callMovie = new Movie(this, "call.mp4"); // call emergency movie
  findFireExtinguishersMovie = new Movie(this, "search for fire extinguisher.mp4");
  getOutOfBuildingMovie = new Movie(this, "search for fire exit sign.mp4");


  // loading the images
  simulateIm = loadImage("simulate.jpg");
  callEmergencyIm = loadImage("call emergency.jpg");
  findFireExtinguishersIm = loadImage("find the fire extinguishers.jpg");
  getOutOfBuildingIm = loadImage("get out of the building.jpg");

  // option images
  option1Im = loadImage("option 1.jpg");
  option2Im = loadImage("option 2.jpg");
  option3Im = loadImage("option 3.jpg");
  option4Im = loadImage("option 4.jpg");

  // declaring the continueButtons

  //  x, y, width of button, height of button, text of button, text size, r, g, b
  continueButtons[0] = new Button(width / 4, height / 2, 300, 200, "SIMULATE", 32, 255, 0, 0, simulateIm); // to play the movie of fire in the kitchen and searching for the fire alarm
  continueButtons[1] = new Button(width / 4, height / 2, 300, 200, "Call emergency", 32, 255, 0, 0, callEmergencyIm); // to play the movie of calling emergency
  continueButtons[2] = new Button(width / 4, height / 2, 300, 200, "Find the fire extinguishers", 32, 255, 0, 0, findFireExtinguishersIm); // to play the movie of searching for the fire extinguishers
  continueButtons[3] = new Button(width / 4, height / 2, 300, 200, "Get out of the building.\nChoose which path to take", 32, 255, 0, 0, getOutOfBuildingIm); // to play the movie of searching for the fire exit sign

  optionButtons[0] = new Button(width / 2, 0, 300, 200, "Option 1", 32, 0, 0, 255, option1Im);
  optionButtons[1] = new Button(width / 2, 200, 300, 200, "Option 2", 32, 0, 0, 255, option2Im);
  optionButtons[2] = new Button(width / 2, 400, 300, 200, "Option 3", 32, 0, 0, 255, option3Im);
  optionButtons[3] = new Button(width / 2, 600, 300, 200, "Option 4", 32, 0, 0, 255, option4Im);

  optionButtons[4] = new Button(width / 2, 0, 300, 200, "Option 1", 32, 0, 0, 255, option1Im);
  optionButtons[5] = new Button(width / 2, 200, 300, 200, "Option 2", 32, 0, 0, 255, option2Im);
  optionButtons[6] = new Button(width / 2, 400, 300, 200, "Option 3", 32, 0, 0, 255, option3Im);
  optionButtons[7] = new Button(width / 2, 600, 300, 200, "Option 4", 32, 0, 0, 255, option4Im);

  optionButtons[8] = new Button(width / 2, 0, 300, 200, "Option 1", 32, 0, 0, 255, option1Im);
  optionButtons[9] = new Button(width / 2, 200, 300, 200, "Option 2", 32, 0, 0, 255, option2Im);
  optionButtons[10] = new Button(width / 2, 400, 300, 200, "Option 3", 32, 0, 0, 255, option3Im);
  optionButtons[11] = new Button(width / 2, 600, 300, 200, "Option 4", 32, 0, 0, 255, option4Im);

  optionButtons[12] = new Button(width / 2, 0, 300, 200, "Option 1", 32, 0, 0, 255, option1Im);
  optionButtons[13] = new Button(width / 2, 200, 300, 200, "Option 2", 32, 0, 0, 255, option2Im);
  optionButtons[14] = new Button(width / 2, 400, 300, 200, "Option 3", 32, 0, 0, 255, option3Im);
  optionButtons[15] = new Button(width / 2, 600, 300, 200, "Option 4", 32, 0, 0, 255, option4Im);
}


// Called every time a new frame is available to read
void movieEvent(Movie m)
{
  m.read();
}

void draw()
{ 

  continueButtons[0].display();


  if (continueButtons[0].isPressed == true) // if the button in the main menu is pressed, then the video will start
  {
    continueWithSimulation(fireAlarmMovie, 1);
  }
  if (continueButtons[1].isPressed == true)
  {
    showOptionsForCall();
    if (optionButtons[0].isPressed)
    {
      continueWithSimulation(callMovie, 2);
    } else if (optionButtons[1].isPressed || optionButtons[2].isPressed || optionButtons[3].isPressed)
    {
      showExplanation();
      showOptionsForCall();
    }
  }

  if (continueButtons[2].isPressed == true)
  {
    println("the continue button 2 has been pressed");
    showOptionsForFireExtinguishers();
    if (optionButtons[0].isPressed)
    {
      continueWithSimulation(findFireExtinguishersMovie, 3);
    } else if (optionButtons[1].isPressed || optionButtons[2].isPressed || optionButtons[3].isPressed)
    {
      showExplanation();
      showOptionsForFireExtinguishers();
    }
  }

  if (continueButtons[3].isPressed == true)
  {
    showOptionsForExitPath();
    if (optionButtons[0].isPressed)
    {
      continueWithSimulation(getOutOfBuildingMovie, 4);
    } else if (optionButtons[1].isPressed || optionButtons[2].isPressed || optionButtons[3].isPressed)
    {
      showExplanation();
      showOptionsForExitPath();
    }
  }
}


void continueWithSimulation(Movie movie, int buttonNumber)
{
  movie.play();
  image(movie, 0, 0, width, height);
  // println(movie + " played");

  if (movie.time() >= movie.duration())
  {
    // println(movie + " Video finished");


    if (buttonNumber == 4)
    {
      textAlign(CENTER);
      textSize(50);
      fill(0);
      text("It is done!\nYou have finished the simulation successfully!", width / 2, height / 2);
    } else
    {
      continueButtons[buttonNumber].display();
    }
  }
}

void wrongAnswer()
{
}

void showOptionsForCall()
{
  for (int i = 0; i < 4; i++)
  {
    optionButtons[i].display();
  }
  println("Call Options shown");
}

void showOptionsForFireExtinguishers()
{
  for (int i = 4; i < 9; i++)
  {
    optionButtons[i].display();
  }
  println("Fire extinguisher Options shown");
}

void showOptionsForExitPath()
{
  for (int i = 10; i < 13; i++)
  {
    optionButtons[i].display();
  }
  println("Exit paths Options shown");
}


void showExplanation()
{
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("This is wrong in this scenario\n because of this, this and that\nTry again", width / 2, height /2);
}
