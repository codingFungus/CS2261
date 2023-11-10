#include "gba.h"
#include "digitalSound.h"
#include "sprites.h"
#include "vine_boom.h"
#include "funkytown.h"

// Import sound files

void initialize();
void setupInterrupts();
void interruptHandler();

void initBanana();
void updateBanana();

unsigned short buttons;
unsigned short oldButtons;

ANISPRITE banana;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // Play looping song when A button is pressed
        if (BUTTON_PRESSED(BUTTON_A)) {
            playSoundA(funkytown_data, funkytown_length, 1);
            

        } // if

        // Play sound effect when B button is pressed
        if (BUTTON_PRESSED(BUTTON_B)) {
            playSoundB(vine_boom_data, vine_boom_length, 1);
            

        } // if

        // Stop sounds completely when SELECT button is pressed
        if (BUTTON_PRESSED(BUTTON_SELECT)) {
            

        } // if


        // Pause/unpause sounds when START button is pressed
        if (BUTTON_PRESSED(BUTTON_START)) {
            if (soundB.isPlaying) {
                pauseSounds();
            } else {
                unpauseSounds();
            }


            


        } // if


        updateBanana();
        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 512);

    } // while

} // main

void initialize() {

    REG_DISPCTL = MODE0 | BG2_ENABLE | SPRITE_ENABLE;

    buttons = REG_BUTTONS;
    oldButtons = 0;

    DMANow(3, spritesPal, SPRITE_PALETTE, spritesPalLen / 2);
    DMANow(3, spritesTiles, &CHARBLOCK[4], spritesTilesLen / 2);

    setupSounds();
    setupInterrupts();

    initBanana();

} // initialize

void setupInterrupts() {

	REG_IME = 0;

    // Enable VBlank interrupts
    REG_IE = interruptHandler;
    REG_DISPSTAT = DISPSTAT_VBLANK;

    REG_INTERRUPT = interruptHandler;
	REG_IME = 1;

} // setupInterrupts

void interruptHandler() {

	REG_IME = 0;

    // Handle VBlank interrupts
    if (REG_IF & IRQ_VBLANK) {
        if (soundA.isPlaying) {
            soundA.vBlankCount++;
            if (soundA.vBlankCount >= soundA.durationInVBlanks) {
                if (soundA.looping) {
                    playSoundA(soundA.data, soundA.dataLength, soundA.looping);
                    //restart
                } else {
                    //stop
                    soundA.isPlaying = 0;
                    REG_TM0CNT = TIMER_OFF;
                    dma[1].cnt = 0;
                }
            }

        }
        if (soundB.isPlaying) {
            soundB.vBlankCount++;
            if (soundB.vBlankCount >= soundB.durationInVBlanks) {
                if (soundB.looping) {
                    //restart
                    playSoundB(soundB.data, soundB.dataLength, soundB.looping);
                } else {
                    //stop
                    soundB.isPlaying = 0;
                    REG_TM1CNT = TIMER_OFF;
                    dma[2].cnt = 0;
                }
            }


        }
    }

    REG_IF = REG_IF;
	REG_IME = 1;

} // interruptHandler

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

} // initBanana

void updateBanana() {
    
    int aniSpeed = 7;

    static int tilecol = 0;
    static int tilerow = 0;

    banana.aniState = soundA.isPlaying && dma[1].cnt & DMA_ON;

    if (banana.aniState == 0) {
        tilecol = 0;
        tilerow = 16;

    } else if (banana.aniCounter % aniSpeed == 0) {
        
        banana.curFrame = (banana.curFrame + 1) % banana.numFrames;

        tilecol = 8 * (banana.curFrame % 4);
        tilerow = 8 * (banana.curFrame / 4);

    } // if

    banana.aniCounter = (banana.aniCounter + 1) % aniSpeed;

    shadowOAM[0].attr0 = ATTR0_ROW(banana.worldRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = ATTR1_COL(banana.worldCol) | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_TILEID(tilecol, tilerow);

} // updateBanana