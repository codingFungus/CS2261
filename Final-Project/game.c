#include "game.h"

SPRITE player;

#define MAPWIDTH 512
#define MAPHEIGHT 256

int score;

int hOff;
int vOff;

int lives;
typedef enum {LEFT, RIGHT} DIRECTION;


void initGame() {
    draw();
    initPlayer();
}

void initPlayer() {
    lives = 5;
    player.width = 40;
    player.height = 40;
    player.x = 40;
    player.y = 100;
    player.numFrames = 5;
    player.direction = RIGHT;
    
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
    player.currentFrame = 0;
    player.oamIndex = 0;
    
}

void drawPlayer() {
    shadowOAM[player.oamIndex].attr0 = ATTR0_4BPP | ATTR0_SQUARE | ATTR0_Y(player.y - vOff);
    shadowOAM[player.oamIndex].attr1 = ATTR1_MEDIUM | ATTR1_X(player.x - hOff);
    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(player.currentFrame * 4, 0);

    if (player.direction == RIGHT) {
        shadowOAM[player.oamIndex].attr1 |= ATTR1_HFLIP;
    }

}

void updatePlayer() {
    //player.isMoving = 0;


    if (BUTTON_HELD(BUTTON_UP)) {
        //player.isMoving = 1;
        if (player.y > 0) {
            player.y -= player.yVel;
        }
        mgba_printf("move");
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        //player.isMoving = 1;
        if (player.y + player.height < MAPHEIGHT) {
            player.y += player.yVel;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.direction = LEFT;
        //player.isMoving = 1;
        if (player.x > 0) {
            player.x -= player.xVel;
        }
        
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.direction = RIGHT;
        //player.isMoving = 1;
        
        if (player.x + player.width < MAPWIDTH) {
            player.x += player.xVel;
        }

    }
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        playerAttack();
    }

    if (BUTTON_HELD(BUTTON_LEFT) || BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_DOWN) || BUTTON_HELD(BUTTON_UP)) {
        player.timeUntilNextFrame--;

        if (player.timeUntilNextFrame == 0) {
            player.currentFrame++;
            if (player.currentFrame >= player.numFrames) {
                player.currentFrame = 0;
            }
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
    }
        
    hOff = player.x - SCREENWIDTH / 2 + player.height / 2;
    vOff = player.y - SCREENHEIGHT / 2 + player.width / 2;

    hOff = max(0, hOff);
    hOff = min(MAPWIDTH - SCREENWIDTH, hOff);

    vOff = max(0, vOff);
    vOff = min(MAPHEIGHT - SCREENHEIGHT, vOff);
}

void playerAttack(){

        
}