#include "sprites.h"

// Hides all sprites in the shadowOAM; Must DMA the shadowOAM into the OAM after calling this function
void hideSprites() {
    for (int i = 0; i < 128; i++) {
        // TODO 1.5: complete this function
        shadowOAM[i].attr0 = ATTR0_HIDE;

    }
}