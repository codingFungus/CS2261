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
    int isMoving;
    int timeUntilNextFrame;
    int currentFrame;
    int numOfFrames;
    int hide;
    u8 oamIndex;
} SPRITE;
# 5 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[16];
# 6 "main.c" 2
# 1 "littleroot_town.h" 1
# 22 "littleroot_town.h"
extern const unsigned short littleroot_townTiles[2016];


extern const unsigned short littleroot_townMap[4096];


extern const unsigned short littleroot_townPal[256];
# 7 "main.c" 2
# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];


extern const unsigned short collisionmapPal[256];
# 8 "main.c" 2






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
        buttons = (*(volatile unsigned short *)0x04000130);
        update();
        waitForVBlank();
        draw();
    }
}

inline unsigned char colorAt(int x, int y){

    return collisionmapBitmap[((y) * (512) + (x))];

}

void initialize() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((28) << 8) | (3<<14) | (0 << 7);


    DMANow(3, littleroot_townTiles, &((CB*) 0x6000000)[0], 4032/2);
    DMANow(3, littleroot_townMap, &((SB*) 0x6000000)[28], 8192/2);
    DMANow(3, littleroot_townPal, ((unsigned short *)0x5000000), 256);


    DMANow(3, spritesheetTiles, &((CB*) 0x6000000)[4], 32768/2);
    DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);


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





    if ((~(buttons) & ((1<<5)))) {
        player.direction = LEFT;
        player.isMoving = 1;
        if (player.x > 0 && colorAt(leftX - player.xVel, topY) && colorAt(leftX - player.xVel, bottomY)) {
            player.x -= player.xVel;
        }

    }
    if ((~(buttons) & ((1<<4)))) {
        player.direction = RIGHT;
        player.isMoving = 1;
        if (player.x < 512 && colorAt(rightX + player.xVel, topY) && colorAt(rightX + player.xVel, bottomY)) {
            player.x += player.xVel;
        }

    }
    if ((~(buttons) & ((1<<7)))) {
        player.direction = DOWN;
        player.isMoving = 1;
        if (player.y + player.height < 512 && colorAt(leftX, bottomY + player.yVel) && colorAt(rightX, bottomY + player.yVel)) {
            player.y += player.yVel;

        }

    }
    if ((~(buttons) & ((1<<6)))) {
        player.direction = UP;
        player.isMoving = 1;
        if (player.y > 0 && colorAt(leftX, topY - player.yVel) && colorAt(rightX, topY - player.yVel)) {
            player.y -= player.yVel;


        }

    }



    if ((~(buttons) & ((1<<5))) || (~(buttons) & ((1<<4))) || (~(buttons) & ((1<<7))) || (~(buttons) & ((1<<6)))) {
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


    hOff = player.x - 240 / 2 + player.height / 2;
    vOff = player.y - 160 / 2 + player.width / 2;

    if (hOff < 0) {
        hOff = 0;
    } else if (hOff > 512 - 240) {
        hOff = 512 - 240;
    }
    if (vOff < 0) {
        vOff = 0;
    } else if (vOff > 512 - 160) {
        vOff = 512 - 160;
    }




    shadowOAM[player.oamIndex].attr0 = ((player.y - vOff) & 0xFF) | (2<<14);
    shadowOAM[player.oamIndex].attr1 = ((player.x - hOff) & 0x1FF) | (2<<14);
    shadowOAM[player.oamIndex].attr2 = (((player.currentFrame * 4)*32+(player.direction * 2)) & 0x3FF);


}

void draw() {
    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}
