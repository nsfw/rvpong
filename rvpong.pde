import processing.video.*;

int quanta = 10;   // everything displays in chunks this big
int w=80;
int h=10;

int WIN=4;
int WIN_FRAMES=30*5;
int SCORE_FRAMES=15;

String state;
int holdFrames;

color fg;
color initFg;
color bg;
color initBg;
color ball;

color white;
color black;

Font5x5 font;
Movie explode;

void setup(){
    size(w*quanta, h*quanta);
    frameRate(30);

    state = "START";
    holdFrames = 0;

    // explode = new Movie(this, "media/explosion1.mp4");
    explode = new Movie(this, "media/explosion2.mp4");

    colorMode(HSB, 1.0);        // specify HSB in fractions

    white = color(1.0, 1.0, 1.0);  // white
    black = color(1.0, 1.0, 0.0);  // black
    initFg = white;
    initBg = black;
    fg = color(1.0, 1.0, 1.0);  // bright & saturated
    bg = highContrast(fg);
    ball = fg;

    font = new Font5x5();
}

// uses the current draw state
void drawPixelAt(int x, int  y){
    rectMode(CORNER);
    rect(x*quanta, y*quanta, quanta, quanta);
}

void drawPixelAt(float x, float y){
    rectMode(CORNER);
    rect(x*quanta, y*quanta, quanta, quanta);
}

// top of paddle
int paddleLeft=4;
int paddleLeftCol=0;
int paddleRight=4;
int paddleRightCol=w-1;

int paddleHeight=2;

// ball
float ballX = 10;
float ballY = 5;
float ballVX = 0.0;
float initialVX = 0.6;
float ballVY = 0.0;
float initialVY = 0.0;

int scoreLeft=0;
int scoreRight=0;
int rally=0;

// debug
boolean debugMode=false;
boolean debugStep=false;

void setColor(color c){
    stroke(c);
    fill(c);
}

color highContrast(color c){
    if(c == white) return black;

    // otherwise, we'll just find some nice hue value
    color r = color(((hue(c) + 0.6180339) % 1.0), saturation(c), brightness(c));
    return r;
}

void rowBackground(int r, color c){
    setColor(c);
    rect(0, r*5*quanta, w*quanta, (r+1)*5*quanta-1);
}

void movieEvent(Movie m) {
  m.read();
}

void drawPaddle(int top, int col){
    int y = top;
    for(int j=paddleHeight; j>0 && y<h; j--, y++){
        drawPixelAt(col, y);
    }
}

boolean ballIntMode = false;
void drawBall(){
    setColor(ball);

    if(ballIntMode){
        // force integer quanta
        drawPixelAt(floor(ballX), floor(ballY));
    } else {
        // allow intermediates
        drawPixelAt(ballX, ballY);
    }
}

void updateBall(){
    // update ball position

    ballX += ballVX;
    ballY += ballVY;

    // did we leave top or bottom? If so reflect
    if(ballY<0.0 || ballY>h-1){
        ballVY = (-ballVY);
        // clamp to extreme
        if(ballY<0.0) ballY = 0.0;
        else ballY = h-1;

        ballY += ballVY;
    }
}

void paddleStrike(){
    int top = h;
    int dir = 0;

    if(ballX < paddleLeftCol+0.5){
        top = paddleLeft;
        dir = 1;
    } else if (ballX > paddleRightCol){
        top = paddleRight;
        dir = -1;
    } else {
        return;
    }

    float center = top + (paddleHeight/2);
    float dist = ballY - center;     // <0 is top of paddle, >0 is bottom

    if(abs(dist)<=paddleHeight){
        // let's call it a hit!
        // println("bounce");
        rally++;

        // flip direction
        ballVX = (-ballVX);
        ballX += ballVX;
        ballX += ballVX;

        float norm = dist/(paddleHeight/2);
        ballVY = norm/5;
    }
}

boolean hueAnim = true;

