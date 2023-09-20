#include "gba.h"
#include "print.h"

// Function Prototypes
void initialize();
void updateGame();
void drawGame();

int main() {

    initialize();

    while (1) {
        updateGame();
        waitForVBlank();
        drawGame();


    }
    
    return 0;

}

void initialize() {
    mgba_open();
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

}

#define COLOR1 RGB(31, 31, 0)
#define COLOR2 RGB(31, 31, 31)

#define FRAME_DELAY 60

u16 flickeringColor = COLOR1;
int frameCount = 0;

void updateGame() {
    if (frameCount > 60 && flickeringColor == COLOR1) {
        flickeringColor = COLOR2;
        frameCount = 0;
    }
    if (frameCount > 30) {
        flickeringColor = COLOR1;
    }
    mgba_printf("Frame count: %d", frameCount);
    frameCount++;
    
}

void drawGame() {
    drawHorizontalLine(0, 0, 240, flickeringColor);

}