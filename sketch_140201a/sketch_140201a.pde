// import pitaru.sonia_v2_9.*;
import ddf.minim.*;
import processing.video.*;

int frame;
int fps = 15;
Minim minim;
AudioPlayer song;
String songfile = "urn.mp3";
String imgfile = "bti.png";

PImage img;
Movie urnmovie;
Movie worstguysmovie;
Movie worstguysmovie2;
Movie worstguysmovie3;

PFont[] fonts;

int screenWidth = 1024;
int screenHeight = 678;

float circleSpeed = 0.5;

int fs = 18;  // font size
int lh = 50;  // line height
int ws = 140;  // word spacing

void setup() {
  size(screenWidth, screenHeight);
  frameRate(fps);
  background(0);
  noStroke();
  rectMode(CENTER);
  
  // song stuff
  minim = new Minim(this);
  song = minim.loadFile(songfile, screenWidth);
  song.play();
  
  // image stuff
  img = loadImage(imgfile);
  img.resize(640, 640);
  
  // urnmovie stuff
  urnmovie = new Movie(this, "nomouthemoji.mov");
  urnmovie.loop();
  
  // worstguysmovies stuff
  worstguysmovie = new Movie(this, "theworstguys.mov");
  worstguysmovie.loop();
  worstguysmovie2 = new Movie(this, "theworstguys2.mov");
  worstguysmovie2.loop();
  worstguysmovie3 = new Movie(this, "theworstguys3.mov");
  worstguysmovie3.loop();
  
  // font stuff
  fonts = new PFont[2];
  // fonts[0] = loadFont("Seravek-Italic-48.vlw");
  fonts[0] = loadFont("Avenir-Light-24.vlw");
  fonts[1] = loadFont("SnellRoundhand-24.vlw");
  // fonts[2] = loadFont("MicrosoftSansSerif-24.vlw");
}

void movieEvent(Movie m) {
  m.read();
}

void stop() {
 song.close();
 super.stop(); 
}

void part1() {
  if(random(1) > 0.2){
    // background(0);
    // image(img, 0, 0);
    int driftLeft = -frame/4 + 80;
    int driftDown = frame/11 - 25;
    
    drawOrb(false);
    
    if(millis() > 5160) {
      rect(700 + driftLeft, 300, 200, 200);
    }
    if(millis() > 5860) {
      rect(200 + driftLeft, 400, 200, 200);
      // draw circles inside of square
      if(millis() > 20000) {
        for(int i = 0; i < 17; i++) {
          if(millis() > 20000 + i * 10){
            int size = int(200 * (1.0/float(i + 1)));
            ellipse(200 + driftLeft - (2*driftLeft * (1.0/float(i + 1))), 400 + driftDown, size, size);
          }
        }
      }
    }
    if(millis() > 6480) {
      rect(370 + driftLeft, 400, 80, 80); 
    }
    if(millis() > 8000) {
      for(int i = 18; i >= 0; i--) {
        if(millis() > 8000 + 100 * i) {
          int rxdrift = ((driftLeft +120/4 - 80)* (6 - i))/2;
          rect(700 - (10*i) + driftLeft + rxdrift, 300 - (10*i), 200, 200);
          if(millis() > 12000) {
            // draw soundform in each square
            if(millis() > 12000 + 100 * i && millis() < 18000)
              drawSoundform(700 - (10*i) + driftLeft - 100, 300 - (10*i), 100, 1, 0, 0, 200);
            else if(millis() > 18000) {
              if(millis() > 18000 + (i % 5) * 600)
                drawSoundform(700 - (10*i) + driftLeft + rxdrift - 100, 300 - (10*i), 100, 1, 0, 0, 200);
            }
          }
        }
      }
      
      // opposite direction
      for(int i = 18; i >= 0; i--) {
        if(millis() > 9000 + 100 * i) {
          int rxdrift = ((driftLeft +120/4 - 80)* (6 - i))/8;
          rect(700 + (10*i) + driftLeft + rxdrift, 300 + (10*i), 200, 200);
          if(millis() > 12000) {
            // draw soundform in each square
            if(millis() > 12000 + 100 * i && millis() < 18000)
              drawSoundform(700 + (10*i) + driftLeft - 100, 300 + (10*i), 100, 1, 0, 0, 200);
            else if(millis() > 18000) {
              if(millis() > 18000 + (i % 5) * 600)
                drawSoundform(700 + (10*i) + driftLeft + rxdrift - 100, 300 + (10*i), 100, 1, 0, 0, 200);
            }
          }
        }
      }
      
    }
    if(millis() > 10000) {
      drawSoundform(700 + driftLeft - 100, 300, 100, 1, 0, 0, 200);
    }
  }
  if(random(1) > 0.8) glitchScreenWhite();
  else if(random(1) > 0.95) glitchScreen(0.2);
}

