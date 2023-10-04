# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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

void goToStart();
void start();
void goToGame();
void game();
void goToWin();
void win();
void goToLose();
void lose();



enum {
    START,
    GAME,
    WIN,
    LOSE
};
int state;

unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while (1) {
       oldButtons = buttons;
       buttons = (*(volatile unsigned short *)0x04000130);

       switch(state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
       }
    }

    return 0;

}
void goToStart() {
    fillScreen((((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    drawString(50, 40, "Press START to begin", (((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    waitForVBlank();
    state = START;
}

void start() {
    waitForVBlank();
    if ((((~buttons & (1<<3)) && !(~oldButtons & (1<<3))))) {
        initGame();
        goToGame();
    }
}
void goToGame() {
    state = GAME;

}

void game() {
    updateGame();
    drawGame();

    if (player.life <= 0) {
        goToLose();
    }
    if (player.y < 20) {
        goToWin();
    }

}

void goToWin() {
    fillScreen((((31) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10));
    drawString(50, 40, "Congrats you win!", (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));
    drawString(50, 60, "press START to try again", (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    waitForVBlank();
    state = WIN;
}
void win() {
    waitForVBlank();
    if ((((~buttons & (1<<3)) && !(~oldButtons & (1<<3))))) {
        goToStart();
    }
}
void goToLose() {
    fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawString(50, 40, "Ahhh no game over", (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
    drawString(50, 60, "press START to try again", (((0) & 31) | ((0) & 31) << 5 | ((31) & 31) << 10));
    waitForVBlank();
    state = LOSE;
}
void lose() {
    waitForVBlank();
    if ((((~buttons & (1<<3)) && !(~oldButtons & (1<<3))))) {
        goToStart();
    }
}

void initialize() {
    (*(volatile unsigned short *)0x4000000) = ((3) & 7) | ((1 << (8 + ((2) % 4))));
 mgba_open();
    mgba_printf_level(1, "Debugger Opened");
    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;
    goToStart();

}
