/*
  clock 004
  2011/10/07T20:42:03
  patrick dwyer
  
  Point accumulator clock.
  
  See http://patricknevindwyer.github.com/clocks for more info.
  
*/
int hourWidth = 30;
int hourSpacer = 2;
int secondResolution = 60 / hourWidth;

void setup() {
  
    size( hourWidth * 24 + ((hourWidth - 1) * hourSpacer) + hourSpacer * 2, 60 + hourSpacer * 2);
    
}

void draw() {
  
    background(250);
    
    int h = hour();
    int m = minute();
    int s = second();
    
    // draw the first hours
    for (int i = 0; i < h; i++) {
       drawHour(i); 
    }
    
    // draw the minutes
    drawMinutes(h, m);
    
    // draw the seconds
    drawSeconds(h, m, s);
}

void drawSeconds(int h, int m, int s) {

  int x = h * hourWidth + hourSpacer + (h * hourSpacer);
  int y = height - m - hourSpacer - 1;
 
  int points = s / secondResolution;
  for (int i = 0; i < points; i++) {
     point(x + i, y);
  } 
}

void drawMinutes(int h, int m) {
  
   stroke(32, 64, 128);
   int l = (h) * hourWidth + hourSpacer + (h * hourSpacer);
  
   for (int i = 0; i < m; i++) {
      line(l, height - i - hourSpacer - 1, l + hourWidth, height - i - hourSpacer - 1);     
   }
  
}

void drawHour(int h) {
 
   noStroke();
   fill(32, 64, 128);
   int l = h * hourWidth + hourSpacer + (h * hourSpacer);
   rect(l, hourSpacer, hourWidth, 60);
}
