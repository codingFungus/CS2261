#include "gba.h"

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void drawRect(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++){
        for (int j = 0; j < height; j++){
            setPixel(x+i, y+j, color);
        }
    }
}

void fillScreen(unsigned short color) {
    // TODO 1.0: implement this function
    // note: you may only use a single loop
    for (int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
        videoBuffer[i] = color;
    }

}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    // TODO 4.0: implement this function
    return xA < xB + widthB - 1 && xA + widthA - 1 > xB
        && yA < yB + heightB - 1 && yA + heightA - 1 > yB;
    
}