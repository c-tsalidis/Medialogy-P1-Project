class Button
{
  // Variables of the button
  int x;
  int y;
  int buttonWidth;
  int buttonHeight;
  boolean isPressed = false;
  String text;



  Button(int temp_x, int temp_y, int temp_buttonWidth, int temp_buttonHeight)
  {
    x = temp_x;
    y = temp_y;
    buttonWidth = temp_buttonWidth;
    buttonHeight = temp_buttonHeight;
  }

  Button(int temp_x, int temp_y, int temp_buttonWidth, int temp_buttonHeight, String temp_text)
  {
    x = temp_x;
    y = temp_y;
    buttonWidth = temp_buttonWidth;
    buttonHeight = temp_buttonHeight;
    text = temp_text;
  }


  void display()
  {
    text(text, x, y, buttonWidth, buttonHeight);
    // rect(x, y, buttonWidth, buttonHeight);
    update();
  }

  /*
  void update()
   {
   isPressed = false;
   if (mouseX >= x && mouseX <= (x + buttonWidth) && mouseY >= y && mouseY <= (y + buttonHeight))
   {
   if (mousePressed == true)
   {
   isPressed = true;
   // println("button pressed");
   }
   }
   }
   */

  // update but with the event mouseClicked instead of mousePressed
  void update()
  {
    // isPressed = false;
    // if (mouseX >= x && mouseX <= (x + buttonWidth) && mouseY >= y && mouseY <= (y + buttonHeight))
    // {
      // isPressed = true;
      // println("button pressed");
    // }
  }
}
