#include "gba.h"
#include "mode4.h"
#include "sprites.h"
#include "game.h"
#include "spritesheet.h"

// Variables
OBJ_ATTR shadowOAM[128];
SPRITE kitty;
int collided;
int kittyPalette;
SPRITE statue;
SPRITE paw;
typedef enum {RIGHT, LEFT} DIRECTION;

// Initialize the game
void initGame() {
    initKitty();
    initStatue();
    initPaw();
}

// Updates the game each frame
void updateGame() {
	updateKitty();
}

// Draws the game each frame
void drawGame() {
    drawKitty();
    drawStatue();
    drawPaw();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Initialize the kitty
void initKitty() {
    kitty.width = 32;
    kitty.height = 16;
    kitty.xVel = 1;
    kitty.yVel = 1;
    kitty.direction = RIGHT;

    // TODO 2.0: set kitty.oamIndex appropriately
    kitty.oamIndex = 0;

    // Initialize sprite in middle of screen
    kitty.x = SCREENWIDTH / 2 - kitty.width / 2;
    kitty.y = 95;

    collided = 0;
    kittyPalette = 0;
}

// Initialize the statue
void initStatue() {
    statue.width = 32;
    statue.height = 32;
    statue.x = 104;
    statue.y = 36;
    statue.oamIndex = 2;
}

// Initialize the paw
void initPaw() {
    paw.width = 32;
    paw.height = 32;
    paw.x = 200;
    paw.y = 140;
    paw.oamIndex = 3; 
}

// Handle every-frame actions of the kitty
void updateKitty() {
    if(BUTTON_HELD(BUTTON_UP)) {
        if (kitty.y > 0) {
            kitty.y -= kitty.yVel;
        }
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        if (kitty.y + kitty.height < SCREENHEIGHT) {
            kitty.y += kitty.yVel;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (kitty.x > 0) {
            kitty.x -= kitty.xVel;
        }
        // TODO 2.1: set kitty.direction appropriately
        kitty.direction = LEFT;

    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (kitty.x + kitty.width < SCREENWIDTH) {
            kitty.x += kitty.xVel;
        }
        // TODO 2.1: set kitty.direction appropriately
        kitty.direction = RIGHT;

    }

    if (collision(kitty.x, kitty.y, kitty.width, kitty.height, paw.x, paw.y, paw.width, paw.height)) collided = 1;
    if (collision(kitty.x, kitty.y, kitty.width, kitty.height, statue.x, statue.y, statue.width, statue.height)) collided = 0;
    if (collided) kitty.framesPassed++;
}

// Draw the kitty
void drawKitty() {
    // TODO 2.2: set up the kitty's sprite in the shadowOAM
    shadowOAM[kitty.oamIndex].attr0 = ATTR0_4BPP | ATTR0_REGULAR | ATTR0_WIDE | ATTR0_Y(kitty.y);
    shadowOAM[kitty.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(kitty.x) ;

    if (kitty.direction == RIGHT) {
        shadowOAM[kitty.oamIndex].attr1 |= ATTR1_HFLIP;
    }
    shadowOAM[kitty.oamIndex].attr2 = ATTR2_PALROW(kittyPalette) | ATTR2_PRIORITY(1) | (512 + ATTR2_TILEID(0, 0));

    
    //Changes the kitty'scolor if collided
    if (collided) {
        if (kitty.framesPassed % 30 == 0) {
            kittyPalette = (kittyPalette+1) % 3;
        } 
    }

    // TODO 2.3: set up the sprite for the kitty's shadow in the shadowOAM
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | ATTR0_Y(kitty.y + kitty.height - 4);
    shadowOAM[1].attr1 = ATTR1_X(kitty.x) | ATTR1_MEDIUM;

    if (kitty.direction == RIGHT) {
        shadowOAM[1].attr1 |= ATTR1_HFLIP;
    }
    shadowOAM[1].attr2 = ATTR2_PALROW(kittyPalette) | ATTR2_PRIORITY(1) | (512 + ATTR2_TILEID(0, 2));



    
}

// Draw the statue
void drawStatue() {
    // TODO 3.0: set up the statue's sprite in the shadowOAM
    shadowOAM[statue.oamIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(statue.y);
    shadowOAM[statue.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(statue.x) ;
    shadowOAM[statue.oamIndex].attr2 = ATTR2_PALROW(3) | ATTR2_PRIORITY(0) | (512 + ATTR2_TILEID(4, 0));



}

void drawPaw() {
    // TODO 4.0: set up the paw's sprite in the shadowOAM
    shadowOAM[paw.oamIndex].attr0 = ATTR0_4BPP| ATTR0_SQUARE | ATTR0_Y(paw.y);
    shadowOAM[paw.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(paw.x);
    shadowOAM[paw.oamIndex].attr2 = ATTR2_PALROW(4) | ATTR2_PRIORITY(1) | (512 + ATTR2_TILEID(8, 0));

}