#include "gba.h"

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

// TODO 2.0: Complete this function
void drawRectangle(int x, int y, int width, int height, u16 color) { 
    for (int i = x; i < x + width; i++) {
        for (int j = y; j < y + height; j++) {
            setPixel(x + i, y + j, color);
        }
    }

}

// TODO 2.1: Complete this function
void drawRightTriangle(int x, int y, int sideLength, u16 color) {
    int var = 0;
    for (int i = x; i < x + sideLength; i++) {
        for (int j = y; j < y + sideLength; j++) {
            if (j - y <= var) {
                setPixel(i, j, color);
            }
            
        }
        var++;
    }
}


// TODO 2.2: Complete this function
void drawParallelogram(int x, int y, int width, int height, u16 color) {
    for (int i = 0; i < height; i++) {
        for (int blank = 0; blank < i; blank++) {
            setPixel(x + blank, y + i, BLACK);
        }
        for (int j = 0; j < width; j++) {
            setPixel(x + j + i, y + i, color);
        }
    }



}

// TODO 2.3: Complete this function
void drawCircle(int x, int y, int radius, u16 color) {
    for (int i = x - radius; i < x + radius; i++) {
        for (int j = y - radius; j < y + radius; j++) {
            int dSquare = (i - x) * (i - x) + (j - y) * (j - y);
            if (dSquare <= radius * radius) {
                setPixel(i, j, color);
            }
        }
    }


}

// TODO 3.1: Complete this function
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);

}
