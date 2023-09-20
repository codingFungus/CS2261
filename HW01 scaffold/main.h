// Function Prototypes
void initialize();
void processInputs();
void updateGame();
void drawFrame1();
void drawFrame2();
void drawFrame3();
void drawFrame4();
void cleanupArea(int x, int y, int width, int height);

void cleanupFrame1();
void cleanupFrame2();
void cleanupFrame3();
void cleanupFrame4();


unsigned short oldButtons;
unsigned short buttons;
//playable mushroom position variables
int pY, pX;


enum CustomGameState{
    FRAME_1,
    FRAME_2,
    FRAME_3,
    FRAME_4
};