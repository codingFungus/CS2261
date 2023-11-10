# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



# 1 "backgroundTileMap.h" 1







extern const unsigned short backgroundTileMapMap[2048];
# 5 "game.h" 2
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
# 6 "game.h" 2
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
# 7 "game.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 8 "game.h" 2
# 1 "main.h" 1
void initialize();
void start();
void goToStart();
void game();
void goToGame();
void instruction();
void goToInstruction();
void pause();
void goToPause();
void lose();
void goToLose();
void win();
void goToWin();
void draw();
# 9 "game.h" 2
# 18 "game.h"
void initGame();
void updatePlayer();
void drawPlayer();
void initPlayer();
# 2 "game.c" 2

SPRITE player;




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
    shadowOAM[player.oamIndex].attr0 = (0 << 13) | (0 << 14) | ((player.y - vOff) & 0xFF);
    shadowOAM[player.oamIndex].attr1 = (2 << 14) | ((player.x - hOff) & 0x1FF);
    shadowOAM[player.oamIndex].attr2 = (((0) * (32) + (player.currentFrame * 4)) & 0x3FF);

    if (player.direction == RIGHT) {
        shadowOAM[player.oamIndex].attr1 |= (1 << 12);
    }

}

void updatePlayer() {



    if ((~(buttons) & ((1 << 6)))) {

        if (player.y > 0) {
            player.y -= player.yVel;
        }
        mgba_printf("move");
    }
    if ((~(buttons) & ((1 << 7)))) {

        if (player.y + player.height < 256) {
            player.y += player.yVel;
        }
    }
    if ((~(buttons) & ((1 << 5)))) {
        player.direction = LEFT;

        if (player.x > 0) {
            player.x -= player.xVel;
        }

    }
    if ((~(buttons) & ((1 << 4)))) {
        player.direction = RIGHT;


        if (player.x + player.width < 512) {
            player.x += player.xVel;
        }

    }
    if ((!(~(oldButtons) & ((1 << 9))) && (~buttons & ((1 << 9))))) {
        playerAttack();
    }

    if ((~(buttons) & ((1 << 5))) || (~(buttons) & ((1 << 4))) || (~(buttons) & ((1 << 7))) || (~(buttons) & ((1 << 6)))) {
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

    hOff = player.x - 240 / 2 + player.height / 2;
    vOff = player.y - 160 / 2 + player.width / 2;

    hOff = (((0) > (hOff)) ? (0) : (hOff));
    hOff = (((512 - 240) < (hOff)) ? (512 - 240) : (hOff));

    vOff = (((0) > (vOff)) ? (0) : (vOff));
    vOff = (((256 - 160) < (vOff)) ? (256 - 160) : (vOff));
}

void playerAttack(){


}
