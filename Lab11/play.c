#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "print.h"

#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#include "play.h"
#include "digitalSound.h"
#include "screen.h"

// TODO 3.1: Include examplesong.h


// TODO 5.2: Include .h files for your songs


SONG songs[SONGCOUNT];
int intensity[10];

int paused;
int shuffle;

int minute;
int second;

int frame;
int progress;

int currentSong;

char* screenTitle;
int titlePosition;

void initProgressBar();
void updateProgressBar();
int checkProgress();

void drawIntensityBars();

void drawChar(int, int, char);
int getStrLen(const char*);
const char* getFullTitle(const char*);
const char* getShown(int, const char*);
void drawString(int, int, const char*);

void drawTime();

void init() {

    for (int i = 0; i < 10; i++) {
        intensity[i] = 0;

    }

    DMANow(3, screenMap, &SCREENBLOCK[24], screenMapLen / 2);

    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(2) | SPRITE_ENABLE;
    shadowOAM[3].attr0 = ATTR0_Y(33) | ATTR0_SQUARE;

    paused = 1;
    shuffle = 0;

    currentSong = 0;

    // TODO 3.2: Set songs[0] struct members

    songs[0].sampleRate = 0;
    songs[0].length = 0;
    songs[0].data = NULL;
    songs[0].title = "";
    songs[0].color = BLACK;

    // TODO 5.3: Set songs[1] and songs[2] struct members

    songs[1].sampleRate = 0;
    songs[1].length = 0;
    songs[1].data = NULL;
    songs[1].title = "";
    songs[1].color = BLACK;

    songs[2].sampleRate = 0;
    songs[2].length = 0;
    songs[2].data = NULL;
    songs[2].title = "";
    songs[2].color = BLACK;

    // OPTIONAL TODO 5.4: Add more songs!


    playSong(currentSong);

} 

void playSong(int s) {

    // TODO 3.3: Play song at index s of songs
    

    PALETTE[29] = songs[s].color;
    SPRITEPALETTE[3] = songs[s].color;
    screenTitle = (char*) getFullTitle(songs[s].title);
    frame = 0;
    titlePosition = 0;

    initProgressBar();

    // TODO 1.1: Setup timer 2 control and data registers
    
    
    // TODO 1.1: Setup timer 3 control and data registers
    
    
    if (paused) {
        
        // TODO 4.1: Pause sounds if music player is paused
        

    } else {

        // TODO 1.1: Turn on timer 2 & 3 when music player is unpaused
        

    }

}

void update() {

    if (BUTTON_PRESSED(BUTTON_A)) {

        paused = !paused;

        if (paused) {
            
            // TODO 1.2: Pause timers
            

            // TODO 4.0: Pause sounds
            
        
        
        } else {
            
            // TODO 1.2: Unpause timers
            

            // TODO 4.0: Unpause sounds
            
        
        }

    }

    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        
        if (soundA.vBlankCount < 100) {
            prevSong();

        }

        playSong(currentSong);

    }

    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        nextSong();

    }
    
    if (BUTTON_PRESSED(BUTTON_LSHOULDER)) {
        
        soundA.looping = !soundA.looping;

        if (soundA.looping) {
            shadowOAM[5].attr0 = ATTR0_Y(33) | ATTR0_SQUARE;

        } else {
            shadowOAM[5].attr0 = ATTR0_Y(33) | ATTR0_SQUARE | ATTR0_HIDE;

        }

    }

    if (BUTTON_PRESSED(BUTTON_RSHOULDER)) {
        
        shuffle = !shuffle;

        if (shuffle) {
            shadowOAM[4].attr0 = ATTR0_Y(33) | ATTR0_SQUARE;

        } else {
            shadowOAM[4].attr0 = ATTR0_Y(33) | ATTR0_SQUARE | ATTR0_HIDE;

        }

    }

    updateProgressBar();

    if (!soundA.isPlaying && frame % 5 == 4) {

        for (int i = 0; i < 10; i++) {
            intensity[i] = 0;

        }

    } else if (frame % 5 == 4) {

        for (int i = 0; i < 10; i++) {
            intensity[i] = rand() % 9;

        }

    }

    if (frame % 30 == 29) {
        int len = getStrLen(screenTitle);
        titlePosition = (titlePosition + 1 + len) % len;

    }
    
    if (!soundA.isPlaying && soundA.vBlankCount >= soundA.durationInVBlanks) {
        nextSong();

    }

    frame = (frame + 1) % 30;

}

void draw() {
    drawString(9, 10, getShown(titlePosition, screenTitle));
    drawIntensityBars();
    drawTime();
    
}

void prevSong() {
    currentSong = (shuffle) ? rand() % SONGCOUNT : (currentSong - 1 + SONGCOUNT) % SONGCOUNT;
    playSong(currentSong);

}

void nextSong() {
    currentSong = (shuffle) ? rand() % SONGCOUNT : (currentSong + 1) % SONGCOUNT;
    playSong(currentSong);

}

void initProgressBar() {
    
    minute = 0;
    second = 0;
    
    progress = 0;
    
    for (int i = 0; i < 12; i++) {
        SCREENBLOCK[24].tilemap[OFFSET(9 + i, 11, 32)] = SCREENBLOCK[24].tilemap[OFFSET(9 + i, 2, 32)];

    }

}

void updateProgressBar() {

    int currProgress = checkProgress();

    if (soundA.vBlankCount == 0) {
        initProgressBar();
    
    } else if (progress < currProgress) {

        progress = currProgress;

        for (int i = 0; i < progress; i++) {
            SCREENBLOCK[24].tilemap[OFFSET(9 + i, 11, 32)] = SCREENBLOCK[24].tilemap[OFFSET(9 + i, 3, 32)];

        }

    }

}

