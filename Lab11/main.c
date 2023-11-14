#include <stdlib.h>
#include "print.h"

#include "mode0.h"
#include "sprites.h"
#include "gba.h"

#include "play.h"
#include "digitalSound.h"
#include "buttons.h"
#include "gbaplayer.h"
#include "screen.h"


// TODO 2.3: Include buttonpress.h
#include "buttonpress.h"


int seed;

int shuffle;
int currentSong;

void setupInterrupts();
void interruptHandler();

void initialize();

void goToOff();
void off();
void goToOn();
void on();

enum { OFF, ON };
int state;

unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = REG_BUTTONS;

        if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_LEFT) || BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_PRESSED(BUTTON_LSHOULDER) || BUTTON_PRESSED(BUTTON_RSHOULDER)) {
            
            // TODO 2.4: Play button press sound effect
            playSoundB(buttonpress_data, buttonpress_length, 0);
            


        }

        if (BUTTON_HELD(BUTTON_A)) {
            shadowOAM[0].attr2 = ATTR2_TILEID(4, 4);
            
        } else {
            shadowOAM[0].attr2 = ATTR2_TILEID(4, 0);

        }

        if (BUTTON_HELD(BUTTON_LEFT)) {
            shadowOAM[1].attr2 = ATTR2_TILEID(0, 4);

        } else {
            shadowOAM[1].attr2 = ATTR2_TILEID(0, 0);

        }

        if (BUTTON_HELD(BUTTON_RIGHT)) {
            shadowOAM[2].attr2 = ATTR2_TILEID(8, 4);

        } else {
            shadowOAM[2].attr2 = ATTR2_TILEID(8, 0);

        }

        if (BUTTON_HELD(BUTTON_LSHOULDER)) {
            shadowOAM[6].attr0 = ATTR0_Y(5) | ATTR0_SQUARE;

        } else {
            shadowOAM[6].attr0 = ATTR0_Y(3) | ATTR0_SQUARE;

        }

        if (BUTTON_HELD(BUTTON_RSHOULDER)) {
            shadowOAM[7].attr0 = ATTR0_Y(5) | ATTR0_SQUARE;

        } else {
            shadowOAM[7].attr0 = ATTR0_Y(3) | ATTR0_SQUARE;

        }

        switch (state)
        {
        case OFF:
            off();
            break;
        case ON:
            on();
            break;
        }

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 512);
        
    }

}

void initialize() {

    mgba_open();

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20);
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(24);

    DMANow(3, &screenPal[16], &PALETTE[16], 16);
    DMANow(3, screenTiles, &CHARBLOCK[1], screenTilesLen / 2);

    DMANow(3, gbaplayerPal, PALETTE, 16);
    DMANow(3, gbaplayerTiles, &CHARBLOCK[0], gbaplayerTilesLen / 2);
    DMANow(3, gbaplayerMap, &SCREENBLOCK[20], gbaplayerMapLen / 2);

    PALETTE[0] = COLOR(2, 2, 2);

    DMANow(3, buttonsPal, SPRITEPALETTE, buttonsPalLen / 2);
    DMANow(3, buttonsTiles, (void*) 0x06010000, buttonsTilesLen / 2);

    hideSprites();

    shadowOAM[0].attr0 = ATTR0_Y(128) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = ATTR1_X(108) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(4, 0);

    shadowOAM[1].attr0 = ATTR0_Y(130) | ATTR0_SQUARE;
    shadowOAM[1].attr1 = ATTR1_X(70) | ATTR1_MEDIUM;
    shadowOAM[1].attr2 = ATTR2_TILEID(0, 0);

    shadowOAM[2].attr0 = ATTR0_Y(130) | ATTR0_SQUARE;
    shadowOAM[2].attr1 = ATTR1_X(142) | ATTR1_MEDIUM;
    shadowOAM[2].attr2 = ATTR2_TILEID(8, 0);

    shadowOAM[3].attr0 = ATTR0_Y(34) | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[3].attr1 = ATTR1_X(195) | ATTR1_TINY;
    shadowOAM[3].attr2 = ATTR2_TILEID(12, 0);

    shadowOAM[4].attr0 = ATTR0_Y(33) | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[4].attr1 = ATTR1_X(159) | ATTR1_SMALL;
    shadowOAM[4].attr2 = ATTR2_TILEID(12, 1);

    shadowOAM[5].attr0 = ATTR0_Y(33) | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[5].attr1 = ATTR1_X(64) | ATTR1_SMALL;
    shadowOAM[5].attr2 = ATTR2_TILEID(12, 3);

    shadowOAM[6].attr0 = ATTR0_Y(3) | ATTR0_SQUARE;
    shadowOAM[6].attr1 = ATTR1_X(2) | ATTR1_MEDIUM;
    shadowOAM[6].attr2 = ATTR2_TILEID(0, 8) | ATTR2_PRIORITY(3);

    shadowOAM[7].attr0 = ATTR0_Y(3) | ATTR0_SQUARE;
    shadowOAM[7].attr1 = ATTR1_X(206) | ATTR1_MEDIUM;
    shadowOAM[7].attr2 = ATTR2_TILEID(4, 8) | ATTR2_PRIORITY(3);
    
    buttons = REG_BUTTONS;
    oldButtons = 0;

    // TODO 2.2: Set up sounds
    setupSounds();
    

    setupInterrupts();
    goToOff();
    
}

void goToOff() {

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    shadowOAM[3].attr0 = ATTR0_Y(34) | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[4].attr0 = ATTR0_Y(33) | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[5].attr0 = ATTR0_Y(33) | ATTR0_SQUARE | ATTR0_HIDE;
    state = OFF;

    // Disable timers
    REG_TM2CNT = 0;
    REG_TM2D = 0;
    REG_TM3CNT = 0;
    REG_TM2D = 0;

    // TODO 4.2: Stop sounds when MP3 turns off
    stopSounds();
    

}

void off() {
    if (BUTTON_PRESSED(BUTTON_START)) goToOn();
    seed++;
    
}

void goToOn() {
    init();
    srand(seed);
    state = ON;

}

void on() {
    if (BUTTON_PRESSED(BUTTON_START)) goToOff();
    update();
    mgba_printf("%d VBlank count | %d min : %d sec", soundA.vBlankCount, minute, second);
    draw();
    
}

void setupInterrupts() {

	REG_IME = 0;

    // TODO 1.0: Set correct bits in interrupt enable register
    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    
    
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_INTERRUPT = &interruptHandler;

	REG_IME = 1;

}

void interruptHandler() {

	REG_IME = 0;

    if (REG_IF & IRQ_TIMER(2)) {

        // TODO 1.3: Handle second timer interrupt
        second++;
        if (second > 60) {
            second = 0;
        }

    } 

    if (REG_IF & IRQ_TIMER(3)) {

        // TODO 1.4: Handle minute timer interrupt
        minute++;
        if (minute > 99) {
            minute = 0;
        }
    
    }

	if (REG_IF & IRQ_VBLANK) {

        // TODO 2.0: Handle soundA
        if (soundA.isPlaying) {
            soundA.vBlankCount ++;
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

        // TODO 2.1: Handle soundB
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

}