void part2() {
  stroke(255);
  fill(255);
  smooth();
  if(25000 < millis()) {
      drawNoisyMovie(worstguysmovie, 4, 1);
  }
}

void part3() {
  if(random(1) > 0.1) {
    int driftLeft = -frame + 320;
    int framecolorbound = (frame - 320)%255;
    if(random(1) > 0.42) drawNoisyMovie(worstguysmovie3, 1, 8);
    if(millis() < 35000) {
      
    } else if(millis() < 35600) {
      background(0);
      fill(0, 0, 0, 0);
      stroke(255);
      strokeWeight(1);
      rect(width/2 + driftLeft, height/2, 400, 400);
      rect(width/2 + 340 + driftLeft, height/2, 160, 160);
      drawSoundform(width/2 + driftLeft - 200, height/2 - 20, 40, 2, 40, 0, 620);
      if(random(1) > 0.3) glitchScreenWhite();
      drawNoisyMovieWithColors(worstguysmovie, 4, 1);
    } else {
      if(random(1) > 0.4) {
        drawNoisyMovieWithColors(worstguysmovie2, 2, 2);
      }
    }
    if(millis() < 36000) {
      linesThinToThick(color(random(framecolorbound), random(framecolorbound),
                             random(framecolorbound), random(framecolorbound)),
                       0, screenHeight, 0, screenWidth * 2, 1.0, 18.0, 8);
    }
  } else if(random(1) > 0.1) {
    glitchScreen(0.2);
  }
}

void part4() {
  if(millis() > 36800 && millis() < 39000) {
    drawNoisyMovie(worstguysmovie2, 4, 4);
    smooth();
    stroke(0);
    fill(255);
  } else {
    if(millis() < 39100) {
      drawNoisyMovie(worstguysmovie2, 4, 4);
    } else if(millis() < 39200) {
      // do nothing
    } else if(millis() < 39370) {
      drawNoisyMovie(worstguysmovie2, 4, 4);
    } else if(millis() < 39577) {
      // do nothing
    } else if(millis() < 40150) {
      drawNoisyMovie(worstguysmovie2, 4, 4);
    }
  }
}

void part5(){
  if(random(1) > 0.05){
    fill(0, 0, 0, 0);
    strokeWeight(1);
    stroke(255);
    
    if(millis() > 55000){
      drawSoundform(0, 8, 11, 50, 14, 0, width);
      drawMovieOnWhitePixels(urnmovie);
    } else drawOrb(true);
  }
}

void part6() {
  if(millis() > 81000) {
    drawNoisyMovie(worstguysmovie2, 1, 4);
    imgMask(width/2 - img.width/2, height/2 - img.height/2, true, 0.2, 0.8);
    
    if(((millis() - 1000)/500)%11 == 0) {
      noStroke();
      fill(0, 0, 0, 140);
      growingEllipse(438, 287, 140, 140);
      growingEllipse(571, 291, 140, 140);
      growingEllipse(505, 220, 500, 500);
      growingEllipse(506, 349, 700, 700);
      growingEllipse(518, 410, 800, 800);
    }
    
    drawOrb(true);
  }
}

