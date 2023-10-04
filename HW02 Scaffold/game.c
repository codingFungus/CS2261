#include "gba.h"
#include "font.h"

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
      drawString(10, 150, "Lives remain: 3", RED);
   }
   if (player.life ==2) {
      drawString(10, 150, "Lives remain: 2", RED);
   }
   if (player.life == 1) {
      drawString(10, 150, "Lives remain: 1", RED);

   }
}
void updatePlayer() {

   if(BUTTON_HELD(BUTTON_UP) && player.y > 0) {
		player.y-= player.Yspeed;
	}
	if(BUTTON_HELD(BUTTON_DOWN) && player.y < SCREENHEIGHT - player.height) {
		player.y += player.Yspeed;
	}
	if(BUTTON_HELD(BUTTON_LEFT) && player.x > 0) {
		player.x-= player.Xspeed;
	}
	if(BUTTON_HELD(BUTTON_RIGHT) && player.x < SCREENWIDTH - player.width) {
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
   fillScreen(BLACK);
   drawSafe();
   drawCars();
   drawLogs();
   drawPlayer();
   drawText();
   waitForVBlank();
}

void drawPlayer() {
   drawRectangle(player.x, player.y, player.width, player.height, GREEN);
   
}

void drawCars() {
   for (int i = 0; i < 3; i++) {
         drawRectangle(cars1[i].x + 20* i, cars1[i].y, cars1->width, cars1->height, RED);
         drawRectangle(cars2[i].x + 30* i, cars2[i].y, cars2->width, cars2->height, RED);
   }
}
void drawLogs() {
   for (int i = 0; i < 3; i++) {
      drawRectangle(logs1[i].x + 30 * i, logs1[i].y, 30, 20, BROWN);
      drawRectangle(logs2[i].x + 20 * i, logs2[i].y, 30, 20, BROWN);
      
   }

}




   