void update(){

    if(hueAnim){
        fg = color( (hue(fg)+0.005) % 1.0, saturation(fg), brightness(fg));
        bg = highContrast(fg);
        ball = fg;
    } else {
        fg = initFg;
        bg = initBg;
        ball = fg;
    }

    if(state == "START"){
        // draw top of game stuff
        scoreLeft=0;
        scoreRight=0;
        paddleLeft = 4;
        paddleRight = 4;
        rally=0;
        // wait for start here...
        // "make a fight - 3 2 1"
        color tmp = highContrast(fg);
        rowBackground(0, tmp);
        setColor(fg);
        int ab = (frameCount/60) % 2;
        String msg = (ab == 0) ? " PLAY A PONG" : " MAKE A FIGHT!" ;
//        String msg = " YXYY   YXYY " ;
        jiggleTextAt(0, 0, ab, 2, msg);    // don't jiggle PONG
        rowBackground(1, fg);
        setColor(tmp);
        textAt(2,5," RVIP LOUNGE");
    } else if (state == "SCORE") {
        // check for WIN, otherwise display SCORE and advance to
        if(scoreLeft>=WIN || scoreRight>=WIN){
            state = "WIN";
            holdFrames=WIN_FRAMES;
        } else {
            if(holdFrames == 0)
                state = "START_PLAY";
            else
                holdFrames--;
        }
    } else if (state == "WIN") {
        if(holdFrames == 0)
            state = "START";
        else
            holdFrames--;
    } else if (state == "START_PLAY") {
        // check for End Of Game, otherwise reset balls and padles
        // paddleLeft = 4;
        // paddleRight = 4;
        // launch ball towards a side (alternate)
        ballX = w/2;
        ballY = h/2;
        if(ballVX<0){   // alternate star direction
            ballVX = initialVX;
        } else {
            ballVX = -initialVX;
        }
        ballVY = 0.2;
        rally = 0;
        state = "PLAY";
    } else if (state == "PLAY") {
        updateBall();
        // did we exit either side?
        if(ballX < 0 || ballX > w){
            state = "SCORE";
            holdFrames = SCORE_FRAMES;     // frames to display score
            if(ballX<0){
                scoreRight++;
            } else {
                scoreLeft++;
            }
        }

        // deflect ball if it's struck one of the paddles
        paddleStrike();
    }

    // println("Y=" + ballY + "   VY=" + ballVY);
}

void draw(){

    setColor(bg);
    rect(0, 0, w*quanta-1, h*quanta-1);

    setColor(fg);

    if(state == "PLAY"){
        // draw paddles
        drawPaddle(paddleLeft, paddleLeftCol);
        drawPaddle(paddleRight, paddleRightCol);

        // and ball
        drawBall();
    }

    if(state == "SCORE"){
        textAt(0,0,"     SCORE");
        String msg = ""+scoreLeft;
        textAt(5,5,msg);
        msg = ""+scoreRight;
        textAt(65,5,msg);
    }

    if(state == "WIN"){
        if(holdFrames == WIN_FRAMES){
            holdFrames--;   // fire once
            explode.jump(0);
            explode.play();
        }

        int movieCol = scoreLeft >= WIN ? 40 : 0;
        int winCol = scoreLeft >= WIN ? 0 : 40;

        // render movie
        image(explode, movieCol*quanta, 0, width/2, height);

        // WIN JIGGLE DANCE
        jiggleTextAt(winCol,0,1,4,"WINNER");
        jiggleTextAt(winCol+2,5,1,4,"WINNER");

        // SO LOSE :(
        textAt(movieCol, 0, "   SO");
        textAt(movieCol, 5, "  LOSE");
    }

    if(debugMode){
        if(debugStep){
            update();
            debugStep = false;
        }
    } else {
        update();
    }

}

void keyPressed(){
        // right paddle
    if(key == 'i' && paddleRight>0){
        paddleRight += -1;
    }
    if(key == 'k' && paddleRight<(h-paddleHeight)){
        paddleRight += 1;
    }

    if(key == 'w' && paddleLeft>0){
        paddleLeft += -1;
    }
    if(key == 's' && paddleLeft<(h-paddleHeight)){
        paddleLeft += 1;
    }
    if(key == 'd'){
        debugMode = !debugMode;
        println("DebugMode = " + debugMode);
    }
    if(key == ' ' || key == 'q' || key == 'p'){
        debugStep = true;
        if(state == "START") state = "START_PLAY";
    }
    if(key == '`'){
        state = "START";
    }
    if(key == 'h'){
        hueAnim = !hueAnim;
    }
    if(key == 'x'){
        // test WIN effect
        state = "WIN";
        holdFrames = WIN_FRAMES;
    }
}

// Note: should look at moving this code into BMFont and passing
// in a 'drawerPixel' function

int charAt(int x, int y, int c){
    // get bitmap data for this character
    int cw = font.getWidth(c);      // in pixels
    int ch = font.GlyphHeight;
    int bw = font.GlyphBytesWidth;
    int index = font.getIndex(c);   // index into bitmap

    for (int cy=0; cy<ch; cy++){
        for(int cx=0; cx<cw; cx++){
            // NOTE: currently only supports single byte wide fonts!
            // println("index="+index);
            // println("bw="+bw);
            // println("bitmap len="+font.bitmap.length);

            int row = font.bitmap[index+(cy*bw)];
            // int row=0xc0;

            // bitmap is packed to the MSBs
            if(((1<<(7-cx)) & row) != 0){
                drawPixelAt(x+cx, y+cy);
                // print("x");
            } else {
                // print(" ");
            }
        }
        // println("");
    }
    return cw;
}

void textAt(int x, int y, String msg){
    // for now just print an A
    int cx = x;
    for (int i = 0; i < msg.length(); i++){
        char c = msg.charAt(i);
        x = x + charAt(x, y, (int) c);
    }
}

void jiggleTextAt(int x, int y, int amt, int rate, String msg){
    // for that awesome Taco Truck Feeling!
    textAt(x+amt*((int)(frameCount/rate)&0x1),y, msg);
}
