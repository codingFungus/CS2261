#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sprites.h"
#include "spritesheet.h"
#include "littleroot_town.h"
#include "collisionmap.h"
// TODO 3.0: Include collisionmap.h


#define MAPWIDTH 512
#define MAPHEIGHT 512

void initialize();
void update();
void draw();

OBJ_ATTR shadowOAM[128];

typedef enum {DOWN, UP, RIGHT, LEFT} DIRECTION;

unsigned short oldButtons;
unsigned short buttons;

int hOff;
int vOff;

SPRITE player;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        update();
        waitForVBlank();
        draw();
    }
}

inline unsigned char colorAt(int x, int y){
    // TODO 3.1: return the color at the location (x, y) of the collisionmapBitmap
    return !collisionmapBitmap[OFFSET(x, y, MAPWIDTH)];
    
}

void initialize() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE | BG_4BPP;

    // Loading background into appropriate place in memory
    DMANow(3, littleroot_townTiles, &CHARBLOCK[0], littleroot_townTilesLen/2); // loading tileset into charblock 0
    DMANow(3, littleroot_townMap, &SCREENBLOCK[28], littleroot_townMapLen/2); // loading tilemap into screenblock 31
    DMANow(3, littleroot_townPal, PALETTE, 256); // loading palette

    // Loading sprites into appropriate place in memory
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

    // Initializing player sprite
    player.width = 16;
    player.height = 21;
    player.x = 200;
    player.y = 150;
    player.numOfFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
}

void update() {
    player.isMoving = 0;

    int leftX = player.x;
    int rightX = player.x + player.width - 1;
    int topY = player.y;
    int bottomY = player.y + player.height - 1;

    // TODO 1.0: Set player direction based on what button was pressed
    // TODO 2.0: Finish moving the player with the direction code you wrote in TODO 1.0

    // TODO 1.0 + 2.0 CODE
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.direction = LEFT;
        player.isMoving = 1;
        if (player.x > 0 && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY)) {
            player.x -= player.xVel;
        }

    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.direction = RIGHT; 
        player.isMoving = 1;
        if (player.x < MAPWIDTH && colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, bottomY)) {
            player.x += player.xVel;
        }

    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.direction = DOWN;
        player.isMoving = 1;
        if (player.y + player.height < MAPHEIGHT && colorAt(leftX, bottomY + player.yVel) && colorAt(rightX, bottomY + player.yVel)) {
            player.y += player.yVel;

        }

    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player.direction = UP;
        player.isMoving = 1;
        if (player.y > 0 && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel)) {
            player.y -= player.yVel;


        }
        
    }
    // END TODO 1.0 + 2.0 CODE

    // TODO 1.1 + 1.2: Handle animation IF player is moving or ELSE player is not moving
    if (BUTTON_HELD(BUTTON_LEFT) || BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_DOWN) || BUTTON_HELD(BUTTON_UP)) {
        player.timeUntilNextFrame--;

        if (player.timeUntilNextFrame == 0) {
            player.currentFrame++;
            if (player.currentFrame >= player.numOfFrames) {
                player.currentFrame = 0;
            }
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
        }

    // TODO 2.1: Center screen on player
    hOff = player.x - SCREENWIDTH / 2 + player.height / 2;
    vOff = player.y - SCREENHEIGHT / 2 + player.width / 2;

    if (hOff < 0) {
        hOff = 0;
    } else if (hOff > MAPWIDTH - SCREENWIDTH) {
        hOff = MAPWIDTH - SCREENWIDTH;
    }
    if (vOff < 0) {
        vOff = 0;
    } else if (vOff > MAPHEIGHT - SCREENHEIGHT) {
        vOff = MAPHEIGHT - SCREENHEIGHT;
    }

    

    // TODO 1.3: update player's shadowOAM index attributes
    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_TALL;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM;
    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(player.direction * 2, player.currentFrame * 4);

    
}

void draw() {
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    DMANow(3, shadowOAM, OAM, 128*4);
}

