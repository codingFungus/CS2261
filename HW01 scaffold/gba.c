#include "gba.h"

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = x1; i <= x2; i++) {
        setPixel(i, y, color);
    }
}

void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i <= y2; i++) {
        setPixel(x, i, color);
    }
}

// TODO: Add this function from Lab 2
void drawRectangle(int x, int y, int width, int height, u16 color) {
    for (int i = x; i < x + width; i++) {
        for (int j = y; j < y + height; j++) {
            setPixel(x + i, y + j, color);
        }
    }
}

//draw circle function from lab2
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
void fillScreen(unsigned short color) {
    for (int i = 0; i < SCREENWIDTH * SCREENHEIGHT; i++) {
        videoBuffer[i] = color;
    }

}

void drawMushroom(int x, int y, u16 frameColor, u16 headColor, u16 faceColor) {
    //frame of mushroom
    drawRectangle(x, y, 20, 2, frameColor);
    drawRectangle(x - 3, y + 1, 7, 2, frameColor);
    drawRectangle(x + 10, y + 1, 7, 2, frameColor);
    drawRectangle(x - 4, y + 2, 3, 3, frameColor);
    drawRectangle(x + 13, y + 2, 3, 3, frameColor);
    drawRectangle(x - 5, y + 3, 3, 8, frameColor);

    drawRectangle(x + 14, y + 3, 3, 8, frameColor);
    drawRectangle(x - 6, y + 6, 3, 17, frameColor);
    drawRectangle(x + 15, y + 6, 3, 17, frameColor);
    drawRectangle(x - 1, y + 13, 24, 3, frameColor);
    //left face vertical line
    drawRectangle(x - 5, y + 14, 8, 3, frameColor);
    //right face vertical line
    drawRectangle(x + 11, y + 14, 8, 3, frameColor);
    drawRectangle(x - 4, y + 14, 3, 10, frameColor);
    drawRectangle(x + 13, y + 14, 3, 10, frameColor);

    drawRectangle(x + 2, y + 13, 3, 9, frameColor);
    drawRectangle(x + 6, y + 13, 3, 9, frameColor);
    drawRectangle(x - 3, y + 19, 3, 3, frameColor);
    drawRectangle(x + 12, y + 19, 3, 3, frameColor);
    drawRectangle(x - 2, y + 20, 28, 3, frameColor);


    //red parts of mushroom
    //red rectangle on the top
    drawRectangle(x, y + 1, 16, 10, headColor);
    drawRectangle(x - 1, y + 5, 3, 6, headColor);
    drawRectangle(x - 3.5, y + 6, 6, 3, headColor);
    drawRectangle(x + 8, y + 5, 3, 5, headColor);
    drawRectangle(x + 8, y + 7, 8, 3, headColor);

    drawRectangle(x + 11, y + 7, 3, 5, headColor);
    drawRectangle(x + 11.5, y + 8, 8, 3, headColor);
    drawRectangle(x + 9, y + 8, 4, 8, headColor);
    drawRectangle(x + 8, y + 11, 4, 4, headColor);
    drawRectangle(x + 13, y + 12, 4, 5, headColor);

    drawRectangle(x - 2, y + 7, 3, 3, headColor);
    drawRectangle(x - 2, y + 8, 3, 5, headColor);
    drawRectangle(x - 2, y + 10, 4, 3, headColor);
    drawRectangle(x - 4.1, y + 11, 6, 3, headColor);

    drawRectangle(x - 1, y + 10, 2, 6.5, headColor);
    drawRectangle(x - 1, y + 12, 24, 3, headColor);
    drawRectangle(x - 2, y + 13, 2, 2, headColor);
    drawRectangle(x - 4.1, y + 8, 3, 6, headColor);

    //face color
    drawRectangle(x - 2.5, y + 15.5, 10, 6, faceColor);
    
    drawRectangle(x - 0.5, y + 14.5, 6, 2, faceColor);
    drawRectangle(x - 2.5, y + 18, 6, 3, faceColor);
    drawRectangle(x - 1.3, y + 17, 28, 6, faceColor);
    drawRectangle(x + 3.5, y + 14.5, 6, 6, faceColor);
    drawRectangle(x + 7, y + 14.5, 6, 6, faceColor);
    drawRectangle(x + 9, y + 14.5, 4, 6, faceColor);
    drawRectangle(x + 11, y + 15, 5, 8, faceColor);
}


void drawMouth(int x, int y, u16 color1, u16 color2, u16 color3) {
    drawMushroom(x, y, color1, color2, color3);
    drawRectangle(x + 2.5, y + 19, 8, 4, WHITE);
    drawRectangle(x + 3, y + 20, 4, 2, RED);
}
void delay(int x) {
    volatile int num = 0;
    for (int i = 0; i < 1000 * x; i++) {
        num++;
    }
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}