void drawOrb(boolean soundform) {
  stroke(255);
  strokeWeight(1);
  smooth();
  fill(0, 0, 0, 0);
  if(soundform) {
    int divconst = 12;
    int circleEdge = int(frame*circleSpeed) - 20;
    drawSoundform(0, 70, /*(frame/divconst) +*/ 8, 1, 0, 0, circleEdge, true);
    line(0, 70, circleEdge, 70);
    
    /*
    bezier(0.0, float(70 + (frame/divconst) + 8),
      circleEdge/1.3, (70 + (frame/divconst) + 8)/2,
      float(circleEdge/2), float((70 + (frame/divconst) + 8)/4),
      float(circleEdge + 1), float(70 + 2)
    );*/
    /*
    bezier(0.0, float(70 - (frame/divconst) + 8),
      circleEdge/1.3, (70 - (frame/divconst) + 8)/2,
      float(circleEdge/2), float((70 - (frame/divconst) + 8)/4),
      float(circleEdge + 1), float(70 + 2)
    );*/
    
    // line(0, 70 + ((frame/divconst) + 8), circleEdge + 1, 70 + 2);
    // line(0, 70 - ((frame/divconst) + 8), circleEdge + 1, 70 - 2);
    if(random(1) > 0.2) glitchScreenWhite(0, 62, circleEdge, 78);
  }
  ellipse(frame * circleSpeed - 10, 70, 20, 20);
}

void growingEllipse(int x, int y, int w, int h) {
  float size = abs(sin(TWO_PI * (millis()%1000)/1000));
  ellipse(x, y, w * size, h * size);
}

// taken mostly from example at http://code.compartmental.net/tools/minim/quickstart/
/* drawSoundform
 * -------------
 * firstMidpointX: x coordinate origin of the first wave drawn
 * firstMidpointY: y coordinate origin of the first wave drawn
 * range: upper/lower pixel range of the waveform
 * numTimes: number of times to draw the wave
 * distBetween: distance between multiple waves. Just set to 0 if only
 *              drawing one wave
 * 
 */
void drawSoundform(float firstMidpointX, float firstMidpointY, float range, int numTimes, int distBetween,
                   int portionStart, int portionEnd, boolean scaleDown) {
  double sub = range/float(song.bufferSize());
  float r = range;
  for(int i = portionStart; i < portionEnd - 1; i++){
    if(i < 0 || i + 1 > song.bufferSize() - 1) continue;
    for(int j = 0; j < numTimes; j++) {
      line(i + firstMidpointX, firstMidpointY + (j * distBetween) + song.left.get(i)*r,
           i + 1 + firstMidpointX, firstMidpointY + (j * distBetween) + song.left.get(i+1)*r);
    }
    if(scaleDown){
      r -= sub;
    }
  }
}

void drawSoundform(float firstMidpointX, float firstMidpointY, float range, int numTimes, int distBetween,
                   int portionStart, int portionEnd) {
  drawSoundform(firstMidpointX, firstMidpointY, range, numTimes, distBetween,
                portionStart, portionEnd, false);
                     
}

void drawSoundform(float midpoint, float range) {
 drawSoundform(0, midpoint, range, 1, 0, 0, screenWidth); 
}

void glitchScreenWhite(int startx, int starty, int endx, int endy) {
  loadPixels();
  if(startx < 0) startx = 0;
  if(starty < 0) starty = 0;
  if(endx > width) endx = width;
  if(endy > height) endy = height;
  for(int row = starty; row < endy; row++) {
    for(int col = startx; col < endx; col++) {
      float br = brightness(pixels[col + row * width]);
      //float r = red(img.pixels[col + row * img.width]);
      //float g = green(img.pixels[col + row * img.width]);
      //float b = blue(img.pixels[col + row * img.width]);
      if(color(pixels[col + row * width]) >  color(240))
        pixels[col + row * width] = color(random(255), random(255), random(255));
    }
  }
  updatePixels();
}

void glitchScreenWhite() {
  glitchScreenWhite(0, 0, width, height);
}

