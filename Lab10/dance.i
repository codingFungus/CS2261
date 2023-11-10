# 1 "dance.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "dance.c"
# 1 "dance.h" 1



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
# 5 "dance.h" 2
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
# 6 "dance.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 7 "dance.h" 2


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
# 2 "dance.c" 2

void initDancer() {
    dancer.x = 100;
    dancer.y = 50;
    dancer.frame = 0;
    dancer.tick = 0;
    dancer.OAMindex = 0;
    dancer.active = 1;
    dancer.width = 64;
    dancer.height = 64;
}

void dance() {
    dancer.tick += 1;
    if ((dancer.tick % 10) == 0) {
        dancer.frame = (dancer.frame + 1) % 15;
    }
    shadowOAM[dancer.OAMindex].attr0 = (0<<14) | (0<<8) | ((dancer.y) & 0xFF);
    shadowOAM[dancer.OAMindex].attr1 = (3<<14) | ((dancer.x) & 0x1FF);
    shadowOAM[dancer.OAMindex].attr2 = ((((8 * (dancer.frame / 4)) * (32) + (8 * (dancer.frame % 4)))) & 0x3FF);
    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
