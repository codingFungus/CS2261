
//{{BLOCK(screen)

//======================================================================
//
//	screen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 115 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3680 + 2048 = 6240
//
//	Time-stamp: 2022-11-04, 00:11:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SCREEN_H
#define GRIT_SCREEN_H

#define screenTilesLen 3680
extern const unsigned short screenTiles[1840];

#define screenMapLen 2048
extern const unsigned short screenMap[1024];

#define screenPalLen 512
extern const unsigned short screenPal[256];

#endif // GRIT_SCREEN_H

//}}BLOCK(screen)