void glitchScreen(float chance) {
  loadPixels();
  for(int row = 0; row < height; row++) {
    for(int col = 0; col < width; col++) {
      float br = brightness(pixels[col + row * width]);
      //float r = red(img.pixels[col + row * img.width]);
      //float g = green(img.pixels[col + row * img.width]);
      //float b = blue(img.pixels[col + row * img.width]);
      if(chance >= random(1))
        pixels[col + row * width] = color(random(255), random(255), random(255));
    }
  }
  updatePixels();
}

void drawMovieOnWhitePixels(Movie movie) {
  movie.loadPixels();
  loadPixels();
  for(int row = 0; row < height; row++) {
    for(int col = 0; col < width; col++) {
      float movieb = brightness(movie.pixels[row * movie.width + col]);
      float pb = color(pixels[row * width + col]);
      if(pb > color(240))
        pixels[row * width + col] = color(movieb);
    }
  }
  movie.updatePixels();
  updatePixels();
}

void drawNoisyMovie(Movie movie, int rowinc, int colinc) {
  movie.loadPixels();
  loadPixels();
  for(int row = 0; row < height; row+=rowinc) {
    for(int col = 0; col < width; col+=colinc) {
      float movieb = brightness(movie.pixels[row * movie.width + col]);
      pixels[row * width + col] = color(random(movieb - 10, movieb + 10));
    }
  }
  movie.updatePixels();
  updatePixels();
}

void drawNoisyMovieWithColors(Movie movie, int rowinc, int colinc) {
  movie.loadPixels();
  loadPixels();
  for(int row = 0; row < height; row++) {
    for(int col = 0; col < width; col++) {
      if(col % colinc != 0 || row % rowinc != 0) {
        pixels[row * width + col] = color(random(255), random(255), random(255));
      } else {
        float movieb = brightness(movie.pixels[row * movie.width + col]);
        pixels[row * width + col] = color(random(movieb - 10, movieb + 10));
      }
    }
  }
  movie.updatePixels();
  updatePixels();
}

void linesThinToThick(color c, int start, int end, int xoffset, int rwidth, float startWeight, float endWeight, int distBetween) {
  fill(c);
  noStroke();
  float numLines = (end - start)/distBetween;
  float inc = (endWeight - startWeight)/numLines;
  float currentWeight = startWeight;
  for(int pos = start; pos < end; pos += distBetween) {
    rect(xoffset, pos, rwidth, currentWeight);
    currentWeight += inc;
  }
}

void imgMask(int xoffset, int yoffset, boolean fillScreen, float chance, float escapeAlpha) {
  img.loadPixels();
  loadPixels();
  println(height);
  println(img.height);
  
  // color around img
  if(fillScreen) {
    for(int row = 0; row < yoffset; row++) {
      for(int col = 0; col < width; col++) {
        pixels[row * width + col] = color(0);
      }
    }
    for(int row = yoffset; row < height && row < yoffset + img.height; row++) {
      for(int col = 0; col < xoffset; col++) {
        pixels[row * width + col] = color(0);
      }
      for(int col = xoffset + img.width; col < width; col++) {
        pixels[row * width + col] = color(0);
      }
    }
    for(int row = yoffset + img.height; row < height; row++) {
      for(int col = 0; col < width; col++) {
        pixels[row * width + col] = color(0);
      }
    }
  }
  
  for(int row = 0; row < img.height; row++) {
    if(row + yoffset >= screenHeight) break;
    for(int col = 0; col < img.width; col++) {
      if(col + xoffset >= screenWidth) break;
      float imga = alpha(img.pixels[row * img.width + col]);
      color curr = pixels[(row + yoffset) * width + col + xoffset];
      
      if(imga > 20 && random(1) <= chance) imga = escapeAlpha * 255;
      
      float b = brightness(curr) * (-(imga - 255)/255);
      pixels[(row + yoffset) * width + col + xoffset] = color(b);//imga);
    }
  }
  img.updatePixels();
  updatePixels();
}

void draw() {
 frame++;
 background(0);
 if(millis() <= 20000)
   part1();
 else if(millis() <= 26400)
   part2();
 else if(millis() <= 36500)
   part3();
 else if(millis() <= 40400)
   part4();
 else if(millis() < 79000)
   part5();
 else
   part6();
   
 saveFrame();
}
