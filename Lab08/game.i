# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct {
    int tileID;
    int winTextPaletteRow;
    int spritePaletteRow;

} CHIP;

void initGame();
void updateGame();
void drawGame();
# 2 "game.c" 2

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
# 38 "gba.h"
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




int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);

# 1 "mode0.h" 1



# 1 "gba.h" 1
# 5 "mode0.h" 2
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 107 "gba.h" 2
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
    int direction;
    int isAnimating;
    int timeUntilNextFrame;
    int currentFrame;
    int numFrames;
    u8 hide;
    u8 oamIndex;
} SPRITE;
# 108 "gba.h" 2
# 4 "game.c" 2
# 1 "print.h" 1
# 26 "print.h"
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
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 5 "game.c" 2


# 1 "connectFourTiled.h" 1







extern const unsigned short connectFourTiledMap[1024];
# 8 "game.c" 2



void animateChip();
void dropChip();
int checkGameStatus();


enum {
    BLANK = 0, OUTLINE = 1, EMPTY_CELL = 2, YELLOW_CELL = 3, RED_CELL = 4,
    C_TILE = 5, O_TILE = 6, N_TILE = 7, E_TILE = 8, T_TILE = 9, F_TILE = 10, U_TILE = 11, R_TILE = 12, EX_TILE = 13
};


enum { DRAW = 0, YELLOW_WIN = 1, RED_WIN = 2 };
int gameStatus;

int currentColumn;
int dropping;


CHIP yellow;
CHIP red;
CHIP* currentColor;

SPRITE chipSprite;

void initGame() {



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


    chipSprite.timeUntilNextFrame = 10;
    chipSprite.currentFrame = 0;
    chipSprite.hide = 0;
    chipSprite.numFrames = 6;

}

void updateGame() {

    if (gameStatus != DRAW) dropping = 0;

    if (dropping) {
        dropChip();

    } else {

        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) initGame();

        if ((!(~(oldButtons) & ((1<<5))) && (~(buttons) & ((1<<5)))) && currentColumn > 1) currentColumn--;
        if ((!(~(oldButtons) & ((1<<4))) && (~(buttons) & ((1<<4)))) && currentColumn < 10) currentColumn++;

        if ((!(~(oldButtons) & ((1<<7))) && (~(buttons) & ((1<<7))))) dropping = 1;

    }

    animateChip();

}

void drawGame() {
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}


void animateChip() {


    chipSprite.timeUntilNextFrame--;
    if (chipSprite.timeUntilNextFrame == 0) {
        chipSprite.currentFrame++;
        if (chipSprite.currentFrame >= chipSprite.numFrames) {
            chipSprite.currentFrame = 0;
        }
        chipSprite.timeUntilNextFrame = 10;
    }


    shadowOAM[chipSprite.oamIndex].attr0 = ((chipSprite.y) & 0xFF) | (0<<14);
    shadowOAM[chipSprite.oamIndex].attr1 = ((chipSprite.x + 8 * currentColumn) & 0x1FF) | (1<<14);


    shadowOAM[chipSprite.oamIndex].attr2 = (((currentColor->spritePaletteRow) & 0xF) <<12) | (((0)*32+(chipSprite.currentFrame * 2)) & 0x3FF);




    if (chipSprite.hide == 1) {
        shadowOAM[chipSprite.oamIndex].attr0 |= (2<<8);
    }



}


