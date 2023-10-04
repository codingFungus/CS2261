#include "gba.h"
#include "print.h"


//prototypes
void initialize();

void goToStart();
void start();
void goToGame();
void game();
void goToWin();
void win();
void goToLose();
void lose();



enum {
    START, 
    GAME,
    WIN,
    LOSE
};
int state;

unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while (1) {
       oldButtons = buttons;
       buttons = REG_BUTTONS;

       switch(state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
       }
    }
    
    return 0;

}
void goToStart() {
    fillScreen(BLUE);
    drawString(50, 40, "Press START to begin", WHITE);
    waitForVBlank();
    state = START;
}

void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
    }
}
void goToGame() {
    state = GAME;

}
//modify
void game() {
    updateGame();
    drawGame();

    if (player.life <= 0) {
        goToLose();
    }
    if (player.y < 20) {
        goToWin();
    }
    
}

void goToWin() {
    fillScreen(WHITE);
    drawString(50, 40, "Congrats you win!", GREEN);
    drawString(50, 60, "press START to try again", BLUE);
    waitForVBlank();
    state = WIN;
}
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
void goToLose() {
    fillScreen(BLACK);
    drawString(50, 40, "Ahhh no game over", RED);
    drawString(50, 60, "press START to try again", BLUE);
    waitForVBlank();
    state = LOSE;
}
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();         
    }
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
	mgba_open();
    mgba_printf_level(1, "Debugger Opened");
    buttons = REG_BUTTONS;
    oldButtons = 0;
    goToStart();
    
}

