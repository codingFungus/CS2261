#include "gba.h"
#include "game.h"
#include "mode4.h"
#include "print.h"
#include <stdlib.h>
#include <stdio.h>
#include "imposter.h"
// TODO 4.2: include imposter.h


// structs on the screen
PLAYER player;
BALL ball;
BLOCK blocks[BLOCKCOUNT];

// score
int score;

// initializing game
void initGame() {
    // setting initial score
    score = 0;

    // initializing structs
    initPlayer();
    initBall();
    initBlocks();

    // initializing the colors
    unsigned short colors[NUMCOLORS] = {BLACK, GREY, MAROON, DEEPRED, GOLD, BROWN, SALMON, PINK};

    // TODO 4.2: load the imposter image's colors
    DMANow(3, imposterPal, BG_PALETTE, 256);
    

    // load the custom game colors to the end
    for (int i = 0; i < NUMCOLORS; i++) {
        BG_PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// initializing player struct
void initPlayer() {
    player.y = 128;
    player.x = 100;
    player.oldY = player.y;
    player.oldX = player.x;
    player.dx = 0;
    player.height = 32;
    player.width = 32;
}

// initializing ball struct 
void initBall() {
    ball.y = 134; 
    ball.x = 128;
    ball.oldY = ball.y;
    ball.oldX = ball.x;
    if (rand() & 1) {
        ball.dx = 1;
    } else {
        ball.dx = -1;
    }
    ball.dy = -3;
    ball.height = 3;
    ball.width = 3;
    ball.color = GOLDID;
}

// initializing block struct array
void initBlocks() { 
    mgba_open();
    for (int i = 0; i < BLOCKCOUNT; i++) {
        blocks[i].y = 10 + (i/6)*6;
        blocks[i].height = 4;
        blocks[i].active = 1;
    } 
    for (int i = 0; i < 6; i++) { // even x, even width
        blocks[i].width = 36;
        blocks[i].x = 2 + (blocks[i].width * (i) + (i*4));
        blocks[i].color = BROWNID;
        mgba_printf("1. x: %d, width: %d", blocks[i].x, blocks[i].width);

    }
    for (int i = 6; i < 12; i++) { // even x, odd width
        blocks[i].width = 35;
        blocks[i].x = 2 + ((blocks[i].width + 1) * (i-6) + ((i-6)*4));
        blocks[i].color = GOLDID;
        mgba_printf("2. x: %d, width: %d", blocks[i].x, blocks[i].width);

    }
    for (int i = 12; i < 18; i++) { // odd x, odd width
        blocks[i].width = 35;
        blocks[i].x = 1 + ((blocks[i].width + 1) * (i-12) + ((i-12)*4));
        blocks[i].color = MAROONID;
        mgba_printf("3. x: %d, width: %d", blocks[i].x, blocks[i].width);
    }
    for (int i = 18; i < 24; i++) { // even x, odd width
        blocks[i].width = 35;
        blocks[i].x = 2 + ((blocks[i].width + 1) * (i-18) + ((i-18)*4));
        blocks[i].color = PINKID;
        mgba_printf("4. x: %d, width: %d", blocks[i].x, blocks[i].width);

    }
    for (int i = 24; i < 30; i++) { // odd x, even width
        blocks[i].width = 36;
        blocks[i].x = 1 + (blocks[i].width * (i-24) + ((i-24)*4));
        blocks[i].color = DEEPREDID;
        mgba_printf("5. x: %d, width: %d", blocks[i].x, blocks[i].width);

    }   
}

// updating game
void updateGame() {
    // update structs
    updatePlayer();
    updateBall();
    for (int i = 0; i < BLOCKCOUNT; i++) {
        updateBlocks(&blocks[i]); 
    }
}

// update player struct
void updatePlayer() {
    // boundary/button
    if (BUTTON_HELD(BUTTON_LEFT) && (player.x-1 > 0)) {
        player.dx = -3;
    }
    else if (BUTTON_HELD(BUTTON_RIGHT) && (player.x + player.width < SCREENWIDTH-1)) {
        player.dx = 3;
    } else {
        player.dx = 0;
    }
    // updating player position based on speed
    player.oldX = player.x;
    player.x += player.dx;
}

// update ball struct
void updateBall() {
    // boundary checks
    if (ball.y <=1) {
        ball.dy = 2;
    }
    if (ball.y + ball.height >= 159) { 
        ball.dy = -2;
        // lose if ball falls to bottom of screen
        score = -1;
    }
    if (ball.x <= 1) {
        ball.dx = 1;
    }
    if (ball.x + ball.width >= 239) {
        ball.dx = -1;
    }
    // collision with player, depends on which half of the player the ball hits
    if (collision(ball.x, ball.y, ball.width, ball.height, player.x, player.y, player.width/2, player.height)) {
        ball.dy *= -1;
        ball.dx = -1;
    } else if (collision(ball.x, ball.y, ball.width, ball.height, (player.x+player.width/2), player.y, player.width/2, player.height)) {
        ball.dy *= -1;
        ball.dx = 1;
    }
    // update ball position based on speed
    ball.oldY = ball.y;
    ball.oldX = ball.x;
    ball.y += ball.dy;
    ball.x += ball.dx;
}

// update block struct
void updateBlocks(BLOCK* b) {
    // only update if the block is active
    if (b->active) {
        // collision with ball, depends on which half of the block the ball hits
        if (collision(ball.x, ball.y, ball.width, ball.height, b->x, b->y, b->width, b->height)) {
            if (collision(ball.x, ball.y, ball.width, ball.height, b->x, b->y, ((b->width)/2), b->height)) {
                ball.dy *= -1;
                ball.dx = -1;
                b->active = 0;
                b->erased = 0;
            } else if (collision(ball.x, ball.y, ball.width, ball.height, (b->x+(b->width/2)), b->y, b->width/2, b->height)) {
                ball.dy *= -1;
                ball.dx = 1;
                b->active = 0;
                b->erased = 0;
            }
            score += 1;
        }
    }
}

// drawing the game
void drawGame() {
    fillScreen4(PINKID);
    drawPlayer();
    drawBall();
    for (int i = 0; i < BLOCKCOUNT; i++) {
        drawBlocks(&blocks[i]);
    }
}

// drawing the player
void drawPlayer() {
    // UNCOMMENT 4.3
    drawImage4(player.x, player.y, player.width, player.height, imposterBitmap);
}

// drawing the ball
void drawBall() {
    drawRect4(ball.x, ball.y, ball.width, ball.height, ball.color);
}

// drawing the blocks
void drawBlocks(BLOCK* b) {
    if (b->active) {
        drawRect4(b->x, b->y, b->width, b->height, b->color);
    } 
}