// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256

// Variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initCar();
void updateCar();
void drawCar();