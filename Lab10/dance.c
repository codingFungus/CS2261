#include "dance.h"  

void initDancer() {
    dancer.x = 100;
    dancer.y = 50;
    dancer.frame = 0;
    dancer.tick = 0;
    dancer.OAMindex = 0;
    dancer.active = 1;
    dancer.width = 64;
    dancer.height = 64;
}

void dance() {
    dancer.tick += 1;
    if ((dancer.tick % 10) == 0) {
        dancer.frame = (dancer.frame + 1) % 15;    
    }
    shadowOAM[dancer.OAMindex].attr0 = ATTR0_SQUARE | ATTR0_REGULAR | ATTR0_Y(dancer.y);
    shadowOAM[dancer.OAMindex].attr1 = ATTR1_LARGE | ATTR1_X(dancer.x);
    shadowOAM[dancer.OAMindex].attr2 = ATTR2_TILEID(8 * (dancer.frame % 4), 8 * (dancer.frame / 4));
    DMANow(3, &shadowOAM, OAM, 512);
}