#define REG_DISPCTL *(volatile unsigned short *) 0x04000000
#define MODE3 3
#define BG2_ENABLE (1 << 10)
#define PIXEL00 0x06000000
#define SCREENWIDTH 240
/*
*/
// TODO 1.1: Complete RGB color macro
#define RGB(R, G, B) (((R) & 31) | ((G) & 31) << 5 | ((B) & 31)<< 10)

// TODO 1.2: Complete offset macro
//
#define OFFSET(x, y, width) ((x) + (width) * (y))

// Predefined colors
#define RED RGB(31, 0, 0)
#define GREEN RGB(0, 31, 0)
#define BLUE RGB(0, 0, 31)
#define ORANGE RGB(31, 10, 5)
#define BLACK 0
#define WHITE RGB(31, 31, 31)

void setPixel(int, int, unsigned short);
void drawHorizontalLine(int, int, int, unsigned short);
void drawVerticalLine(int, int, int, unsigned short);

unsigned short* videoBuffer;

int main() {
    
    REG_DISPCTL = 1027;
    // TODO 1.0: Set the value of REG_DISPCTL to enable mode 3 and background 2
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    
    videoBuffer = 0x06000000;
    unsigned short* videoBuffer;
    //*videoBuffer = RGB(0, 0, 31);
    //*(videoBuffer + OFFSET(0, 1, 240)) = RGB(0, 0, 31);
    //middle white pixel
    //*(videoBuffer + OFFSET(120, 80, 240)) = RGB(31, 31, 31);



    // TODO 1.4: Uncomment
    setPixel(0, 0, WHITE);
    setPixel(0, 1, RED);
    setPixel(0, 2, BLUE);
    setPixel(0, 3, GREEN);
    // END TODO 1.4

    // TODO 3.0 - draw out 'HELLO' above 'WORLD' using a combination of the line functions and setPixel
    // 'H'
    drawVerticalLine(60, 50, 54, BLUE);
    drawHorizontalLine(52, 60, 63, BLUE);
    drawVerticalLine(63, 50, 54, BLUE);

    // 'E'
    drawHorizontalLine(50, 65, 67, BLUE);
    drawVerticalLine(65, 50, 54, BLUE);
    drawHorizontalLine(52, 65, 67, BLUE);
    drawHorizontalLine(54, 65, 67, BLUE);

    // 'L'
    drawVerticalLine(69, 50, 54, GREEN);
    drawHorizontalLine(54, 69, 71, GREEN);

    // 'L'
    drawVerticalLine(73, 50, 54, GREEN);
    drawHorizontalLine(54, 73, 75, GREEN);

    // 'O'
    drawVerticalLine(77, 50, 54, WHITE);
    drawHorizontalLine(50, 77, 79, WHITE);
    drawVerticalLine(79, 50, 54, WHITE);
    drawHorizontalLine(54, 77, 79, WHITE);



    // TODO 2.2: Uncomment
    // 'W'
    drawVerticalLine(100, 50, 53, ORANGE);
    setPixel(101, 54, ORANGE);
    setPixel(102, 53, ORANGE);
    setPixel(103, 54, ORANGE);
    drawVerticalLine(104, 50, 53, ORANGE);

    // 'O'
    drawVerticalLine(106, 50, 54, ORANGE);
    setPixel(107, 50, ORANGE);
    setPixel(107, 54, ORANGE);
    drawVerticalLine(108, 50, 54, ORANGE);

    // 'R'
    drawVerticalLine(110, 50, 54, ORANGE);
    setPixel(111, 50, ORANGE);
    setPixel(111, 52, ORANGE);
    drawVerticalLine(112, 50, 51, ORANGE);
    drawVerticalLine(112, 53, 54, ORANGE);

    // 'L'
    drawVerticalLine(114, 50, 54, ORANGE);
    setPixel(115, 54, ORANGE);

    // 'D'
    drawVerticalLine(117, 50, 54, ORANGE);
    setPixel(118, 50, ORANGE);
    setPixel(118, 54, ORANGE);
    drawVerticalLine(119, 51, 53, ORANGE);

    drawHorizontalLine(56, 100, 120, ORANGE);
    // END TODO 2.2

    while (1) {}
    return 0;
}


// TODO 1.3: Complete setPixel function
void setPixel(int x, int y, unsigned short color) {
    int offset = OFFSET(x, y, SCREENWIDTH);
    *((volatile unsigned short*)(0x06000000) + (2 * offset)) = color;

}

// TODO 2.0: Complete drawHorizontalLine function
void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = 0; i < x2 - x1 + 1; i++) {
        setPixel(x1 + i, y, color);
    }

}

// TODO 2.1: Complete drawVerticalLine function
void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = 0; i < y2 - y1 + 1; i++) {
        setPixel(x, y1 + i, color);
    }

}