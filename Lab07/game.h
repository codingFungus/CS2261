// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256

// Variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE link;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initKitty();
void updateKitty();
void drawKitty();
void initStatue();
void drawStatue();
void initPaw();
void drawPaw();