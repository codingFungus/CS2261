#ifndef DANCE_H 
#define DANCE_H

#include "gba.h"
#include "sprites.h"
#include "mode0.h"

// Function prototypes
void initDancer();
void dance();

// Dancer Struct
typedef struct {
    int x, y;
    int frame;
    int OAMindex;
    int active;
    int tick;
    int width, height;
} DANCER; 

// Global Variables
DANCER dancer;

#endif