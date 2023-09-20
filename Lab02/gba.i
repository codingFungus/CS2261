# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 31 "gba.h"
typedef unsigned short u16;


extern volatile unsigned short* videoBuffer;


void drawRectangle(int, int, int, int, u16);
void drawRightTriangle(int, int, int, u16);
void drawParallelogram(int, int, int, int, u16);
void drawCircle(int x, int y, int, u16);

void waitForVBlank();
# 2 "gba.c" 2

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;


void drawRectangle(int x, int y, int width, int height, u16 color) {
    for (int i = x; i < x + width; i++) {
        for (int j = y; j < y + height; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }

}


void drawRightTriangle(int x, int y, int sideLength, u16 color) {
    int var = 0;
    for (int i = x; i < x + sideLength; i++) {
        for (int j = y; j < y + sideLength; j++) {
            if (j - y <= var) {
                (videoBuffer[((j) * (240) + (i))] = color);
            }

        }
        var++;
    }
}



void drawParallelogram(int x, int y, int width, int height, u16 color) {
    for (int i = 0; i < height; i++) {
        for (int blank = 0; blank < i; blank++) {
            (videoBuffer[((y + i) * (240) + (x + blank))] = 0);
        }
        for (int j = 0; j < width; j++) {
            (videoBuffer[((y + i) * (240) + (x + j + i))] = color);
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


void waitForVBlank() {
    while ((*(volatile unsigned short *) 0x04000006) >= 160);
    while ((*(volatile unsigned short *) 0x04000006) < 160);

}
