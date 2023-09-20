#include "gba.h"
#include "print.h"
#include "main.h"
#include "unistd.h"

enum CustomGameState currentState = FRAME_1;
enum CustomGameState prevFrame = FRAME_4;

int isLooping = 0;
int frameIncrement = 1;

void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    mgba_open();
    mgba_printf("%s", "Debug logs initialized!");
    pX = 10;
    pY = 10;
    fillScreen(WHITE);
    drawFrame1();
}
void cleanupArea(int x, int y, int width, int height) {
    drawRectangle(x, y, width, height, WHITE);
}

void processInputs() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        isLooping = !isLooping;
    }

    if (BUTTON_PRESSED(BUTTON_A) || isLooping) {
        currentState += frameIncrement;
        currentState %= 4;
    }
    else if (BUTTON_PRESSED(BUTTON_B)) {
        currentState -= frameIncrement;
        currentState %= 4;
    }
    if (BUTTON_PRESSED(BUTTON_SELECT) && frameIncrement == 1) {
        isLooping = 1;
        frameIncrement *= -1;

    }
    else if (BUTTON_PRESSED(BUTTON_SELECT) && frameIncrement == -1) {
        isLooping = 1;
        frameIncrement *= -1;
    }
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        currentState = 0;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        currentState = 3;
    }
}

void updateGame() {
    enum CustomGameState originalState = currentState;
    processInputs();
    if (originalState == currentState) {
        return;
    }
    else if (isLooping) {
        delay(100);
    }

    switch(originalState) {
        case FRAME_1:
            cleanupFrame1();
            break;
        case FRAME_2:
            cleanupFrame2();
            break;
        case FRAME_3:
            cleanupFrame3();
            break;
        case FRAME_4:
            cleanupFrame4();
            break;
    }
    
    switch(currentState) {
        case FRAME_1:
            drawFrame1();
            break;
        case FRAME_2:
            drawFrame2();
            break;
        case FRAME_3:
            drawFrame3();
            break;
        case FRAME_4:
            drawFrame4();
            break;
    }

    

}
void cleanupFrame1() {
    cleanupArea(pX - 10, pY, 55, 55);
}
void cleanupFrame2() {
    cleanupArea(pX + 50, pY, 60, 60);
}
void cleanupFrame3() {
    cleanupArea(pX + 50, pY + 30, 55, 55);
}
void cleanupFrame4() {
    cleanupArea(pX - 10, pY + 33, 55, 55);
}


void drawFrame1() {
    drawMushroom(pX, pY, BLACK, RED, ORANGE);
}
void drawFrame2() {
    drawMouth(pX + 60, pY, BLACK, PURPLE, ORANGE);
    drawRectangle(pX + 61, pY +21, 3, 10, BLACK);
    drawRectangle(pX + 59, pY + 25, 4, 2, BLACK);
    drawRectangle(pX + 67, pY + 21, 3, 10, BLACK);
    drawRectangle(pX + 68, pY + 25, 4, 2, BLACK);
}
void drawFrame3() {
    drawMushroom(pX + 60, pY + 30, BLACK, GREEN, ORANGE);
    drawRectangle(pX + 61, pY + 51, 3, 10, BLACK);
    drawRectangle(pX + 59, pY + 55, 4, 2, BLACK);
    drawRectangle(pX + 67, pY + 51, 3, 10, BLACK);
    drawRectangle(pX + 68, pY + 55, 4, 2, BLACK);
    
}
void drawFrame4() {
    drawMouth(pX, pY + 33, PURPLE, GREEN, ORANGE);
    
}


int main() {
    initialize();
    while (1) {
        oldButtons = buttons;
		buttons = REG_BUTTONS;

        updateGame();
        waitForVBlank();
    }
    return 0;
}