#include "gba.h"
#include "font.h"

volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

DMA *dma = (DMA *)0x40000B0;
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    dma[channel].cnt = 0;
    dma[channel].src = src;
    dma[channel].dst = dst;
    dma[channel].cnt = cnt | DMA_ON;
    
}

void drawRectangle(int x, int y, int width, int height, unsigned short color) {
    //use DMA version
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, &videoBuffer[OFFSET(x, y + i, SCREENWIDTH)], width | DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT);
    }
}

void fillScreen(unsigned short color) {
    //use DMA version
    volatile u16 c = color;
    DMANow(3, &c, videoBuffer, 38400 | DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT | DMA_16);
}
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

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata[(48 * ch + i + 6 * j)]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, unsigned short color) {
    int i = 0;
    while (str[i] != '\0') {
        drawChar(x + (i * 6), y, str[i], color);
        i++;
    }
}