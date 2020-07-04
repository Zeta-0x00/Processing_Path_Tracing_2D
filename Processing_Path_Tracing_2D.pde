PImage img;
float xoff = 0, yoff = 0;
void setup()
{
  size(500, 500);
  img = loadImage("fondo.png");
  img.resize(500, 500);
  
}

void draw()
{
  //image(img, 0, 0);
  loadPixels();
  img.loadPixels();
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      int loc = x + y * width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      float d = dist(noise(xoff)*width, noise(yoff)*height, x, y);
      //float d = dist(mouseX*width, mouseY*height, x, y);  //If you wanna use the mouse
      float factor = map(d, 0, 100, 2, 0);
      pixels[loc] = color(r*factor, g*factor, b*factor);
    }
  }
  xoff += 0.01;
  yoff += 0.01;
  updatePixels();
}