void dropChip() {

    static int fallthroughTimer;
    static int depth;


    chipSprite.hide = 1;


    if ((((SB*) 0x6000000)[8].tilemap[((5 + depth) * (32) + (9 + currentColumn))] & 1023) != EMPTY_CELL) {

        gameStatus = checkGameStatus();


        if (gameStatus != DRAW) {


            for (int i = 0; i < 2; i++) {
                for (int j = 0; j < 7; j++) {
                    ((SB*) 0x6000000)[8].tilemap[((13 + i) * (32) + (10 + j))] |= ((currentColor-> winTextPaletteRow & 15) << 12);

                }

            }

        } else {


            chipSprite.hide = 0;

        }


        if (depth > 0) currentColor = (currentColor == &red) ? &yellow : &red;

        fallthroughTimer = 0;
        depth = 0;

        dropping = 0;


    } else if (fallthroughTimer == 0) {


        ((SB*) 0x6000000)[8].tilemap[((5 + depth) * (32) + (9 + currentColumn))] = (currentColor->tileID & 1023);

        if (depth > 0) {


            ((SB*) 0x6000000)[8].tilemap[((4 + depth) * (32) + (9 + currentColumn))] = (EMPTY_CELL & 1023);

        }

        fallthroughTimer = 10;
        depth++;


    } else {
        fallthroughTimer--;

    }

}

int checkGameStatus() {


    for (int dy = 0; dy < 7; dy++) {

        int lastChip = ((SB*) 0x6000000)[8].tilemap[((5 + dy) * (32) + (10))];
        int colorFrequency = 0;

        for (int dx = 0; dx < 10; dx++) {

            int currentChip = ((SB*) 0x6000000)[8].tilemap[((5 + dy) * (32) + (10 + dx))];

            if ((currentChip & 1023) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if ((currentChip & 1023) != (lastChip & 1023)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && (currentChip & 1023) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && (currentChip & 1023) == RED_CELL) {
                return RED_WIN;

            }

        }
    }


    for (int dx = 0; dx < 10; dx++) {

        int lastChip = ((SB*) 0x6000000)[8].tilemap[((5) * (32) + (10 + dx))];
        int colorFrequency = 0;

        for (int dy = 0; dy < 7; dy++) {

            int currentChip = ((SB*) 0x6000000)[8].tilemap[((5 + dy) * (32) + (10 + dx))];

            if ((currentChip & 1023) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if ((currentChip & 1023) != (lastChip & 1023)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && (currentChip & 1023) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && (currentChip & 1023) == RED_CELL) {
                return RED_WIN;

            }

        }
    }


    for (int dx = -3; dx < 7; dx++) {

        int lastChip = ((SB*) 0x6000000)[8].tilemap[((5) * (32) + (10 + dx))];
        int colorFrequency = 0;

        for (int dy = 0; dy < 7; dy++) {

            int currentX = 10 + dx + dy;
            int currentY = 5 + dy;

            if (currentX < 10 || currentX > 19 || currentY < 5 || currentY > 11) {
                colorFrequency = 0;
                continue;

            }

            int currentChip = ((SB*) 0x6000000)[8].tilemap[((currentY) * (32) + (currentX))];

            if ((currentChip & 1023) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if ((currentChip & 1023) != (lastChip & 1023)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && (currentChip & 1023) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && (currentChip & 1023) == RED_CELL) {
                return RED_WIN;

            }

        }
    }


    for (int dx = 3; dx < 13; dx++) {

        int lastChip = ((SB*) 0x6000000)[8].tilemap[((5) * (32) + (10 + dx))];
        int colorFrequency = 0;

        for (int dy = 0; dy < 7; dy++) {

            int currentX = 10 + dx - dy;
            int currentY = 5 + dy;

            if (currentX < 10 || currentX > 19 || currentY < 5 || currentY > 11) {
                colorFrequency = 0;
                continue;

            }

            int currentChip = ((SB*) 0x6000000)[8].tilemap[((currentY) * (32) + (currentX))];

            if ((currentChip & 1023) == EMPTY_CELL) {
                colorFrequency = 0;

            } else if ((currentChip & 1023) != (lastChip & 1023)) {
                colorFrequency = 1;

            } else {
                colorFrequency++;

            }

            lastChip = currentChip;

            if (colorFrequency > 3 && (currentChip & 1023) == YELLOW_CELL) {
                return YELLOW_WIN;

            } else if (colorFrequency > 3 && (currentChip & 1023) == RED_CELL) {
                return RED_WIN;

            }

        }
    }

    return DRAW;
}
