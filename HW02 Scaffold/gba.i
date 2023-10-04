# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1


# 1 "font.h" 1

extern const unsigned char fontdata[12288];
# 4 "gba.h" 2
# 1 "game.h" 1


typedef struct {
    int x;
    int y;
    int height;
    int width;
    int direction;
    int speed;

} Car;

typedef struct {
    int x;
    int y;
    int height;
    int width;
    int Xspeed;
    int Yspeed;
    int life;

} Player;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int speed;
    int direction;
} Log;






extern Player player;
extern Car cars[4];
extern Log logs[3];







void drawCars();
void drawLogs();
void drawPlayer();
void drawGame();
void updateLog();
void updateCars();
void updatePlayer();
void updateGame();
void playerHit();
void resetCar(int i);
void resetLog(int i);
void initGame();
int isInRiver();
int isOnLog();
# 5 "gba.h" 2


typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
# 25 "gba.h"
extern volatile unsigned short* videoBuffer;
# 38 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


void waitForVBlank();
# 58 "gba.h"
void drawRectangle(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawSafe();
void drawString(int x, int y, char *str, unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
# 77 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 2 "gba.c" 2


volatile unsigned short* videoBuffer = (unsigned short *)0x6000000;

void drawRectangle(int x, int y, int width, int height, unsigned short color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            (videoBuffer[((y + j) * (240) + (x + i))] = color);
        }
    }
}

void fillScreen(unsigned short color) {
    for (int i = 0; i < 240 * 160; i++) {
        videoBuffer[i] = color;
    }
}


void drawSafe() {
    drawRectangle(0, 145, 240, 15, (((31) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));

    drawRectangle(0, 80, 240, 15, (((31) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));

    drawRectangle(0, 0, 240, 30, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));


}



void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            int localIndex = i + (6 * j);
            if (fontdata[48 * ch + localIndex]) {
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

int collision(int xA, int yA, int widthA, int heightA, int xB, int yB, int widthB, int heightB) {
    return yA <= yB + heightB - 1 && yA + heightA - 1 >= yB && xA <= xB + widthB - 1 && xA + widthA - 1 >= xB;
}
