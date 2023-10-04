#include "gba.h"


volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

void drawRectangle(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            setPixel(x + i, y + j, color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}


void drawSafe() {
    drawRectangle(0, 145, 240, 15, YELLOW);
    
    drawRectangle(0, 80, 240, 15, YELLOW);
    
    drawRectangle(0, 0, 240, 30, BLUE);

\
}



void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            int localIndex = i + (6 * j);
            if (fontdata[48 * ch + localIndex]) {
                setPixel(x + i, y + j, color);
            }
        }
    }
}

void drawString(int x, int y, char *str, unsigned short color) {
    int currentIndedx = 0;
    while (str[currentIndedx] != '\0') {
        drawChar(x + (6 * currentIndedx), y, str[currentIndedx], color);
        currentIndedx++;

    }
    
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}