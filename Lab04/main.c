#include "gba.h"
#include "axolotl.h"
#include "text.h"

// Variables
AXOLOTL axolotls[AXOLOTLCOUNT];
u16 buttons;
u16 oldButtons;
int frameCounter;

// State enum
enum STATE {REST, ANIMATE} state;

// Prototypes
void initialize();
void updateGame();
void drawGame();
void reverseAxolotls();

// TODO 1.2: Add your state transition function prototypes here
void goToRest();
void goToAnimate();
void gameState();
void swap(AXOLOTL*, AXOLOTL*);

// TODO 4.1: Add the function prototype for the swap method you wrote

int main() {
    // First, set up
    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State Machine
        // TODO 1.0: Make the state machine here
        switch(state) {
            case REST:
                goToRest();
                break;
            case ANIMATE:
                goToAnimate();
                break;
        }
        gameState();
        // TODO 3.2: Add the appropriate function calls to each state
    }
    return 0;

}

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

    // TODO 1.3: Call goToRest()
    goToRest();

    frameCounter = 0;
    initializeAxolotls();
}

// TODO 1.1: Make your state transition functions
void goToRest() {
    drawRect(20, 10, 110, 20, BLACK);
    drawString(20, 10, "Resting Axolotls", YELLOW);
    state = REST;

    waitForVBlank();
    drawGame();
}
void goToAnimate() {
    drawRect(20, 10, 97, 20, BLACK);
    drawString(20, 10, "Animated Axolotls!", GREEN);
    state = ANIMATE;

    updateGame();
    waitForVBlank();
    drawGame();
}

void gameState() {
    if ((state == REST) && (BUTTON_PRESSED(BUTTON_START))) {
        goToAnimate();
    } else if ((state == ANIMATE) && (BUTTON_PRESSED(BUTTON_START))) {
        goToRest();
    }
}
// TODO 2.1: Add drawString calls for each state transition function inside your state machine 

// TODO 2.2: Add your drawRect calls to hide text from the previous state

void updateGame() {
    // Animates axolotls so they are constantly swapping
    
    frameCounter++;
    if (frameCounter == 20) {
        frameCounter = 0;
        reverseAxolotls();
    }
}

void drawGame() {
    for (int i = 0; i < AXOLOTLCOUNT; i++) {
            drawAxolotl(&axolotls[i], i);
        }
}

void reverseAxolotls() {
    // TODO 4.2: Implement this method, calling a helper method called swap; ensure you do an in-place array reversal
    for (int i = 0; i < AXOLOTLCOUNT / 2; i++) {
        swap(&axolotls[i], &axolotls[AXOLOTLCOUNT - i - 1]);
    }
    
}

// TODO 4.0: Implement swap for two kitties
void swap(AXOLOTL* axolotl1, AXOLOTL* axolotl2) {
    AXOLOTL temp = *axolotl1;
    *axolotl1 = *axolotl2;
    *axolotl2 = temp;

}
