#include "gba.h"
#include "print.h"
#include "sprites.h"
#include "mode0.h"

#include "game.h"
// TODO 1.1: Include chipSprite.h
#include "chipSprite.h"

// TODO 2.1: Include connectFour.h
#include "connectFour.h"

void initialize();

u16 oldButtons;
u16 buttons;

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;

        updateGame();
        waitForVBlank();
        drawGame();
    
    } // while

    return 0;

} // main

void initialize() {

    mgba_open();

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(8);

    // TODO 1.2: Import chip sprite palette/tiles, hide sprites
    DMANow(3, chipSpriteTiles, &CHARBLOCK[4], chipSpriteTilesLen / 2);
    DMANow(3, chipSpritePal, SPRITE_PALETTE, chipSpritePalLen / 2);
    

    hideSprites();

    // TODO 2.2: Import background palette and tiles
    DMANow(3, connectFourTiles, &CHARBLOCK[0], connectFourTilesLen/2);
    DMANow(3, connectFourPal, BG_PALETTE, connectFourPalLen / 2);
    
    
    initGame();

} // initialize