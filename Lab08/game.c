#include "game.h"

#include "gba.h"
#include "print.h"
#include "sprites.h"
#include "mode0.h"
#include "connectFourTiled.h"
// TODO 2.4: Include connectFourTiled.h


void animateChip();
void dropChip();
int checkGameStatus();

// Tileset Indices
enum { 
    BLANK = 0, OUTLINE = 1, EMPTY_CELL = 2, YELLOW_CELL = 3, RED_CELL = 4, 
    C_TILE = 5, O_TILE = 6, N_TILE = 7, E_TILE = 8, T_TILE = 9, F_TILE = 10, U_TILE = 11, R_TILE = 12, EX_TILE = 13
};

// Game status (lines up with background palette rows for "Connect Four!" text)
enum { DRAW = 0, YELLOW_WIN = 1, RED_WIN = 2 };
int gameStatus;

int currentColumn; // The column the chip should be dropped to
int dropping; // Whether or not a chip is currently being dropped into the connect four grid

// CHIP struct defined in game.h
CHIP yellow;
CHIP red;
CHIP* currentColor; // Is it yellow or red's turn?

SPRITE chipSprite;

void initGame() {
    // TODO 2.5: Import background tilemap
    //DMANow(3, connectFourTiledMap, &SCREENBLOCK[8], connectFourTiledMapLen/2);
    
    gameStatus = DRAW;

    currentColumn = 1;
    dropping = 0;

    yellow.tileID = YELLOW_CELL;
    yellow.winTextPaletteRow = YELLOW_WIN;
    yellow.spritePaletteRow = 0;

    red.tileID = RED_CELL;
    red.winTextPaletteRow = RED_WIN;
    red.spritePaletteRow = 1;

    currentColor = &yellow;

    chipSprite.x = 68;
    chipSprite.y = 20;
    chipSprite.width = 16;
    chipSprite.height = 16;
    chipSprite.oamIndex = 0;

    // TODO 1.3: Initialize animation variables for chipSprite
    chipSprite.timeUntilNextFrame = 10;
    chipSprite.currentFrame = 0;
    chipSprite.hide = 0;
    chipSprite.numFrames = 6;
    
}

void updateGame() {

    if (gameStatus != DRAW) dropping = 0;

    if (dropping) {
        dropChip(); // Note: We can set tiles without waiting for VBlank in Mode 0!

    } else {

        if (BUTTON_PRESSED(BUTTON_START)) initGame();

        if (BUTTON_PRESSED(BUTTON_LEFT) && currentColumn > 1) currentColumn--;
        if (BUTTON_PRESSED(BUTTON_RIGHT) && currentColumn < 10) currentColumn++;

        if (BUTTON_PRESSED(BUTTON_DOWN)) dropping = 1;

    }

    animateChip();
    
}

void drawGame() {
    DMANow(3, shadowOAM, OAM, 512);
}

// Using sprite
void animateChip() {

    // TODO 1.7: Handle chip sprite looping animation
    chipSprite.timeUntilNextFrame--;
    if (chipSprite.timeUntilNextFrame == 0) {
        chipSprite.currentFrame++;
        if (chipSprite.currentFrame >= chipSprite.numFrames) {
            chipSprite.currentFrame = 0;
        }
        chipSprite.timeUntilNextFrame = 10;
    }
    

    shadowOAM[chipSprite.oamIndex].attr0 = ATTR0_Y(chipSprite.y) | ATTR0_SQUARE;
    shadowOAM[chipSprite.oamIndex].attr1 = ATTR1_X(chipSprite.x + 8 * currentColumn) | ATTR1_SMALL;

    // TODO 1.4: Set attribute 2 for chip sprite
    shadowOAM[chipSprite.oamIndex].attr2 = ATTR2_PALROW(currentColor->spritePaletteRow) | ATTR2_TILEID(chipSprite.currentFrame * 2, 0);

    

    // TODO 1.5: Hide chip sprite if chipSprite.hide is true
    if (chipSprite.hide == 1) {
        shadowOAM[chipSprite.oamIndex].attr0 |= ATTR0_HIDE;
    }

    

}