int checkProgress() {

    int total = soundA.durationInVBlanks;
    int pos = soundA.vBlankCount;

    for (int i = 0; i < 13; i++) {
        if (pos <= ((i + 1) * total / 13)) return i;
    
    }

    return 0;

}

void drawIntensityBars() {

    for (int i = 0; i < 10; i++) {

        int tilexoffset = (i > 4) ? 16 : 0;

        switch (intensity[i]) {
        case 0:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            break;
        case 1:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 17, 32)];
            break;
        case 2:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 16, 32)];
            break;
        case 3:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 15, 32)];
            break;
        case 4:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 13, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 14, 32)];
            break;
        case 5:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 16, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 11, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 12, 32)];
            break;
        case 6:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 8, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 9, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 10, 32)];
            break;
        case 7:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 5, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 6, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 7, 32)];
            break;
        case 8:
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 6, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 2, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 7, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 3, 32)];
            SCREENBLOCK[24].tilemap[OFFSET(10 + i, 8, 32)] = SCREENBLOCK[24].tilemap[OFFSET(2 + tilexoffset + i, 4, 32)];
            break;

        }

    }

}

char* shown;

const char* getShown(int position, const char* str) {

    int len = getStrLen(str);
    if (len <= 12) return str;

    shown = (char*) realloc(shown, sizeof(char) * 13);

    for (int i = 0; i < 12; i++) {
        shown[i] = str[(position + i + len) % len];

    }

    return (const char*) shown;

}

char* title;

const char* getFullTitle(const char* str) {
    
    int len = getStrLen(str);

    title = (char*) realloc(title, sizeof(char) * (len + 17));
    title[0] = '\0';

    strcat(title, "Now Playing: ");
    strcat(title, str);
    strcat(title, "   ");

    return (const char*) title;

}

void drawString(int tilecol, int tilerow, const char* str) {

    int len = getStrLen(str);

    for (int i = 0; i < len; i++) {
        drawChar(tilecol + i, tilerow, str[i]);

    }

}

int getStrLen(const char* str) {

    int i = 0;
    while (str[i] != '\0') i++;
    return i;

}

void drawTime() {

    drawChar(12, 12, ':');

    if (second < 60 && minute < 60) {
        
        char secA = second / 10;
        char secB = second % 10;
        drawChar(13, 12, secA + '0');
        drawChar(14, 12, secB + '0');

        char minA = minute / 10;
        char minB = minute % 10;
        drawChar(10, 12, minA + '0');
        drawChar(11, 12, minB + '0');


    }

}

void drawChar(int tilecol, int tilerow, char c) {

    switch (c) {

    case 'a':
    case 'A':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(8, 13, 32)];
        break;
    case 'b':
    case 'B':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(9, 13, 32)];
        break;
    case 'c':
    case 'C':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 13, 32)];
        break;
    case 'd':
    case 'D':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(11, 13, 32)];
        break;
    case 'e':
    case 'E':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(12, 13, 32)];
        break;
    case 'f':
    case 'F':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(13, 13, 32)];
        break;
    case 'g':
    case 'G':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(14, 13, 32)];
        break;
    case 'h':
    case 'H':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(15, 13, 32)];
        break;
    case 'i':
    case 'I':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(16, 13, 32)];
        break;
    case 'j':
    case 'J':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(17, 13, 32)];
        break;
    case 'k':
    case 'K':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(18, 13, 32)];
        break;
    case 'l':
    case 'L':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(19, 13, 32)];
        break;
    case 'm':
    case 'M':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(20, 13, 32)];
        break;
    case 'n':
    case 'N':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(21, 13, 32)];
        break;
    case 'o':
    case 'O':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(8, 14, 32)];
        break;
    case 'p':
    case 'P':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(9, 14, 32)];
        break;
    case 'q':
    case 'Q':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 14, 32)];
        break;
    case 'r':
    case 'R':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(11, 14, 32)];
        break;
    case 's':
    case 'S':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(12, 14, 32)];
        break;
    case 't':
    case 'T':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(13, 14, 32)];
        break;
    case 'u':
    case 'U':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(14, 14, 32)];
        break;
    case 'v':
    case 'V':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(15, 14, 32)];
        break;
    case 'w':
    case 'W':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(16, 14, 32)];
        break;
    case 'x':
    case 'X':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(17, 14, 32)];
        break;
    case 'y':
    case 'Y':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(18, 14, 32)];
        break;
    case 'z':
    case 'Z':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(19, 14, 32)];
        break;
    case ':':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(20, 14, 32)];
        break;
    case '-':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(21, 14, 32)];
        break;
    case '0':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(8, 15, 32)];
        break;
    case '1':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(9, 15, 32)];
        break;
    case '2':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(10, 15, 32)];
        break;
    case '3':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(11, 15, 32)];
        break;
    case '4':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(12, 15, 32)];
        break;
    case '5':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(13, 15, 32)];
        break;
    case '6':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(14, 15, 32)];
        break;
    case '7':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(15, 15, 32)];
        break;
    case '8':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(16, 15, 32)];
        break;
    case '9':
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(17, 15, 32)];
        break;
    default:
        SCREENBLOCK[24].tilemap[OFFSET(tilecol, tilerow, 32)] = SCREENBLOCK[24].tilemap[OFFSET(18, 15, 32)];
        break;

    }

}