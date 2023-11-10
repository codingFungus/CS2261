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






extern volatile unsigned short *videoBuffer;
# 39 "gba.h"
void waitForVBlank();
# 56 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 72 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 104 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 130 "gba.h"
typedef void (*ihp)(void);
# 2 "main.c" 2
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
# 3 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
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

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
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
} SPRITE;
# 5 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[16];
# 6 "main.c" 2
# 1 "dance.h" 1
# 9 "dance.h"
void initDancer();
void dance();


typedef struct {
    int x, y;
    int frame;
    int OAMindex;
    int active;
    int tick;
    int width, height;
} DANCER;


DANCER dancer;
# 7 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[1104];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 8 "main.c" 2
# 1 "danceBG.h" 1
# 22 "danceBG.h"
extern const unsigned short danceBGTiles[5936];


extern const unsigned short danceBGMap[1024];


extern const unsigned short danceBGPal[256];
# 9 "main.c" 2


void initialize();
void setupStartInterrupts();
void setupDanceInterrupts();
void startInterruptHandler();
void danceInterruptHandler();


int switchToStart;
int switchToDance;
void goToStart();
void goToDance();


enum {START, DANCE};
int state;
int vBlanks;
int paused;
int waitingForVBlank;
OBJ_ATTR shadowOAM[128];


unsigned short oldButtons;
unsigned short buttons;

void initialize() {

    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = (0 << 7) | ((0) << 2) | ((28) << 8) | (0 << 14);

    mgba_open();

    switchToStart = 0;
    switchToDance = 0;

    DMANow(3, spritesheetTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 32);

    paused = 0;

    goToStart();
}

int main() {

    initialize();
    while (1) {
        if (switchToDance) {
            goToDance();
            switchToDance = 0;
        } else if (switchToStart) {
            goToStart();
            switchToStart = 0;
        }

        __asm__("swi 0x04 << 15");
    }
}

void startInterruptHandler() {

    *(unsigned short*)0x4000208 = 0;


    if (*(volatile unsigned short*)0x4000202 & (1 << 12)) {

        switchToDance = 1;

    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;


    *(unsigned short*)0x4000208 = 1;


    return;
}

void danceInterruptHandler() {

    *(unsigned short*)0x4000208 = 0;


    if (*(volatile unsigned short*)0x4000202 & (1 << 12)) {

        paused = !paused;

    }
    if (*(volatile unsigned short*)0x4000202 & (1 << 0)) {

        dance();
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;


    *(unsigned short*)0x4000208 = 1;


    return;
}

void setupStartInterrupts() {

    *(unsigned short*)0x4000208 = 0;


    *(unsigned short*)0x4000200 = (1 << 12);


    *((ihp*)0x03007FFC) = startInterruptHandler;


    *(unsigned short*)0x4000132 = (1 << 14) | (1<<3);
    *(unsigned short*)0x4000200 - (1 << 0) | (1 << 12);



    *(unsigned short*)0x4000208 = 1;

}

void setupDanceInterrupts() {

    *(unsigned short*)0x4000208 = 0;


    *(unsigned short*)0x4000200 = (1 << 0) | (1 << 12);


    *(unsigned short*)0x4000200 = (1 << 0);
    *(unsigned short*)0x4000004 = (1 << 3);
    *(unsigned short*)0x4000132 = (1 << 14) | (1<<2);




    *((ihp*)0x03007FFC) = danceInterruptHandler;


    *(unsigned short*)0x4000208 = 1;

}

void goToStart() {

    state = START;

    hideSprites();
    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    initDancer();

    DMANow(3, &startTiles, &((CB*) 0x6000000)[0], 2208 / 2);
    DMANow(3, &startMap, &((SB*) 0x6000000)[28], 2048 / 2);
    DMANow(3 ,&startPal, ((unsigned short *)0x5000000), 512);

    setupStartInterrupts();
}

void goToDance() {

    state = DANCE;

    DMANow(3, &danceBGTiles, &((CB*) 0x6000000)[0], 11872 / 2);
    DMANow(3, &danceBGMap, &((SB*) 0x6000000)[28], 2048 / 2);
    DMANow(3 ,&danceBGPal, ((unsigned short *)0x5000000), 512);

    setupDanceInterrupts();
}