// Using tiles
void dropChip() {

    static int fallthroughTimer;
    static int depth;

    // TODO 1.6: Hide chipSprite
    chipSprite.hide = 1;

    // Return to column selection when the chip reaches the bottom of the grid or lands on another chip
    if (TILEMAP_ENTRY_TILEID(SCREENBLOCK[8].tilemap[OFFSET(9 + currentColumn, 5 + depth, 32)]) != EMPTY_CELL) {

        gameStatus = checkGameStatus();

        // Change the color of the "Connect Four" text if a player wins
        if (gameStatus != DRAW) {

            // TODO 3.1: Modify tile palette row for text tiles when yellow gets a Connect Four
            for (int i = 0; i < 2; i++) {
                for (int j = 0; j < 7; j++) {
                    SCREENBLOCK[8].tilemap[OFFSET(10 + j, 13 + i, 32)] |= TILEMAP_ENTRY_PALROW(currentColor-> winTextPaletteRow);

                }
                
            }
        // Otherwise unhide the chip and start the next turn
        } else {
            
            // TODO 1.6: Show chipSprite
            chipSprite.hide = 0;
        
        }

        // Switch colors if player made a valid move
        if (depth > 0) currentColor = (currentColor == &red) ? &yellow : &red;

        fallthroughTimer = 0;
        depth = 0;

        dropping = 0;

    // Make the chip fall one tile every 10 frames
    } else if (fallthroughTimer == 0) {
        
        // Set new tile ID for tile chip is falling through
        SCREENBLOCK[8].tilemap[OFFSET(9 + currentColumn, 5 + depth, 32)] = TILEMAP_ENTRY_TILEID(currentColor->tileID);
        
        if (depth > 0) {

            // TODO 3.0: Set tile ID for tile chip fell through previously
            SCREENBLOCK[8].tilemap[OFFSET(9 + currentColumn, 4 + depth, 32)] = TILEMAP_ENTRY_TILEID(EMPTY_CELL);
        
        }

        fallthroughTimer = 10;
        depth++;
        
    // Decrement the fallthrough timer
    } else {
        fallthroughTimer--;

    }

}

int checkGameStatus() {

    // Check rows
    for (int dy = 0; dy < 7; dy++) {

        int lastChip = SCREENBLOCK[8].tilemap[OFFSET(10, 5 + dy, 32)];
        int colorFrequency = 0;

        for (int dx = 0; dx < 10; dx++) {
            
            int currentChip = SCREENBLOCK[8].tilemap[OFFSET(10 + dx, 5 + dy, 32)];
            
            if (TILEMAP_ENTRY_TILEID(currentChip) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if (TILEMAP_ENTRY_TILEID(currentChip) != TILEMAP_ENTRY_TILEID(lastChip)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == RED_CELL) {
                return RED_WIN;

            }

        }
    }

    // Check columns
    for (int dx = 0; dx < 10; dx++) {

        int lastChip = SCREENBLOCK[8].tilemap[OFFSET(10 + dx, 5, 32)];
        int colorFrequency = 0;

        for (int dy = 0; dy < 7; dy++) {
            
            int currentChip = SCREENBLOCK[8].tilemap[OFFSET(10 + dx, 5 + dy, 32)];
            
            if (TILEMAP_ENTRY_TILEID(currentChip) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if (TILEMAP_ENTRY_TILEID(currentChip) != TILEMAP_ENTRY_TILEID(lastChip)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == RED_CELL) {
                return RED_WIN;

            }

        }
    }

    // Check down-right diagonals
    for (int dx = -3; dx < 7; dx++) {

        int lastChip = SCREENBLOCK[8].tilemap[OFFSET(10 + dx, 5, 32)];
        int colorFrequency = 0;

        for (int dy = 0; dy < 7; dy++) {
            
            int currentX = 10 + dx + dy;
            int currentY = 5 + dy;

            if (currentX < 10 || currentX > 19 || currentY < 5 || currentY > 11) {
                colorFrequency = 0;
                continue;

            }

            int currentChip = SCREENBLOCK[8].tilemap[OFFSET(currentX, currentY, 32)];
            
            if (TILEMAP_ENTRY_TILEID(currentChip) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if (TILEMAP_ENTRY_TILEID(currentChip) != TILEMAP_ENTRY_TILEID(lastChip)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == RED_CELL) {
                return RED_WIN;

            }

        }
    }

    // Check down-left diagonals
    for (int dx = 3; dx < 13; dx++) {

        int lastChip = SCREENBLOCK[8].tilemap[OFFSET(10 + dx, 5, 32)];
        int colorFrequency = 0;

        for (int dy = 0; dy < 7; dy++) {
            
            int currentX = 10 + dx - dy;
            int currentY = 5 + dy;

            if (currentX < 10 || currentX > 19 || currentY < 5 || currentY > 11) {
                colorFrequency = 0;
                continue;

            }

            int currentChip = SCREENBLOCK[8].tilemap[OFFSET(currentX, currentY, 32)];
            
            if (TILEMAP_ENTRY_TILEID(currentChip) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if (TILEMAP_ENTRY_TILEID(currentChip) != TILEMAP_ENTRY_TILEID(lastChip)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && TILEMAP_ENTRY_TILEID(currentChip) == RED_CELL) {
                return RED_WIN;

            }

        }
    }
    
    return DRAW;
}