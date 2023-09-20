# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 33 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);


typedef unsigned short u16;


extern volatile unsigned short* videoBuffer;
# 56 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void drawRectangle(int, int, int, int, u16);
void drawRightTriangle(int, int, int, int, u16);
void drawParallelogram(int, int, int, int, u16);
void drawCircle(int x, int y, int, u16);

void waitForVBlank();
# 2 "gba.c" 2

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void drawRect(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++){
        for (int j = 0; j < height; j++){
            (videoBuffer[((y+j) * (240) + (x+i))] = color);
        }
    }
}

void fillScreen(unsigned short color) {


    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }

}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {

    return xA < xB + widthB - 1 && xA + widthA - 1 > xB
        && yA < yB + heightB - 1 && yA + heightA - 1 > yB;

}
