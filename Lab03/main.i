# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2


void initialize();
void update();
void draw();


unsigned short oldButtons;
unsigned short buttons;


unsigned short bgColor;


int rHeight, rWidth;


int r1Y, r1X;
unsigned short r1Color;


int r2Y, r2X;
unsigned short r2Color;


int r3Y, r3X;
unsigned short r3Color;


int r4Y, r4X;
unsigned short r4Color;


int pY, pX, pOldY, pOldX, pYVel, pXVel, pHeight, pWidth;
unsigned short pColor;

int main() {
 initialize();

 while (1) {


  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);

  update();
  waitForVBlank();
  draw();
 }
 return 0;
}


void initialize() {
 (*(volatile unsigned short *) 0x04000000) = ((3) & 7) | (1 << 10);
 mgba_open();
    mgba_printf_level(1, "Debugger Opened");


 pX = 0;
 pY = 0;
 pOldX = 0;
 pOldY = 0;
 pXVel = 1;
 pYVel = 1;
 pWidth = 20;
 pHeight = 20;
 pColor = (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10));
 fillScreen(0x7FFF);




 pColor = 0;
 r1Color = (((0) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10));
 r2Color = (((19) & 31) | (((5) & 31) << 5) | (((22) & 31) << 10));
 r3Color = (((31) & 31) | (((15) & 31) << 5) | (((5) & 31) << 10));
 r4Color = (((0) & 31) | (((31) & 31) << 5) | (((31) & 31) << 10));


 bgColor = 0x7FFF;
 fillScreen(bgColor);


 rHeight = 30;
 rWidth = 30;

 r1Y = 30;
 r1X = 30;

 r2Y = 30;
 r2X = 180;

 r3Y = 100;
 r3X = 180;

 r4Y = 100;
 r4X = 30;


 pHeight = 15;
 pWidth = 15;
 pY = (160 / 2) - (pHeight / 2);
 pX = (240 / 2) - (pWidth / 2);
 pOldY = pY;
 pOldX = pX;
 pYVel = 1;
 pXVel = 1;
}


void update() {

 if ((!(~(oldButtons) & ((1<<0))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<0)))) || (!(~(oldButtons) & ((1<<1))) && (~(*(volatile unsigned short *)0x04000130) & ((1<<1))))) {





   if(pColor == (((31) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10))) {
    pColor = (((0) & 31) | (((0) & 31) << 5) | (((0) & 31) << 10));
   } else if (pColor == 0) {
    pColor = (((31) & 31) | (((31) & 31) << 5) | (((0) & 31) << 10));
   }


 }


 pOldX = pX;
    pOldY = pY;

 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && canMoveLeft()) {
  pX -= pXVel;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && canMoveRight()) {
  pX += pXVel;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && canMoveDown()) {
  pY += pYVel;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && canMoveUp()) {
  pY -= pYVel;
 }



 if (pX < 0) {
  pX = 0;
 }
 if (pX + pWidth > 240 - 1) {
  pX = 240 - pWidth;
 }
 if (pY < 0) {
  pY = 0;
 }
 if (pY + pHeight >= 160) {
  pY = (160 - 1) - (pHeight - 1);
 }


 if (collision(pX, pY, pHeight, pWidth, r1X, r1Y, rHeight, rWidth)) {
  pColor = r1Color;
 }
 else if (collision(pX, pY, pHeight, pWidth, r2X, r2Y, rHeight, rWidth)) {
  pColor = r2Color;
 }
 else if (collision(pX, pY, pHeight, pWidth, r3X, r3Y, rHeight, rWidth)) {
  pColor = r3Color;
 }
 else if (collision(pX, pY, pHeight, pWidth, r4X, r4Y, rHeight, rWidth)) {
  pColor = r4Color;
 }



 if (pOldY != pY || pOldX != pX) {

  mgba_printf_level(4, "%s", "Player has moved");
  mgba_printf("Current Position: (%d, %d)", pX, pY );

 }
}
int canMoveLeft() {
    int ret = ((pX) > 0);
    return ret;
}

int canMoveRight() {
    int ret = ((pX + pWidth) < (240));
    return ret;
}

int canMoveDown() {
    int ret = ((pY + pHeight) < (160));
    return ret;
}

int canMoveUp() {
    int ret = ((pY) > 0);
    return ret;
}


void draw() {

 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<2)))) {
  drawRect(pX, pY, pWidth, pHeight, pColor);

 } else {

  drawRect(pOldX, pOldY, pWidth, pHeight, 0x7FFF);
  drawRect(pX, pY, pWidth, pHeight, pColor);
 }




 drawRect(r1X, r1Y, rWidth, rHeight, r1Color);
 drawRect(r2X, r2Y, rWidth, rHeight, r2Color);
 drawRect(r3X, r3Y, rWidth, rHeight, r3Color);
 drawRect(r4X, r4Y, rWidth, rHeight, r4Color);


 pOldY = pY;
 pOldX = pX;
}
