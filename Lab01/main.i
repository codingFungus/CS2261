# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 23 "main.c"
void setPixel(int, int, unsigned short);
void drawHorizontalLine(int, int, int, unsigned short);
void drawVerticalLine(int, int, int, unsigned short);

unsigned short* videoBuffer;

int main() {

    *(volatile unsigned short *) 0x04000000 = 1027;

    *(volatile unsigned short *) 0x04000000 = 3 | (1 << 10);

    videoBuffer = 0x06000000;
    unsigned short* videoBuffer;
# 45 "main.c"
    setPixel(0, 0, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31)<< 10));
    setPixel(0, 1, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31)<< 10));
    setPixel(0, 2, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));
    setPixel(0, 3, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31)<< 10));




    drawVerticalLine(60, 50, 54, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));
    drawHorizontalLine(52, 60, 63, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));
    drawVerticalLine(63, 50, 54, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));


    drawHorizontalLine(50, 65, 67, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));
    drawVerticalLine(65, 50, 54, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));
    drawHorizontalLine(52, 65, 67, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));
    drawHorizontalLine(54, 65, 67, (((0) & 31) | ((0) & 31) << 5 | ((31) & 31)<< 10));


    drawVerticalLine(69, 50, 54, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31)<< 10));
    drawHorizontalLine(54, 69, 71, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31)<< 10));


    drawVerticalLine(73, 50, 54, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31)<< 10));
    drawHorizontalLine(54, 73, 75, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31)<< 10));


    drawVerticalLine(77, 50, 54, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31)<< 10));
    drawHorizontalLine(50, 77, 79, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31)<< 10));
    drawVerticalLine(79, 50, 54, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31)<< 10));
    drawHorizontalLine(54, 77, 79, (((31) & 31) | ((31) & 31) << 5 | ((31) & 31)<< 10));





    drawVerticalLine(100, 50, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(101, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(102, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(103, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    drawVerticalLine(104, 50, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));


    drawVerticalLine(106, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(107, 50, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(107, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    drawVerticalLine(108, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));


    drawVerticalLine(110, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(111, 50, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(111, 52, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    drawVerticalLine(112, 50, 51, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    drawVerticalLine(112, 53, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));


    drawVerticalLine(114, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(115, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));


    drawVerticalLine(117, 50, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(118, 50, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    setPixel(118, 54, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));
    drawVerticalLine(119, 51, 53, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));

    drawHorizontalLine(56, 100, 120, (((31) & 31) | ((10) & 31) << 5 | ((5) & 31)<< 10));


    while (1) {}
    return 0;
}



void setPixel(int x, int y, unsigned short color) {
    int offset = ((x) + (240) * (y));
    *((volatile unsigned short*)(0x06000000) + (2 * offset)) = color;

}


void drawHorizontalLine(int y, int x1, int x2, unsigned short color) {
    for (int i = 0; i < x2 - x1 + 1; i++) {
        setPixel(x1 + i, y, color);
    }

}


void drawVerticalLine(int x, int y1, int y2, unsigned short color) {
    for (int i = 0; i < y2 - y1 + 1; i++) {
        setPixel(x, y1 + i, color);
    }

}
