#include "gba.h"
#include "print.h"
#include "game.h"
#include <stdio.h>

void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

void srand();

enum{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

unsigned short buttons;
unsigned short oldButtons;

int seed;

char buffer1[41];

int main() {

    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        //state machine
        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }

    }

}

void goToStart() {
    fillScreen(BLUE);
    state = START;
    drawString(50, 50, "press START to begin", MAGENTA);
    seed = 0;
}
void start() {
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}
void goToGame() {
    fillScreen(BLACK);
    drawString(140, 5, "Score: ", WHITE);
    drawString(5, 5, "You only live once!", CYAN);

    state = GAME;
    REG_SND2CNT = DMG_ENV_VOL(4) | DMG_DIRECTION_DECR |
                    DMG_STEP_TIME(2) | DMG_DUTY_50;
    REG_SND2FREQ = SND_RESET | NOTE_E5;
}


void game() {
    updateGame();
    sprintf(buffer1, "%u", score);
    waitForVBlank();
    drawGame();
    drawRectangle(180, 5, 6, 8, BLACK);
    drawString(180, 5, buffer1, BLUE);


    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (score == 7) {
        goToWin();
    } else if (player.dead) {
        goToLose();
    }
    
}
void goToPause() {
    fillScreen(GRAY);
    drawString(50, 50, "Pause", BLUE);
    drawString(50, 70, "press SELECT to start again", CYAN);
    state = PAUSE;

}
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}
void goToWin() {
    fillScreen(MAGENTA);
    drawString(50, 50, "You Win!", YELLOW);
    state = WIN;
    REG_SND2CNT = DMG_ENV_VOL(4) | DMG_DIRECTION_DECR |
                    DMG_STEP_TIME(2) | DMG_DUTY_50;
    REG_SND2FREQ = SND_RESET | NOTE_C7;
}
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
void goToLose() {
    fillScreen(GRAY);
    drawString(50, 50, "You Lose, good luck next time", BLACK);
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
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;
    goToStart();
}