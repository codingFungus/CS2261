#include "gba.h"
#include "game.h"
#include "sound.h"
#include <stdlib.h>
#include <time.h>

// structs on the screen
PLAYER player;
BALL ball;
BLOCK blocks[BLOCKCOUNT];

// score
int score;
int spawned;

// initializing game
void initGame() {
    // setting initial score
    score = 0;

    // initializing structs
    initPlayer();
    initBall();
    initBlocks();
}

// initializing player struct
void initPlayer() {
    player.y = 154;
    player.x = 117;
    player.oldy = player.y;
    player.oldx = player.x;
    player.xVelocity = 0;
    player.height = 5;
    player.width = 35;
    player.color = BRULEE;
}

// initializing ball struct 
void initBall() {
    ball.y = 150; 
    ball.x = 128;
    ball.oldy = ball.y;
    ball.oldx = ball.x;
    if (rand() & 1) {
        ball.xVelocity = 1;
    } else {
        ball.xVelocity = -1;
    }
    ball.yVelocity = -3;
    ball.height = 3;
    ball.width = 3;
    ball.color = PORTAGE;
}

// initializing block struct array
// TODO 2.1: uncomment this function
void initBlocks() { 
    for (int i = 0; i < BLOCKCOUNT; i++) {
        blocks[i].y = 10 + (i/6)*6;
        blocks[i].width = 36;
        blocks[i].height = 4;
        blocks[i].active = 1;

        // TODO 2.1: delete the 0, and make the color picker choose a random number 0-4
        int colorPicker = rand() % 5;
        switch (colorPicker) {
            case 0:
                blocks[i].color = TEAL;
                break;
            case 1:
                blocks[i].color = PERSIAN;
                break;
            case 2:
                blocks[i].color = LAVPINK;
                break;
            case 3:
                blocks[i].color = ROGUE;
                break;
            case 4:
                blocks[i].color = CADILLAC;
                break; 
        }
    } 

    for (int i = 0; i < 6; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i) + (i*4));
    }
    for (int i = 6; i < 12; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-6) + ((i-6)*4));
    }
    for (int i = 12; i < 18; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-12) + ((i-12)*4));
    }
    for (int i = 18; i < 24; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-18) + ((i-18)*4));
    }
    for (int i = 24; i < 30; i++) {
        blocks[i].x = 2 + (blocks[i].width * (i-24) + ((i-24)*4));
    }
}

// updating game
void updateGame() {
    // update structs
    updatePlayer();
    updateBall();
    // TODO 2.4: call updateBlock for each of your blocks
    for (int i = 0; i < BLOCKCOUNT; i++) {
        updateBlocks(&blocks[i]);
    }

    
    if (score > 0 && !(score % 5)) {
        if (!spawned) {
            newBlock();
            spawned = 1;
        }
    } else {
        spawned = 0;
    }
}

// update player struct
void updatePlayer() {
    // boundary/button
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x-1 > 0)) {
        player.xVelocity = -3;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH-1)) {
        player.xVelocity = 3;
    } else {
        player.xVelocity = 0;
    }
    // updating player position based on speed
    player.oldx = player.x;
    player.x += player.xVelocity;
}

// update ball struct
void updateBall() {
    // boundary checks
    if (ball.y <=1) {
        ball.yVelocity = 2;
    }
    if (ball.y + ball.height >= 159) { 
        ball.yVelocity = -2;
        // lose if ball falls to bottom of screen
        score = -1;
    }
    if (ball.x <= 1) {
        ball.xVelocity = 1;
    }
    if (ball.x + ball.width >= 239) {
        ball.xVelocity = -1;
    }
    // collision with player, depends on which half of the player the ball hits
    if (collision(ball.x, ball.y, ball.width, ball.height, player.x, player.y, player.width/2, player.height)) {
        ball.yVelocity *= -1;
        ball.xVelocity = -1;
        score++;
    } else if (collision(ball.x, ball.y, ball.width, ball.height, (player.x+player.width/2), player.y, player.width/2, player.height)) {
        ball.yVelocity *= -1;
        ball.xVelocity = 1;
        score++;
    }
    // update ball position based on speed
    ball.oldy = ball.y;
    ball.oldx = ball.x;
    ball.y += ball.yVelocity;
    ball.x += ball.xVelocity;
}

// update block struct
// TODO 2.3: uncomment this function
void updateBlocks(BLOCK* b) {
    //TODO 2.3: Add a conditional to only update if the block is active
    if (b->active) {
        // collision with ball, depends on which half of the block the ball hits
        if (collision(ball.x, ball.y, ball.width, ball.height, b->x, b->y, b->width, b->height)) {
            if (collision(ball.x, ball.y, ball.width, ball.height, b->x, b->y, ((b->width)/2), b->height)) {
                ball.yVelocity *= -1;
                ball.xVelocity = -1;
            } else if (collision(ball.x, ball.y, ball.width, ball.height, (b->x+(b->width/2)), b->y, b->width/2, b->height)) {
                ball.yVelocity *= -1;
                ball.xVelocity = 1;
            }

            // TODO 2.3: set the block's active and erased members to 0
            b->active = 0;
            b->erased = 0;

            // TODO 4.1: play the sound specified in the pdf
            REG_SND2CNT = DMG_ENV_VOL(4) | DMG_DIRECTION_DECR |
            DMG_STEP_TIME(2) | DMG_DUTY_50;
            REG_SND2FREQ = SND_RESET | NOTE_G6;
            
        }
    }
}

// drawing the game
void drawGame() {
    drawPlayer();
    drawBall();
    for (int i = 0; i < BLOCKCOUNT; i++) {
        drawBlocks(&blocks[i]);
    }
}

// drawing the player
void drawPlayer() {
    drawRect(player.oldx, player.oldy, player.width, player.height, OFFWHITE);
    drawRect(player.x, player.y, player.width, player.height, player.color);
}

// drawing the ball
void drawBall() {
    drawRect(ball.oldx, ball.oldy, ball.width, ball.height, OFFWHITE);
    drawRect(ball.x, ball.y, ball.width, ball.height, ball.color);
}

// drawing the blocks
void drawBlocks(BLOCK* b) {
    //TODO 2.2: uncomment this function
    if (b->active) {
        drawRect(b->oldx, b->oldy, b->width, b->height, OFFWHITE);
        drawRect(b->x, b->y, b->width, b->height, b->color);
    } else if (!b->erased) {
        drawRect(b->x, b->y, b->width, b->height, OFFWHITE);
        b->erased = 1;
    }
}


// TODO 2.5: write this function
void newBlock() {
    spawned = 1; // don't delete this!
    for (int i = 0; i < BLOCKCOUNT; i++) {
        if (blocks[i].active == 0) {
            blocks[i].active = 1;
            blocks[i].erased = 0;
        }
        break;
    }

    
}