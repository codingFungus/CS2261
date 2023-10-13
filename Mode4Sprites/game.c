#include "gba.h"
#include "mode4.h"
#include "sprites.h"
#include "game.h"

// Variables
OBJ_ATTR shadowOAM[128];
SPRITE car;
typedef enum {RIGHT, LEFT} DIRECTION;

// Initialize the game
void initGame() {
    initCar();
}

// Updates the game each frame
void updateGame() {
    updateCar();
}

// Draws the game each frame
void drawGame() {
    drawCar();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Initialize the car
void initCar() {
    car.x = 120;
    car.y = 60;
    car.xVel = 1;
    car.yVel = 1;
    car.direction = RIGHT;
    car.oamIndex = 0;
    car.width = 16;
    car.height = 16;
}


// Handle every-frame actions of the car
void updateCar() {
    if(BUTTON_HELD(BUTTON_UP)) {
        car.y -= car.yVel;
    }
    if(BUTTON_HELD(BUTTON_DOWN)) {
        car.y += car.yVel;
    }
    if(BUTTON_HELD(BUTTON_LEFT)) {
        car.x -= car.xVel;
        car.direction = LEFT;
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        car.x += car.xVel;
        car.direction = RIGHT;
    }
}

// Draw the car
void drawCar() {
    shadowOAM[car.oamIndex].attr0 = ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE | ATTR0_Y(car.y);
    shadowOAM[car.oamIndex].attr1 = ATTR1_SMALL | ATTR1_X(car.x) ;
    if (car.direction == LEFT) {
        shadowOAM[car.oamIndex].attr1 |= ATTR1_HFLIP;
    }
    shadowOAM[car.oamIndex].attr2 = ATTR2_PALROW(0) | ATTR2_PRIORITY(0) | (512 +  ATTR2_TILEID(0,0));
}