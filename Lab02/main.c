// TODO 1.0: Include header files
#include "gba.h"
#include "print.h"

// Function Prototypes
void initialize();
void updateGame();
void drawGame();

int main() {

    initialize();

    // TODO 2.4: Test your drawing functions here!

    while (1) {
        // TODO 3.2: Add game loop functions in the correct order
        updateGame();
        waitForVBlank();
        drawGame();


    }
    
    return 0;

}

void initialize() {
    
    // TODO 1.1: Initialize MGBA logs
    mgba_open();

    mgba_printf("%s", "Debug logs initialized!");
    REG_DISPCTL = MODE(3) | BG2_ENABLE;

}

// TODO 3.3: Choose the two colors the flickering rectangle switches between
#define COLOR1 RGB(0, 0, 16)
#define COLOR2 RGB(0, 16, 0)

// TODO 3.3: Choose the rate at which the rectangle color flickers
#define FRAME_DELAY 10

u16 flickeringColor = COLOR1;
int frameCount = 0;

void updateGame() {

    // Switch flickering rectangle from color 1 to color 2 after FRAME_DELAY number of frames
    if (frameCount > FRAME_DELAY && flickeringColor == COLOR1) {
        frameCount = 0;
        flickeringColor = COLOR2;

    // Switch flickering rectangle from color 2 to color 1 after FRAME_DELAY number of frames
    } else if (frameCount > FRAME_DELAY && flickeringColor == COLOR2) {
        frameCount = 0;
        flickeringColor = COLOR1;

    }

    frameCount++;

    // TODO 3.4: Print the frameCount variable every frame
    mgba_printf("Frame count: %d", frameCount);


}

void drawGame() {
    

    // TODO 3.5: Call your drawRectangle function using flickeringColor
    drawRectangle(10, 10, 40, 30, flickeringColor);


    //TODO 3.5: Call your drawRightTriangle function using flickeringColor

    drawRightTriangle(70, 10, 40, flickeringColor);
    // TODO 3.5: Call your drawParallelogram function using flickeringColor
    drawParallelogram(70, 60, 45, 30, flickeringColor);


    // TODO 3.5: Call your drawCircle function using flickeringColor
    drawCircle(40, 80, 20, flickeringColor);


}