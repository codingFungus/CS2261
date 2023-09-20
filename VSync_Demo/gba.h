// GBA Video Registers and Flags
#define REG_DISPCTL (*(volatile unsigned short *) 0x04000000)
#define MODE(x) ((x) & 7)
#define BG2_ENABLE (1 << 10)
#define REG_VCOUNT (*(volatile unsigned short *) 0x04000006)

// Calculate the position of a pixel in the video buffer based on its x and y positions
#define OFFSET(x, y, rowLength) ((y) * (rowLength) + (x))

// Create a color with the specified RGB values
#define RGB(R, G, B) (((R) & 31) | (((G) & 31) << 5) | (((B) & 31) << 10))

// Predefined Colors
#define RED     RGB(31, 0, 0)
#define GREEN   RGB(0, 31, 0)
#define BLUE    RGB(0, 0, 31)
#define MAGENTA RGB(31, 0, 31)
#define CYAN    RGB(0, 31, 31)
#define YELLOW  RGB(31, 31, 0)
#define ORANGE  RGB(31, 15, 5)
#define PURPLE  RGB(19, 5, 22)
#define BLACK   0
#define WHITE   0x7FFF

// setPixel Macro
#define setPixel(x, y, color) (videoBuffer[OFFSET(x, y, 240)] = color)

// Typedefs
typedef unsigned short u16;

// Global Variables
extern volatile unsigned short* videoBuffer;

// Function Prototypes
void drawHorizontalLine(int, int, int, u16);
void waitForVBlank();