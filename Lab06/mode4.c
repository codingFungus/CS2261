#include "mode4.h"
#include "font.h"

// Sets a pixel in mode 4
void setPixel4(int x, int y, unsigned char colorIndex) {
    // TODO 1.0: write this function
    int offset = (x + y * 240) >> 1;
    unsigned short originalShort = videoBuffer[offset];
    if (x & 1) {
        videoBuffer[offset] = colorIndex << 8 | (originalShort & 0x00FF);
    } else {
        videoBuffer[offset] = colorIndex | (originalShort & 0xFF00);
    }
}

// Draws a rectangle in mode 4
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex) {
    // TODO 5.0: write this function using DMA
    volatile unsigned short color = colorIndex | (colorIndex << 8);
    for (int i = 0; i < height; i++) {
        if (x % 2 == 0) { //even y and even width
            if (width % 2 == 0) {
                DMANow(3, &color, &videoBuffer[OFFSET(x, y + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | width / 2);
            } else { //even y and odd with
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[OFFSET(x, y + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | width / 2);
                }
                setPixel4(x + width - 1, y + i, colorIndex);
            }
        } else { //odd y and odd width
            if (width % 2 != 0) {
                setPixel4(x, y + i, colorIndex);
                if (width > 1) {
                    DMANow(3, &color, &videoBuffer[OFFSET(x + 1, y + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | width / 2);

                }
            } else { //odd y and even width
                setPixel4(x, y + i, colorIndex);
                if (width > 2) {
                    DMANow(3, &color, &videoBuffer[OFFSET(x + 1, y + i, SCREENWIDTH) / 2], DMA_SOURCE_FIXED | (width / 2 - 1));
                }
                setPixel4(x + width - 1, y + i, colorIndex);

            }

        }
    }

    
}

// Fills the screen in mode 4 using specified palette index
void fillScreen4(volatile unsigned char colorIndex) {
    // TODO 2.0: write this function using DMA
    volatile unsigned int color = colorIndex << 24 | colorIndex << 16 |
                                  colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENHEIGHT * SCREENWIDTH / 2));
    
}

// Draws an image in mode 4
void drawImage4(int x, int y, int width, int height, const unsigned short *image) {
    // TODO 4.0: write this function using DMA
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[OFFSET(0, i, width/2)], &videoBuffer[OFFSET(x, y + i, SCREENWIDTH)/2], width/2);
        
    }
    
}

// Draws a full-screen image in mode 4
void drawFullscreenImage4(const unsigned short *image) {
    // TODO 3.0: write this function using DMA
    DMANow(3, image, videoBuffer, SCREENHEIGHT * SCREENWIDTH / 2);
    
}

// Draws the specified character at the specified location in Mode 4
void drawChar4(int x, int y, char ch, unsigned short colorIndex) {
    for (int r = 0; r < 8; r++) {
        for (int c = 0; c < 6; c++) {
            if (fontdata_6x8[48*ch + OFFSET(c, r, 6)]) {
                setPixel4(x+c, y+r, colorIndex);
            }
        }
    }
}

// Draws the specified string at the specified location in Mode 4
void drawString4(int x, int y, char *str, unsigned short colorIndex) {
    // until the null character appears
    while(*str != '\0') {
        drawChar4(x, y, *str, colorIndex);
        x += 6;
        // point to the next character
        str++;
    }
}

// Flips page being displayed and page being drawn to
void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}