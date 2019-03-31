void redDot(float R, int value, int xdc, int ydc, float coordinates[])  //<>//
{
  //R is the radius from the red dot to the center
  //xdc and ydc is the coordinate of the center, red dot appears randomly around this center
  //coordinates return red dot's coordinates, coordinates[0] is x coordinate and coordinates[1] is y coordinate.
  float x=random(R)*randomOne();//random x
  float y=(pow(pow(R, 2)-pow(x, 2), 0.5))*randomOne();//Pythagorean theorem to calculate  y
  float rx=x+xdc;
  float ry=y+ydc;
  noStroke();
  fill(value, 0, 0);
  ellipse(rx, ry, 10, 10);
  coordinates[0]=rx;
  coordinates[1]=ry;
}

/****************************************************************************************************/
int randomOne()
{
  //return random +1 or -1
  if (random(1)>=0.5)
    return 1;
  else return -1;
}