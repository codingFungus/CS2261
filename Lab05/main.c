#include <stdlib.h>
#include <stdio.h>
#include "font.h"
#include "gba.h"
#include "game.h"
#include "sound.h"

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
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    // enabling + setting up sound
    // TODO 4.0: enable sounds in the sound on/off register
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// sets up the start state
void goToStart() {
    fillScreen(PORTAGE);

    // spells out GAME BOY on the start screen in different colors
    char letters[8] = {'G', 'A', 'M', 'E', ' ', 'B', 'O', 'Y'};
    unsigned short colors[8] = {RED, ORANGE, YELLOW, GREEN, BLUE, CYAN, TEAL, MAGENTA};
    int col = 72;
    int spacing = 12;
    for(int i = 0; i < 8; i++){
        drawChar(col + (i * spacing), 70, letters[i], colors[i]);
    }

    drawString(84, 96, "fall 2023", GRAY);

    state = START;
    // begin the seed randomization
    rSeed = 0;
}

// runs every frame of the start state
void start() {
    // TODO 1.3: increment the seed variable
    rSeed++;

    // locking frame rate to 60fps
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        // TODO 1.3: use the seed variable to seed our random numbers
        srand(rSeed);

        goToGame();
        initGame();
    }
}

// sets up the game state
void goToGame() {
    fillScreen(OFFWHITE);
    // TODO 1.0: draw "score: " in a free area
    drawString(180, 1, "score: ", HOTPINK);
    
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();

    // TODO 1.1: update the buffer string with the current score
    sprintf(buffer, "%i", score);   


    waitForVBlank();
    // TODO 1.2: erase old score, draw new score
    drawRect(220, 1, 6, 8, OFFWHITE);
    drawString(220, 1, buffer, PORTAGE);
    drawGame();

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
    fillScreen(OFFWHITE);
    drawString(136, 8, "got too stressed?", TURQUOISE);
    drawString(130, 18, "you're paused now!", TURQUOISE); 
    waitForVBlank();
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
    fillScreen(OFFWHITE);
    drawString(154, 8, "omg you won!!!", TURQUOISE);
    drawString(88, 18, "press start to play again", TURQUOISE);
    waitForVBlank();
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
    fillScreen(OFFWHITE);
    drawString(172, 8, "you lost :(", TURQUOISE);
    drawString(94, 18, "better luck next time <3", TURQUOISE);
    drawString(94, 28, "press start to try again", TURQUOISE);
    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}