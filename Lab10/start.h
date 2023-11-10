
//{{BLOCK(start)

//======================================================================
//
//	start, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 69 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2208 + 2048 = 4768
//
//	Time-stamp: 2023-10-24, 13:21:38
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_START_H
#define GRIT_START_H

#define startTilesLen 2208
extern const unsigned short startTiles[1104];

#define startMapLen 2048
extern const unsigned short startMap[1024];

#define startPalLen 512
extern const unsigned short startPal[256];

#endif // GRIT_START_H

//}}BLOCK(start)
