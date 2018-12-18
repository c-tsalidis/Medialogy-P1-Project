class Button
{
  // Variables of the button
  int x; // x coordinate of the button
  int y; // y coordinate of the button
  int buttonWidth; // width of the button
  int buttonHeight; // height of the button
  boolean isPressed = false; // to check if the button is pressed or not


  // Constructor of the Button
  Button(int temp_x, int temp_y, int temp_buttonWidth, int temp_buttonHeight)
  {
    x = temp_x;
    y = temp_y;
    buttonWidth = temp_buttonWidth;
    buttonHeight = temp_buttonHeight;
  }
}
