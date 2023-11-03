#include "gba.h"
#include "print.h"
#include "mode4.h"

void initialize();
void setupInterrupts();
void interruptHandler();

int vBlanks;
int log;
int waitingForVBlank;

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        if (log) {
            mgba_printf("vBlanks: %d", vBlanks);
            log = 0;
        }

        // TODO 3.0 - Replace waitForVBlank()
        waitingForVBlank = 1;
        while (waitingForVBlank) {
            __asm__("swi 0x04 << 15");
        }

    }
}

void interruptHandler() {
    REG_IME = 0;
    // TODO 1.1 - Identify if the interrupt was a vBlank interrupt 

    if (REG_IF & IRQ_VBLANK) {
        // TODO 1.2 - In the case of a vBlank interrupt, add to the vBlank count
        vBlanks += 1;
        waitingForVBlank = 0;
        setPixel4(120, 0, 1);
    }
    // TODO 2.1 - Identify is the interrupt was a Button interrupt
    if (REG_IF & IRQ_BUTTON) {
        // TODO 2.2 - In the case of a button interrupt, set the log var to true
        log = 1;
    }
    
    REG_IF = REG_IF; // Tell the GBA the interrupts were handled
    return; // Return
}

void setupInterrupts() {
    REG_IME = 0; // disable interrupts
    // TODO 1.0 - Enable vBlank Interrupts
    REG_IE = IRQ_VBLANK;
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;
    
    // TODO 2.0 - Enable Button Interrupts for START
    REG_IE - IRQ_VBLANK | IRQ_BUTTON;
    REG_KEYCNT = KEYCNT_IRQ | BUTTON_START;
    REG_INTERRUPT = interruptHandler; // provide the GBA with an interrupt handler
    REG_IME = 1; // enable interrupts
}

void initialize() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    PALETTE[1] = RGB(16, 16, 31);
    mgba_open();
    vBlanks = 0;
    log = 0;
    setupInterrupts();
}
