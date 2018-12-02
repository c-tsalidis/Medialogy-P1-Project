class Button
{
  // Variables of the button
  int x;
  int y;
  int buttonWidth;
  int buttonHeight;
  String text;
  color buttonColor;
  int textSize;
  boolean fill = false;
  boolean isPressed = false;
  PImage image;
  
  Button(int temp_x, int temp_y, int temp_buttonWidth, int temp_buttonHeight, String temp_text, int temp_text_size, int temp_r, int temp_g, int temp_b, PImage temp_image)
  {
    // Visuals
    x = temp_x;
    y = temp_y;
    buttonWidth = temp_buttonWidth;
    buttonHeight = temp_buttonHeight;
    text = temp_text;
    textSize = temp_text_size;
    buttonColor = color(temp_r, temp_g, temp_b);
    image = temp_image;
  }
  
  void display()
  {
    
    if(fill == true)
      fill(buttonColor, 100);
    else
      fill(buttonColor, 50);
    rect(x, y, buttonWidth, buttonHeight);
    
    /*
    fill(0);
    textSize(textSize);
    textAlign(CENTER, CENTER);
    text(text, x + (buttonWidth / 2), y + (buttonHeight / 2));
    */
    
    image(image, x, y, buttonWidth, buttonHeight);
    
    update();
    
  }
  
  void update()
  {
    if(mouseX >= x && mouseX <= (x + buttonWidth) && mouseY >= y && mouseY <= (y + buttonHeight))
    {
      if(mousePressed == true)
      {
        fill = true; // to show the user that he clicked on the button
        isPressed = true;
        println("Button pressed");
      }

    }
  }

}
