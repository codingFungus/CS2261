#ifndef GAME_H
#define GAME_H

#include "backgroundTileMap.h"
#include "gba.h"
#include "sprites.h"
#include "mode0.h"
#include "main.h"

#ifndef max
#define max(a,b)            (((a) > (b)) ? (a) : (b))
#endif

#ifndef min
#define min(a,b)            (((a) < (b)) ? (a) : (b))
#endif

void initGame();
void updatePlayer();
void drawPlayer();
void initPlayer();

#endif