
//game.h
typedef struct {
    int x;
    int y;
    int height;
    int width;
    int direction;
    int speed;

} Car;

typedef struct {
    int x;
    int y;
    int height;
    int width;
    int Xspeed;
    int Yspeed;
    int life;

} Player;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int speed;
    int direction;
} Log;

#define CARCOUNT 4
#define HEARTCOUNT 3
#define CAR_WIDTH 15
#define CAR_HEIGHT 10

extern Player player;
extern Car cars[4];
extern Log logs[3];







void drawCars();
void drawLogs();
void drawPlayer();
void drawGame();
void updateLog();
void updateCars();
void updatePlayer();
void updateGame();
void playerHit();
void resetCar(int i);
void resetLog(int i);
void initGame();
int isInRiver();
int isOnLog();

