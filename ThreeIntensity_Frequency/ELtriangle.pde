void ELtriangle(int x, int y){
  int lateral=50;
  float dx=sin(PI/6)*lateral;
  float dy=cos(PI/6)*lateral;
  triangle(x,y,x-dx,y-dy,x+dx,y-dy);
}