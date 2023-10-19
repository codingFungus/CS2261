// structs
typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int dx;
    int height;
    int width;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int dx;
    int dy;
    int height;
    int width;
    unsigned short color;
} BALL;

typedef struct {
    int x;
    int y;
    int oldX;
    int oldY;
    int height;
    int width;
    unsigned short color;
    int active;
    int erased;
} BLOCK;

// constants
#define BLOCKCOUNT 30

// variables
extern PLAYER player;
extern BALL ball;
extern BLOCK blocks[BLOCKCOUNT];
extern int score;

// custom game colors
#define NUMCOLORS 8
// this does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), GREYID, MAROONID, DEEPREDID, GOLDID, BROWNID, SALMONID, PINKID};
extern unsigned short colors[NUMCOLORS];

// function prototypes
void initGame();
void initPlayer();
void initBall();
void initBlocks();
void updateGame();
void updatePlayer();
void updateBall();
void updateBlocks();
void drawGame();
void drawPlayer();
void drawBall();
void drawBlocks();