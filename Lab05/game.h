// structs

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int xVelocity;
    int width;
    int height;
    unsigned short color;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int xVelocity;
    int yVelocity;
    int width;
    int height;
    unsigned short color;
} BALL;

// TODO 2.0: complete this struct
typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int xVelocity;
    int width;
    int height;
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

// function prototypes
void initGame();
void initPlayer();
void initBall();
void initBlocks();
void updateGame();
void updatePlayer();
void updateBall();
void updateBlocks(BLOCK* b);
void drawGame();
void drawPlayer();
void drawBall();
void drawBlocks(BLOCK* b);
void newBlock();