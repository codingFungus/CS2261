# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 98 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "game.c" 2
# 1 "mode4.h" 1
# 13 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 3 "game.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int framesPassed;
    int direction;
    int aniState;
    int aniFrame;
    int numFrames;
    int hide;
    u8 oamIndex;
} SPRITE;


typedef struct {
 u16 tileimg[8192];
} charblock;
# 4 "game.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];


void initGame();
void updateGame();
void drawGame();

void initCar();
void updateCar();
void drawCar();
# 5 "game.c" 2


OBJ_ATTR shadowOAM[128];
SPRITE car;
typedef enum {RIGHT, LEFT} DIRECTION;


void initGame() {
    initCar();
}


void updateGame() {
    updateCar();
}


void drawGame() {
    drawCar();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}


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



void updateCar() {
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        car.y -= car.yVel;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        car.y += car.yVel;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        car.x -= car.xVel;
        car.direction = LEFT;
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        car.x += car.xVel;
        car.direction = RIGHT;
    }
}


void drawCar() {
    shadowOAM[car.oamIndex].attr0 = (0<<13) | (0<<8) | (0<<14) | ((car.y) & 0xFF);
    shadowOAM[car.oamIndex].attr1 = (1<<14) | ((car.x) & 0x1FF) ;
    if (car.direction == LEFT) {
        shadowOAM[car.oamIndex].attr1 |= (1<<12);
    }
    shadowOAM[car.oamIndex].attr2 = (((0) & 0xF) <<12) | (((0) & 3) << 10) | (512 + (((0)*32+(0)) & 0x3FF));
}
