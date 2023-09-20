#include "print.h"
#include "gba.h"
// Typedefs
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;

// Display constants
#define SCREENHEIGHT 160 // Height of the GBA display
#define SCREENWIDTH  240 // Width of the GBA display

// Finds 1D position from 2D coordinates
#define OFFSET(x, y, width) ((y) * (width) + (x))

// Display control register
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)

// Bits for display control register
#define MODE(x) ((x) & 7) // Sets GBA video mode (REG_DISPCTL)
#define DISP_BACKBUFFER (1 << 4) // Displays backbuffer for page flipping (REG_DISPCTL)
#define SPRITE_ENABLE (1 << 12) // Enables rendering of sprites (REG_DISPCTL)
#define SPRITE_MODE_2D (0 << 6) // Sets 2D sprite tile mapping mode (REG_DISPCTL)
#define SPRITE_MODE_1D (1 << 6) // Sets 1D sprite tile mapping mode (REG_DISPCTL)
#define BG_ENABLE(x) (1 << (8 + (x % 4))) // Enables specified background (REG_DISPCTL)
#define BG0_ENABLE (BG_ENABLE(0)) // Enables BG0 (REG_DISPCTL)
#define BG1_ENABLE (BG_ENABLE(1)) // Enables BG1 (REG_DISPCTL)
#define BG2_ENABLE (BG_ENABLE(2)) // Enables BG2 (REG_DISPCTL)
#define BG3_ENABLE (BG_ENABLE(3)) // Enables BG3 (REG_DISPCTL)

// Read-only, holds which scanline is being drawn
#define REG_VCOUNT (*(volatile unsigned short *)0x4000006)

// Waits until scanline has just become 160
void waitForVBlank();

// Color
#define COLOR(r, g, b) ((r) | (g) << 5 | (b) << 10)
#define BLACK   COLOR(0,0,0)
#define WHITE   COLOR(31,31,31)
#define GRAY    COLOR(15,15,15)
#define RED     COLOR(31,0,0)
#define GREEN   COLOR(0,31,0)
#define BLUE    COLOR(0,0,31)
#define CYAN    COLOR(0,31,31)
#define MAGENTA COLOR(31,0,31)
#define YELLOW  COLOR(31,31,0)

// Mode 3 Drawing Functions
#define setPixel(x, y, color) (videoBuffer[OFFSET(x, y, SCREENWIDTH)] = color)
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void setPixel3(int x, int y, unsigned short color);
void initialize();

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

void drawRect(int x, int y, int width, int height, unsigned short color) {
    for(int i = 0; i < height; i++) {
        for(int j = 0; j < width; j++) {
            setPixel(x + i, y + j, color);
        }
    }    
}

void setPixel3(int x, int y, unsigned short color) {
    int offset = OFFSET(x,y,SCREENWIDTH);

    *(volatile unsigned short*)(0x06000000  + (2 * offset)) = color;
}

void fillScreen(unsigned short color) {
    for(int i = 0; i < (160 * 240); i++) {
        videoBuffer[i] = color;
    }
}

void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

void initialize() {
    REG_DISPCTL = MODE(3) | BG2_ENABLE;
    fillScreen(RED);
    mgba_open();
    mgba_printf_level(1, "Debugger Opened");
}

int main() {
    initialize();
    drawRect(20, 20, 20, 20, BLUE);
    while(1) {
        
    }
    return 0;
}