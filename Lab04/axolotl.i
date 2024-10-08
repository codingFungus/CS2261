# 1 "axolotl.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "axolotl.c"
# 1 "axolotl.h" 1




typedef struct {
 int* bitmap;
 unsigned short color;
} AXOLOTL;

extern AXOLOTL axolotls[5];
extern int* axolotlBitmaps[5];


void initializeAxolotls();
void drawAxolotl(AXOLOTL* axolotl_ptr, int index);
# 2 "axolotl.c" 2
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
# 3 "axolotl.c" 2

AXOLOTL axolotls[5];
int bitmap1[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0,
                0, 5, 0, 5, 2, 5, 0, 0, 0, 0, 5, 2, 5, 0, 5, 0,
                5, 2, 5, 5, 3, 2, 5, 0, 0, 5, 2, 3, 5, 5, 2, 5,
                5, 3, 2, 5, 5, 3, 2, 5, 5, 2, 3, 5, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 5, 5, 0,
                5, 2, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 2, 5,
                5, 3, 2, 5, 1, 1, 4, 4, 4, 4, 1, 1, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0,
                0, 0, 0, 5, 5, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0, 0,
                0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0};

int bitmap2[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0,
                0, 5, 0, 5, 2, 5, 0, 0, 0, 0, 5, 2, 5, 0, 5, 0,
                5, 2, 5, 5, 3, 2, 5, 0, 0, 5, 2, 3, 5, 5, 2, 5,
                5, 3, 2, 5, 5, 3, 2, 5, 5, 2, 3, 5, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 5, 5, 0,
                5, 2, 5, 5, 4, 1, 4, 4, 4, 4, 1, 4, 5, 5, 2, 5,
                5, 3, 2, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 1, 1, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 5, 4, 4, 1, 4, 4, 1, 4, 4, 5, 5, 0, 0,
                0, 0, 0, 5, 5, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0, 0,
                0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0};

int bitmap3[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0,
                0, 5, 0, 5, 2, 5, 0, 0, 0, 0, 5, 2, 5, 0, 5, 0,
                5, 2, 5, 5, 3, 2, 5, 0, 0, 5, 2, 3, 5, 5, 2, 5,
                5, 3, 2, 5, 5, 3, 2, 5, 5, 2, 3, 5, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 5, 5, 0,
                5, 2, 5, 5, 4, 1, 4, 4, 4, 4, 1, 4, 5, 5, 2, 5,
                5, 3, 2, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 1, 1, 1, 1, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0,
                0, 0, 0, 5, 5, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0, 0,
                0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0};

int bitmap4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0,
                0, 5, 0, 5, 2, 5, 0, 0, 0, 0, 5, 2, 5, 0, 5, 0,
                5, 2, 5, 5, 3, 2, 5, 0, 0, 5, 2, 3, 5, 5, 2, 5,
                5, 3, 2, 5, 5, 3, 2, 5, 5, 2, 3, 5, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 5, 5, 0,
                5, 2, 5, 5, 4, 1, 4, 4, 4, 4, 1, 4, 5, 5, 2, 5,
                5, 3, 2, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 1, 4, 4, 1, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 5, 4, 4, 4, 1, 1, 4, 4, 4, 5, 5, 0, 0,
                0, 0, 0, 5, 5, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0, 0,
                0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0};

int bitmap5[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0,
                0, 5, 0, 5, 2, 5, 0, 0, 0, 0, 5, 2, 5, 0, 5, 0,
                5, 2, 5, 5, 3, 2, 5, 0, 0, 5, 2, 3, 5, 5, 2, 5,
                5, 3, 2, 5, 5, 3, 2, 5, 5, 2, 3, 5, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 5, 5, 0,
                5, 2, 5, 5, 4, 1, 4, 4, 4, 4, 1, 4, 5, 5, 2, 5,
                5, 3, 2, 5, 4, 4, 4, 4, 4, 4, 4, 4, 5, 2, 3, 5,
                0, 5, 3, 2, 4, 4, 4, 1, 1, 4, 4, 4, 2, 3, 5, 0,
                0, 5, 5, 5, 4, 4, 4, 1, 1, 4, 4, 4, 5, 5, 0, 0,
                0, 0, 0, 5, 5, 4, 4, 4, 4, 4, 4, 5, 5, 0, 0, 0,
                0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0};



int* axolotlBitmaps[] = {bitmap1, bitmap2, bitmap3, bitmap4, bitmap5};

void initializeAxolotls() {
    for (int i = 0; i < 5; i++) {
        axolotls[i].bitmap = axolotlBitmaps[i];
        switch (i) {
            case 0:
                axolotls[i].color = ((31) | (24) << 5 | (29) << 10);
                break;
            case 1:
                axolotls[i].color = ((24) | (24) << 5 | (31) << 10);
                break;
            case 2:
                axolotls[i].color = ((24) | (31) << 5 | (24) << 10);
                break;
            case 3:
                axolotls[i].color = ((31) | (31) << 5 | (24) << 10);
                break;
            case 4:
                axolotls[i].color = ((29) | (24) << 5 | (31) << 10);
                break;
        }
    }
}

void drawAxolotl(AXOLOTL* axolotl_ptr, int index) {
    int y = 160 / 2 - 16;
    int x = 20 + (index * 45);
    for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 16; j++) {

            int value = axolotl_ptr->bitmap[((j) * (16) + (i))];

            switch (value) {
                case 1:
                    (videoBuffer[((y + j) * (240) + (x + i))] = ((0) | (0) << 5 | (0) << 10));
                    break;
                case 2:
                    (videoBuffer[((y + j) * (240) + (x + i))] = ((31) | (0) << 5 | (0) << 10));
                    break;
                case 3:
                    (videoBuffer[((y + j) * (240) + (x + i))] = ((31) | (0) << 5 | (31) << 10));
                    break;
                case 4:
                    (videoBuffer[((y + j) * (240) + (x + i))] = axolotl_ptr -> color);
                    break;
                case 5:
                    (videoBuffer[((y + j) * (240) + (x + i))] = ((5) | (5) << 5 | (5) << 10));
                    break;

                default:
                    break;
            }
        }
    }
}
