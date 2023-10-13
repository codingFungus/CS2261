#include "gba.h"
#include "sprites.h"
#include "mode4.h"
#include "game.h"
#include "background.h"
#include "spritesheet.h"


// Prototypes
void initialize();
void goToGame();
void game();

// States
enum {GAME};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;
                
        // State Machine
        switch(state) {
            case GAME:
                game();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {
    // Set up the display
    REG_DISPCTL = MODE(4) | BG2_ENABLE | SPRITE_ENABLE;

    // Set up the first state
    goToGame();
    initGame();
}

// Sets up the game state
void goToGame() {
    // Make sure changes do not appear onscreen
    waitForVBlank();

    // Set up the background
    // Load palette into bg palette location in memory
    DMANow(3, backgroundPal, PALETTE, 256);
    // Load bitmap data into the video buffer (background)
    DMANow(3, backgroundBitmap, videoBuffer, 240*160/2);

    // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[5], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PALETTE, 256);

    // Hide all sprites in shadowOAM
    hideSprites();


    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
}