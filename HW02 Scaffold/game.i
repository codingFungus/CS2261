# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata[12288];
# 3 "game.c" 2

Car cars1[3];
Car cars2[3];
Log logs1[3];
Log logs2[3];

Player player;


void initGame() {
   player.x = 100;
   player.y = 155;
   player.Xspeed = 6;
   player.Yspeed = 5;
   player.life = 3;
   player.height = 10;
   player.width = 10;
   for (int i = 0; i < 3; i++) {
      cars1[i].x = 40 * i;
      cars1[i].y = 130;
      cars1[i].speed= 5;
      cars1[i].height = 10;
      cars1[i].width = 15;
   }
   for (int i = 0; i < 3; i++) {
      cars2[i].x = 30* i;
      cars2[i].y = 110;
      cars2[i].speed = 3;
      cars2[i].height = 10;
      cars2[i].width = 15;
   }
   for (int i = 0; i < 3; i++) {
      logs1[i].x = 40 * i;
      logs1[i].y = 35;
      logs1[i].width = 30;
      logs1[i].height = 20;
      logs1[i].speed = 3;
   }
   for(int i = 0; i < 3; i++) {
      logs2[i].x = 35 * i;
      logs2[i].y = 60;
      logs2[i].width = 30;
      logs2[i].height = 20;
      logs2[i].speed = 3;
   }

}

int isInRiver() {
   if (player.y < 80 && player.y > 30) {
      return 1;

   }
   return 0;
}
int isOnLog() {
   if (isInRiver()) {
      for (int i = 0; i < 3; i++) {
         if ((player.x > logs1[i].x && player.x < logs1[i].x + 30)
            ||
            (player.x > logs2[i].x && player.x < logs2[i].x + 30)) {
               return 1;
         }
         return 0;

      }
   }

}

void playerHit() {
   player.life--;
   player.x = 100;
 player.y= 150;
}

void updateGame() {
   updateCars();
   updateLog();
   updatePlayer();
}
void drawText() {
   if (player.life == 3) {
      drawString(10, 150, "Lives remain: 3", (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
   }
   if (player.life ==2) {
      drawString(10, 150, "Lives remain: 2", (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
   }
   if (player.life == 1) {
      drawString(10, 150, "Lives remain: 1", (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));

   }
}
void updatePlayer() {

   if((~buttons & (1<<6)) && player.y > 0) {
  player.y-= player.Yspeed;
 }
 if((~buttons & (1<<7)) && player.y < 160 - player.height) {
  player.y += player.Yspeed;
 }
 if((~buttons & (1<<5)) && player.x > 0) {
  player.x-= player.Xspeed;
 }
 if((~buttons & (1<<4)) && player.x < 240 - player.width) {
  player.x+= player.Xspeed;
 }

}
void updateCars() {
   for (int i = 0; i < 3; i++) {
      cars1[i].x += cars1->speed;
      cars2[i].x += cars2->speed;
      if (cars1[i].x >= 240) {
         cars1[i].x = cars1[i].x % 240;

      }
      if (cars2[i].x >= 240) {
         cars2[i].x = cars2[i].x % 240;
      }
      if (collision(player.x, player.y, player.width, player.height,
            cars1[i].x, cars1[i].y, cars1[i].width, cars1[i].height)
            ||
            collision(player.x, player.y, player.width, player.height,
            cars2[i].x, cars2[i].y, cars2[i].width, cars2[i].height)) {
               playerHit();
      }
   }
}

void updateLog() {
   for (int i = 0; i < 3; i++) {
      logs1[i].x += logs1->speed;
      logs2[i].x += logs2->speed;
      if (logs1[i].x >= 240) {
         logs1[i].x = logs1[i].x % 240;
      }
      if (logs2[i].x >= 240) {
         logs2[i].x = logs2[i].x % 240;
      }
      if (isInRiver()) {
         if (isOnLog()) {
            player.x++;
         } else {
            playerHit();
         }

      }

   }


}

void drawGame() {
   fillScreen((((0) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
   drawSafe();
   drawCars();
   drawLogs();
   drawPlayer();
   drawText();
   waitForVBlank();
}

void drawPlayer() {
   drawRectangle(player.x, player.y, player.width, player.height, (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10));

}

void drawCars() {
   for (int i = 0; i < 3; i++) {
         drawRectangle(cars1[i].x + 20* i, cars1[i].y, cars1->width, cars1->height, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
         drawRectangle(cars2[i].x + 30* i, cars2[i].y, cars2->width, cars2->height, (((31) & 31) | ((0) & 31) << 5 | ((0) & 31) << 10));
   }
}
void drawLogs() {
   for (int i = 0; i < 3; i++) {
      drawRectangle(logs1[i].x + 30 * i, logs1[i].y, 30, 20, (((20) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));
      drawRectangle(logs2[i].x + 20 * i, logs2[i].y, 30, 20, (((20) & 31) | ((10) & 31) << 5 | ((5) & 31) << 10));

   }

}
