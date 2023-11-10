#include "gba.h"
#include "print.h"
#include "mode0.h"
#include "sprites.h"
#include "spritesheet.h"
#include "dance.h"
#include "start.h"
#include "danceBG.h"

// Function Prototypes
void initialize();
void setupStartInterrupts();
void setupDanceInterrupts();
void startInterruptHandler();
void danceInterruptHandler();

// State Function Prototypes
int switchToStart;
int switchToDance;
void goToStart();
void goToDance();

// Global Variables
enum {START, DANCE};
int state;
int vBlanks;
int paused;
int waitingForVBlank;
OBJ_ATTR shadowOAM[128];

// Button Tracking Variables
unsigned short oldButtons;
unsigned short buttons;

void initialize() {
    // Mode 0, Background 0, Sprites Enabled
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    // Enable Logs
    mgba_open();
    // Initialize flags
    switchToStart = 0;
    switchToDance = 0;
    // Load in spritesheet
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, spritesheetPalLen);
    // Init the paused flag
    paused = 0;
    // Go to the start state
    goToStart();
}

int main() {
    // Initialize
    initialize();
    while (1) {
        if (switchToDance) {
            goToDance();
            switchToDance = 0;
        } else if (switchToStart) {
            goToStart();
            switchToStart = 0;
        }
        // Put the GBA into low power mode
        __asm__("swi 0x04 << 15");
    }
}

void startInterruptHandler() {
    // TODO 1.5 - Disable Interrupts
    REG_IME = 0;

    // TODO 1.6 - Identify is the interrupt was a Button interrupt
    if (REG_IF & IRQ_BUTTON) {
        // TODO 1.7 - In the case of a button interrupt, set the goToDance flag
        switchToDance = 1;
        // switchToDance = 1;
    }
    // TODO 1.8 - Tell the GBA the interrupts were handled
    REG_IF = REG_IF;

    // TODO 1.9 - Re-enable interrupts
    REG_IME = 1;

    // Return
    return; 
}

void danceInterruptHandler() {
    // TODO 2.5 - Disable interrupts
    REG_IME = 0;
    
    // TODO 2.6 - Identify if the interrupt was a vBlank interrupt or a button interrupts
    if (REG_IF & IRQ_BUTTON) {
        // TODO 2.7 - In the case of a button interrupt, set the paused flag
        paused = !paused;
        
    }
    if (REG_IF & IRQ_VBLANK) {
        // TODO 2.7 - In the case of a vBlank interrupt, call dance
        dance();
    }
    // TODO 2.8 - Tell the GBA the interrupts were handled
    REG_IF = REG_IF;

    // TODO 2.9 - Re-enable interrupts
    REG_IME = 1;

    // Return
    return; 
}

void setupStartInterrupts() {
    // TODO 1.0 - Disable Interrupts
    REG_IME = 0;
    
    // TODO 1.1 - Enable Button Interrupts
    REG_IE = IRQ_BUTTON;
    
    // TODO 1.2 - Set the Interrupt Handler
    REG_INTERRUPT = startInterruptHandler;
    
    // TODO 1.3 - Set the Button Interrupt Controller
    REG_KEYCNT = KEYCNT_IRQ | BUTTON_START;
    REG_IE - IRQ_VBLANK | IRQ_BUTTON;

    
    // TODO 1.4 - Re-enable Interrupts
    REG_IME = 1;
    
}

void setupDanceInterrupts() {
    // TODO 2.0 - Disable interrupts
    REG_IME = 0;

    // TODO 2.1 - Enable vBlank Interrupts and button interrupts
    REG_IE = IRQ_VBLANK | IRQ_BUTTON;

    // TODO 2.3 - Enable vBlank Interrupts and button interrupts for select
    REG_IE = IRQ_VBLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    REG_KEYCNT = KEYCNT_IRQ | BUTTON_SELECT;



    // TODO 2.2 - Provide the GBA with an interrupt handler
    REG_INTERRUPT = danceInterruptHandler;

    // TODO 2.4 - Re-enable interrupts
    REG_IME = 1;

}

void goToStart() {
    // Update the state
    state = START;
    // Hide sprites
    hideSprites();
    DMANow(3, &shadowOAM, OAM, 512);
    // Setup our dance
    initDancer();
    // Load in background
    DMANow(3, &startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, &startMap, &SCREENBLOCK[28], startMapLen / 2);
    DMANow(3 ,&startPal, PALETTE, startPalLen);
    // TODO 1.10 - Call setup start interrupts
    setupStartInterrupts();
}

void goToDance() {
    // Update the state
    state = DANCE;
    // Load in background
    DMANow(3, &danceBGTiles, &CHARBLOCK[0], danceBGTilesLen / 2);
    DMANow(3, &danceBGMap, &SCREENBLOCK[28], danceBGMapLen / 2);
    DMANow(3 ,&danceBGPal, PALETTE, danceBGPalLen);
    // TODO 2.10 - Call setup dance interrupts
    setupDanceInterrupts();
}