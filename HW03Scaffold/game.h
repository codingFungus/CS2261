typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int height;
    int width;
    int xspeed;
    int yspeed;
    unsigned short color;
    int dead;

} Player;

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int radius;
    int yspeed;
    unsigned short color;
    int active;
    int erased;
} BULLET;

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int height;
    int width;
    unsigned short color;
    int xspeed;
    int yspeed;
    int active;
    int erased;
} Enemy;

#define BULLETCOUNT 25
#define ENEMYCOUNT 10
extern BULLET bullets[BULLETCOUNT];
extern Enemy enemies[ENEMYCOUNT];
extern int score;
extern Player player;

void initGame();
void initPlayer();
void initEnemy();
void initBullet();
void updateGame();
void updateBullet(BULLET* b);
void updatePlayer();
void updateEnemy(Enemy* e);
void spawnBullet();
int inSlowZone();
void drawGame();
void drawEnemy(Enemy* e);
void drawPlayer();
void drawBullet(BULLET* b);