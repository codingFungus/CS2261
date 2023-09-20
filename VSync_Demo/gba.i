# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1
# 29 "gba.h"
typedef unsigned short u16;


extern volatile unsigned short* videoBuffer;


void drawHorizontalLine(int, int, int, u16);
void waitForVBlank();
# 2 "gba.c" 2

volatile unsigned short* videoBuffer = (volatile unsigned short*) 0x6000000;

void drawHorizontalLine(int x, int y, int length, u16 color) {

    for (int dx = 0; dx < length; dx++) {
        (videoBuffer[((y) * (240) + (x + dx))] = color);

    }

}

void waitForVBlank() {
    while ((*(volatile unsigned short *) 0x04000006) >= 160);
    while ((*(volatile unsigned short *) 0x04000006) < 160);

}
