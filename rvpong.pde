
int quanta = 10;   // everything displays in chunks this big
int w=80;
int h=10;

String state;
color bg;
color fg;
color ball;

void setup(){
    size(w*quanta, h*quanta,P2D);
    state = "START";
    colorMode(HSB, 1.0);        // specify HSB in fractions

    fg = color(1.0, 0.0, 1.0);  // white
    bg = color(0.5, 0.0, 0.0);  // black
    ball = fg;
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
        println("bounce");
        rally++;

        // flip direction
        ballVX = (-ballVX);
        ballX += ballVX;
        ballX += ballVX;

        float norm = dist/(paddleHeight/2);
        ballVY = norm/5;
    }
}

void update(){
    if(state == "START"){
        // draw top of game stuff
        scoreLeft=0;
        scoreRight=0;
        paddleLeft = 4;
        paddleRight = 4;
        rally=0;
        // wait for start here...
        // "make a fight - 3 2 1"
        state = "POINT";
    } else if (state == "POINT") {
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
            state = "POINT";
            println(state);
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

    // draw paddles
    drawPaddle(paddleLeft, paddleLeftCol);
    drawPaddle(paddleRight, paddleRightCol);

    // and ball
    drawBall();

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
    if(key == '[' && paddleRight>0){
        paddleRight += -1;
    }
    if(key == ']' && paddleRight<(h-paddleHeight)){
        paddleRight += 1;
    }
    if(key == 'd'){
        debugMode = !debugMode;
        println("DebugMode = " + debugMode);
    }
    if(key == ' '){
        debugStep = true;
    }
}
