# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
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
# 3 "main.c" 2
# 1 "mode4.h" 1
# 13 "mode4.h"
void flipPage();
void setPixel4(int x, int y, unsigned char colorIndex);
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int x, int y, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 4 "main.c" 2
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
# 5 "main.c" 2
# 1 "background.h" 1
# 21 "background.h"
extern const unsigned short backgroundBitmap[19200];


extern const unsigned short backgroundPal[256];
# 6 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[8192];


extern const unsigned short spritesheetPal[256];
# 7 "main.c" 2



void initialize();
void goToGame();
void game();


enum {GAME};
int state;


unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {
            case GAME:
                game();
                break;
        }

    }
}


void initialize() {

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | ((1 << (8 + (2 % 4)))) | (1 << 12);


    goToGame();
    initGame();
}


void goToGame() {

    waitForVBlank();



    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 256);

    DMANow(3, backgroundBitmap, videoBuffer, 240*160/2);


    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[5], 16384 / 2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);


    hideSprites();


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
    state = GAME;
}


void game() {
    updateGame();
    drawGame();
}
