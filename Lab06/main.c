#include <stdlib.h>
#include <stdio.h>
#include "gba.h"
#include "mode4.h"
#include "game.h"
#include "start.h"
#include "imposter.h"
// TODO 3.4: include start.h

// prototypes
void initialize();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// random prototype
void srand();

// text buffer
char buffer[41];

// states
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// buttons 
unsigned short buttons;
unsigned short oldButtons;

// random seed
int rSeed;

int main()
{
    initialize();

    while (1)
    {
        // update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // state machine
        switch (state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

// sets up GBA
void initialize()
{
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// sets up the start state
void goToStart() {
    // TODO 3.4: call DMANow to load in startPal
    DMANow(3, startPal, BG_PALETTE, 256);
    

    // UNCOMMENT 3.5
    drawFullscreenImage4(startBitmap);

    // TODO 2.1: wait for vBlank and flip the page
    // note: you don't need to reload the palette
    waitForVBlank();
    flipPage();
    

    state = START;

    // begin the seed randomization
    rSeed = 0;
}

// runs every frame of the start state
void start() {
    rSeed++;
    // locking frame rate to 60fps
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed); 
        goToGame();
        initGame();
    }
}

// sets up the game state
void goToGame() {
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();

    // update the score
    drawString4(180, 1, "score: ", GOLDID);
    sprintf(buffer, "%d", score);
    drawString4(220, 1, buffer, GOLDID);

    waitForVBlank();
    flipPage();


    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    // win and lose conditions
    if (score == -1) {
        goToLose();
    }
    if (score == 30) {
        goToWin();
    }
}

// Sets up the pause state
void goToPause() {
    fillScreen4(BROWNID);
    drawString4(136, 8, "got too stressed?", PINKID);
    drawString4(130, 18, "you're paused now!", PINKID); 

    // TODO 2.2: wait for vBlank and flip the page
    waitForVBlank();
    flipPage();
    


    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {
    fillScreen4(GOLDID);
    drawString4(154, 8, "omg you won!!!", PINKID);
    drawString4(88, 18, "press start to play again", PINKID);

    // TODO 2.3: wait for vBlank and flip the page
    waitForVBlank();
    flipPage();
    


    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    fillScreen4(SALMONID);
    drawString4(172, 8, "you lost :(", PINKID);
    drawString4(94, 18, "better luck next time <3", PINKID);
    drawString4(494, 28, "press start to try again", PINKID);

    // TODO 2.4: wait for vBlank and flip the page
    waitForVBlank();
    flipPage();
    

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}