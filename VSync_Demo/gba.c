#include "gba.h"

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int x, int y, int length, u16 color) { 
    
    for (int dx = 0; dx < length; dx++) {
        setPixel(x + dx, y, color);

    }

}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);

}