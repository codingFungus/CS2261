
//{{BLOCK(startscreen)

//======================================================================
//
//	startscreen, 512x256@4, 
//	+ palette 16 entries, not compressed
//	+ 831 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 32 + 26592 + 4096 = 30720
//
//	Time-stamp: 2023-11-09, 11:31:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define startscreenTilesLen 26592
extern const unsigned short startscreenTiles[13296];

#define startscreenMapLen 4096
extern const unsigned short startscreenMap[2048];

#define startscreenPalLen 32
extern const unsigned short startscreenPal[16];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(startscreen)
