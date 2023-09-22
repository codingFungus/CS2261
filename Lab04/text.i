# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 36 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 62 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
# 79 "gba.h"
extern unsigned short oldButtons;
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int x, int y, char ch, unsigned short color) {

    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            int localIndex = i + (6 * j);
            if (fontdata_6x8[48 * ch + localIndex]) {
                (videoBuffer[((y + j) * (240) + (x + i))] = color);
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
