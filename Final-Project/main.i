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






extern volatile unsigned short* videoBuffer;
# 48 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 67 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 99 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
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
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 64 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
    int isMoving;
} SPRITE;
# 5 "main.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 6 "main.c" 2
# 1 "game.h" 1
void initGame();
void updatePlayer();
void drawPlayer();
void initPlayer();
# 7 "main.c" 2
# 1 "startbg.h" 1
# 21 "startbg.h"
extern const unsigned short startbgTiles[9600];


extern const unsigned short startbgPal[256];
# 8 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[1440];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[16];
# 9 "main.c" 2
# 1 "pausetile.h" 1
# 21 "pausetile.h"
extern const unsigned short pausetileTiles[9600];


extern const unsigned short pausetilePal[256];
# 10 "main.c" 2
# 1 "catSpriteSheet.h" 1
# 21 "catSpriteSheet.h"
extern const unsigned short catSpritesheetTiles[16384];


extern const unsigned short catSpritesheetPal[16];
# 11 "main.c" 2
# 1 "startbgMap.h" 1







extern const unsigned short startbgMapMap[1024];
# 12 "main.c" 2
# 1 "winbg.h" 1
# 22 "winbg.h"
extern const unsigned short winbgTiles[448];


extern const unsigned short winbgMap[1024];


extern const unsigned short winbgPal[16];
# 13 "main.c" 2
# 1 "startscreen.h" 1
# 22 "startscreen.h"
extern const unsigned short startscreenTiles[13296];


extern const unsigned short startscreenMap[2048];


extern const unsigned short startscreenPal[16];
# 14 "main.c" 2
# 1 "bg_try.h" 1
# 22 "bg_try.h"
extern const unsigned short bg_tryTiles[14592];


extern const unsigned short bg_tryMap[2048];


extern const unsigned short bg_tryPal[16];
# 15 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[1008];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[16];
# 16 "main.c" 2
# 1 "losebg.h" 1
# 22 "losebg.h"
extern const unsigned short losebgTiles[528];


extern const unsigned short losebgMap[1024];


extern const unsigned short losebgPal[16];
# 17 "main.c" 2
# 26 "main.c"
int state;
enum {START, GAME, INSTRUCTION, PAUSE, WIN, LOSE};

unsigned short buttons;
unsigned short oldButtons;

int seed;
char buffer[41];
int hOff = 0;
int vOff = 0;
extern int lives;
extern int score;
OBJ_ATTR shadowOAM[128];
SPRITE player;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short*) 0x04000130);
        mgba_printf("State: %d", state);

        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case INSTRUCTION:
                instruction();
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
        draw();
    }
    return 0;

}

void initialize() {

    mgba_open();

    hideSprites();
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | ((1 << (8 + (0 % 4)))) | (1 << 12);

    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (1 << 14) | (0 << 7);


    buttons = (*(volatile unsigned short*) 0x04000130);
    hOff = 0;

    goToStart();

}
void goToStart() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (0 << 14);





    DMANow(3, startscreenMap, &((SB*) 0x06000000)[28], 4096 / 2);
    DMANow(3, startscreenTiles, &((CB*) 0x06000000)[0], 26592 / 2);
    DMANow(3, startscreenPal, ((unsigned short*) 0x05000000), 32 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    seed = 0;

    state = START;

}
void start() {

    seed++;


    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {

        goToGame();
        initGame();

    }
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        goToInstruction();
    }


}
void goToGame() {

    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (1 << 14);
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);

    waitForVBlank();

    DMANow(3, bg_tryMap, &((SB*) 0x06000000)[28], 4096/2);
    DMANow(3, bg_tryTiles, &((CB*) 0x06000000)[0], 29184/2);
    DMANow(3, bg_tryPal, ((unsigned short*) 0x05000000), 32/2);

    DMANow(3, catSpritesheetTiles, &((CB*) 0x06000000)[4], 32768/2);
    DMANow(3, catSpritesheetPal, ((u16*) 0x5000200), 32/2);



    hideSprites();
    state = GAME;
}

void game() {

    updatePlayer();
    drawPlayer();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToPause();
    }


    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        goToWin();
    }
    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1))))) {
        goToLose();
    }
}
void goToInstruction() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (0 << 14);

    DMANow(3, instructionsMap, &((SB*) 0x06000000)[28], 2048/2);
    DMANow(3, instructionsTiles, &((CB*) 0x06000000)[0], 2016/2);
    DMANow(3, instructionsPal, ((unsigned short*) 0x05000000), 32/2);

    hideSprites();
    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    state = INSTRUCTION;


}
void instruction() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToStart();
    }

}

void goToPause() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
    (*(volatile unsigned short*) 0x04000008) = ((0) << 2) | ((28) << 8) | (1 << 14);




    mgba_printf("paused");

    DMANow(3, pauseScreenTiles, &((CB*) 0x06000000)[0], 19200/2);
    DMANow(3, pauseScreenMap, &((SB*) 0x06000000)[28], 2048/2);
    DMANow(3, pauseScreenPal, ((unsigned short*) 0x05000000), 16);

    hideSprites();
    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);

    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToGame();
    } else if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2))))) {
        goToStart();
    }
}

void goToLose() {

    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (1 % 4)));
    (*(volatile unsigned short*) 0x0400000A) = ((0) << 2) | ((28) << 8) | (1 << 14);

    DMANow(3, losebgMap, &((SB*) 0x06000000)[28], 2048/2);
    DMANow(3, losebgTiles, &((CB*) 0x06000000)[0], 1056/2);
    DMANow(3, losebgPal, ((unsigned short*) 0x05000000), 16);

    hideSprites();
    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);
    state = LOSE;

}
void lose() {
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToStart();
    }
}

void goToWin() {
    (*(volatile unsigned short*) 0x04000000) = ((0) & 7) | (1 << (8 + (1 % 4)));
    (*(volatile unsigned short*) 0x0400000A) = ((0) << 2) | ((28) << 8) | (1 << 14);

    DMANow(3, winbgMap, &((SB*) 0x06000000)[28], 2048/2);
    DMANow(3, winbgTiles, &((CB*) 0x06000000)[0], 896/2);
    DMANow(3, winbgPal, ((unsigned short*) 0x05000000), 32/2);

    hideSprites();
    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 512);

    state = WIN;
}
void win() {

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToStart();
    }

}

void draw() {
    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;
    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*) 0x7000000), 128*4);
}
