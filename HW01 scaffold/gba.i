# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 42 "gba.h"
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;


void waitForVBlank();
void drawHorizontalLine(int, int, int, u16);
void drawVerticalLine(int, int, int, u16);
void drawRectangle(int, int, int, int, u16);
void fillScreen(u16);
void drawMushroom(int, int, u16, u16, u16);
void moveMushLR(int, int, u16, u16, u16);
void drawMouth(int, int, u16, u16, u16);
# 82 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = x1; i <= x2; i++) {
        (videoBuffer[((y) * (240) + (i))] = color);
    }
}

void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = y1; i <= y2; i++) {
        (videoBuffer[((i) * (240) + (x))] = color);
    }
}


void drawRectangle(int x, int y, int width, int height, u16 color) {
    for (int i = x; i < x + width; i++) {
        for (int j = y; j < y + height; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }
}


void drawCircle(int x, int y, int radius, u16 color) {
    for (int i = x - radius; i < x + radius; i++) {
        for (int j = y - radius; j < y + radius; j++) {
            int dSquare = (i - x) * (i - x) + (j - y) * (j - y);
            if (dSquare <= radius * radius) {
                (videoBuffer[((j) * (240) + (i))] = color);
            }
        }
    }


}
void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }

}

void drawMushroom(int x, int y, u16 frameColor, u16 headColor, u16 faceColor) {

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

    drawRectangle(x - 5, y + 14, 8, 3, frameColor);

    drawRectangle(x + 11, y + 14, 8, 3, frameColor);
    drawRectangle(x - 4, y + 14, 3, 10, frameColor);
    drawRectangle(x + 13, y + 14, 3, 10, frameColor);

    drawRectangle(x + 2, y + 13, 3, 9, frameColor);
    drawRectangle(x + 6, y + 13, 3, 9, frameColor);
    drawRectangle(x - 3, y + 19, 3, 3, frameColor);
    drawRectangle(x + 12, y + 19, 3, 3, frameColor);
    drawRectangle(x - 2, y + 20, 28, 3, frameColor);




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
    drawRectangle(x + 2.5, y + 19, 8, 4, 0x7FFF);
    drawRectangle(x + 3, y + 20, 4, 2, (((31) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10)));
}
void delay(int x) {
    volatile int num = 0;
    for (int i = 0; i < 1000 * x; i++) {
        num++;
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *) 0x04000006) >= 160);
    while ((*(volatile unsigned short *) 0x04000006) < 160);
}
