# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
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
# 3 "main.c" 2
# 1 "sprites.h" 1
# 21 "sprites.h"
extern const unsigned short spritesTiles[16384];


extern const unsigned short spritesPal[256];
# 4 "main.c" 2
# 1 "vine_boom.h" 1


extern const unsigned int vine_boom_sampleRate;
extern const unsigned int vine_boom_length;
extern const signed char vine_boom_data[];
# 5 "main.c" 2
# 1 "funkytown.h" 1


extern const unsigned int funkytown_sampleRate;
extern const unsigned int funkytown_length;
extern const signed char funkytown_data[];
# 6 "main.c" 2



void initialize();
void setupInterrupts();
void interruptHandler();

void initBanana();
void updateBanana();

unsigned short buttons;
unsigned short oldButtons;

ANISPRITE banana;


OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
            playSoundA(funkytown_data, funkytown_length, 1);


        }


        if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
            playSoundB(vine_boom_data, vine_boom_length, 1);


        }


        if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {


        }



        if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
            if (soundB.isPlaying) {
                pauseSounds();
            } else {
                unpauseSounds();
            }





        }


        updateBanana();
        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    }

}

void initialize() {

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<10) | (1<<12);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    DMANow(3, spritesPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, spritesTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    setupSounds();
    setupInterrupts();

    initBanana();

}

void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;


    *(unsigned short*)0x4000200 = interruptHandler;
    *(unsigned short*)0x4000004 = 1 << 3;

    *((ihp*)0x03007FFC) = interruptHandler;
 *(unsigned short*)0x4000208 = 1;

}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;


    if (*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);

                } else {

                    soundA.isPlaying = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
                    dma[1].cnt = 0;
                }
            }

        }
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {

                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {

                    soundB.isPlaying = 0;
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                    dma[2].cnt = 0;
                }
            }


        }
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
 *(unsigned short*)0x4000208 = 1;

}

void initBanana() {
    banana.aniCounter = 0;
    banana.aniState = 1;
    banana.cdel = 0;
    banana.curFrame = 0;
    banana.height = 64;
    banana.hide = 0;
    banana.numFrames = 8;
    banana.prevAniState = 0;
    banana.rdel = 0;
    banana.width = 0;
    banana.worldCol = 100;
    banana.worldRow = 30;

}

void updateBanana() {

    int aniSpeed = 7;

    static int tilecol = 0;
    static int tilerow = 0;

    banana.aniState = soundA.isPlaying && dma[1].cnt & (1 << 31);

    if (banana.aniState == 0) {
        tilecol = 0;
        tilerow = 16;

    } else if (banana.aniCounter % aniSpeed == 0) {

        banana.curFrame = (banana.curFrame + 1) % banana.numFrames;

        tilecol = 8 * (banana.curFrame % 4);
        tilerow = 8 * (banana.curFrame / 4);

    }

    banana.aniCounter = (banana.aniCounter + 1) % aniSpeed;

    shadowOAM[0].attr0 = (0xFF & (banana.worldRow)) | (0<<14);
    shadowOAM[0].attr1 = (0x1FF & (banana.worldCol)) | (3<<14);
    shadowOAM[0].attr2 = ((tilerow)*32+(tilecol));

}
