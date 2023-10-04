#include <stdlib.h>
#include "gba.h"
#include "game.h"


Player player;
BULLET bullets[BULLETCOUNT];
Enemy enemies[10];
Enemy *enemyToErase;

int score;

void initGame() {
    initBullet();
    initEnemy();
    initPlayer();
    score = 0;

}
void initPlayer() {
    player.x = 110;
    player.y = 80;
    player.oldx = player.x;
    player.oldy = player.y;
    player.xspeed = 3;
    player.yspeed = 3;
    player.height = 8;
    player.width = 10;
    player.color = MAGENTA;
    player.dead = 0;
}
void initBullet() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].radius = 2;
        bullets[i].x = -(bullets[i].radius);
        bullets[i].y = 0;
        bullets[i].oldx = player.x;
        bullets[i].oldy = player.y;
        bullets[i].yspeed = -3;
        bullets[i].color = WHITE;
        bullets[i].active = 0;
        bullets[i].erased = 1;
    }

}
void initEnemy() {
    for (int i = 0; i < ENEMYCOUNT; i++) {
        enemies[i].width = 10;
        enemies[i].height = 6;
        enemies[i].x = rand() % 110;
        enemies[i].y = rand() % 110 + 10;

        enemies[i].oldx = player.x;
        enemies[i].oldy = player.y;

        enemies[i].active = 1;
        enemies[i].color = GREEN;
        enemies[i].xspeed = 1;
        enemies[i].yspeed = 1;
        enemies[i].erased = 0;
    }
}
void spawnBullet() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (!bullets[i].active) {
            bullets[i].x = player.x;
            bullets[i].y = player.y + player.width / 2 - bullets[i].radius/2;

            bullets[i].active = 1;
            bullets[i].erased = 0;

            break;
        }
    }
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        updateBullet(&bullets[i]);
    }
    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateEnemy(&enemies[i]);
    }
    
}

void updateBullet(BULLET * b) {
    if (b->active) {
        b->y += b->yspeed;
    }
    if (b->y == 5) {
        b->erased = 1;
        b->active = 0;
        drawCircle(b->oldx, b->oldy, b->radius, BLACK);

    }
    if (score >= 3) {
        b->radius = 3;
        b->color = RED;
    }

}

int inSlowZone() {
    if ((player.y > 0 && player.y < 80) && (player.x < 240)) {
        return 1;
    } else {
        return 0;
    }

}
int inBorder() {
    if (player.x >= 0 && player.x <= SCREENWIDTH - player.width
        && player.y >= 25 && player.y <= 160 - player.height) {
            return 1;
    }
}
void updatePlayer() {
    if (inBorder()) {
        if (BUTTON_HELD(BUTTON_LEFT) && inSlowZone()) {
            player.x -= player.xspeed/2;
        }
        if (BUTTON_HELD(BUTTON_RIGHT) && inSlowZone()) {
                player.x += player.xspeed/2;
        }
        if (BUTTON_HELD(BUTTON_DOWN) && inSlowZone()) {
                player.y += player.yspeed/2;
        }
        if (BUTTON_HELD(BUTTON_UP) && inSlowZone()) {
                player.y -= player.yspeed/2;
        }

        else if (BUTTON_HELD(BUTTON_LEFT) && !inSlowZone()) {
            player.x -= player.xspeed;
        }
        else if (BUTTON_HELD(BUTTON_RIGHT) && !inSlowZone()) {
            player.x += player.xspeed;
        }
        else if (BUTTON_HELD(BUTTON_DOWN) && !inSlowZone()) {
            player.y += player.yspeed;
        }
        else if (BUTTON_HELD(BUTTON_UP) && !inSlowZone()) {
            player.y -= player.yspeed;
        } else if (BUTTON_PRESSED(BUTTON_A)) {
            spawnBullet();
            REG_SND2CNT = DMG_ENV_VOL(4) | DMG_DIRECTION_DECR |
                DMG_STEP_TIME(2) | DMG_DUTY_50;
            REG_SND2FREQ = SND_RESET | NOTE_C5;

        }
    }
    if (player.x < 0) {
        player.x += 3;
    }
    if (player.x > SCREENWIDTH - player.width) {
        player.x -= 3;
    }
    if (player. y <= 25) {
        player.y += 3;
    }
    if (player. y >= SCREENHEIGHT - player.height) {
        player.y -= 3;
    }
}

void updateEnemy(Enemy* e) {
    if (e->active) {
        if (e->x <= 0 || e->x + e->width >= SCREENWIDTH) {
            e->xspeed *= -1;
        }
        if (e->y <= 25 || e->y + e->height - 1 >= SCREENHEIGHT - 20) {
            e->yspeed *= -1;
        }
        e->x += e->xspeed;
        e->y += e->yspeed;

        for (int i = 0; i < BULLETCOUNT; i++) {
            if (bullets[i].active && collision(e->x, e->y, e->width, e->height,
                bullets[i].x, bullets[i].y, bullets[i].radius, bullets[i].radius)) {
                    bullets[i].active = 0;
                    e->active = 0;
                    score++;
                    REG_SND2CNT = DMG_ENV_VOL(4) | DMG_DIRECTION_DECR |
                    DMG_STEP_TIME(2) | DMG_DUTY_50;
                    REG_SND2FREQ = SND_RESET | NOTE_G6;
            }
        }
        if (collision(player.x, player.y, player.width, player.height,
            e->x, e->y, e->width, e->height)) {
                REG_SND2CNT = DMG_ENV_VOL(4) | DMG_DIRECTION_DECR |
                DMG_STEP_TIME(2) | DMG_DUTY_50;
                REG_SND2FREQ = SND_RESET | NOTE_C7;
                player.dead = 1;


        }


    }

}

void drawGame() {
    drawPlayer();
    for (int i = 0; i < BULLETCOUNT; i++) {
        drawBullet(&bullets[i]);
    }
    for (int i = 0; i < ENEMYCOUNT; i++) {
        drawEnemy(&enemies[i]);
    }

}


void drawPlayer() {
    drawRectangle(player.oldx, player.oldy, player.width, player.height, BLACK);
    drawRectangle(player.x, player.y, player.width, player.height, player.color);

    player.oldx = player.x;
    player.oldy = player.y;

}
void drawBullet(BULLET* b) {
    if (b->active) {
        drawCircle(b->oldx, b->oldy, b->radius, BLACK);
        drawCircle(b->x, b->y, b->radius, b->color);
    } else if (!b->erased) {
        drawCircle(b->oldx, b->oldy, b->radius, BLACK);
        b->erased = 1;
    }
    b->oldx = b->x;
    b->oldy = b->y;
    
}
void drawEnemy(Enemy* e) {
    if (e->active) {
        drawRectangle(e->oldx, e->oldy, e->width, e->height, BLACK);
        drawRectangle(e->x, e->y, e->width, e->height, e->color);
    } else if (!e->erased) {
        drawRectangle(e->oldx, e->oldy, e->width, e->height, BLACK);
        e->erased = 1;
    }
    e->oldx = e->x;
    e->oldy = e->y;
}