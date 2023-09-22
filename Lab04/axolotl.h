#define AXOLOTLLEN 16
#define AXOLOTLCOUNT 5

// kitty struct
typedef struct {
	int* bitmap;
	unsigned short color;
} AXOLOTL;

extern AXOLOTL axolotls[AXOLOTLCOUNT];
extern int* axolotlBitmaps[AXOLOTLCOUNT];

// prototypes
void initializeAxolotls();
void drawAxolotl(AXOLOTL* axolotl_ptr, int index);