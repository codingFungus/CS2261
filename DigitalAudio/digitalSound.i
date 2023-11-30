# 1 "digitalSound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "digitalSound.c"
# 1 "gba.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "gba.h"
extern volatile unsigned short *videoBuffer;
# 85 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 163 "gba.h"
void hideSprites();


typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 287 "gba.h"
typedef void (*ihp)(void);
# 308 "gba.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "digitalSound.c" 2
# 1 "digitalSound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "digitalSound.h"
typedef struct {
    const signed char* data;
    int dataLength;
    int frequency;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int priority;
    int vBlankCount;

} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "digitalSound.c" 2

void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;

}

void playSoundA(const signed char* sound, int length, int loops) {

    DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    int cyclesPerSample = (16777216) / 11025;

    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000100 = 65536 - cyclesPerSample;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.data = sound;
    soundA.dataLength = length;
    soundA.looping = loops;
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = ((59.727) / 11025) * length;
    soundA.vBlankCount = 0;

}


void playSoundB(const signed char* sound, int length, int loops) {

    DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    int cyclesPerSample = (16777216) / 11025;

    *(volatile unsigned short*)0x4000106 = 0;
    *(volatile unsigned short*)0x4000104 = 65536 - cyclesPerSample;
    *(volatile unsigned short*)0x4000106 = (1<<7);

    soundB.data = sound;
    soundB.dataLength = length;
    soundB.looping = loops;
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = ((59.727) / 11025) * length;
    soundB.vBlankCount = 0;

}

void pauseSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
}

void unpauseSounds() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}
