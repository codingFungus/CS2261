
//{{BLOCK(winbg)

//======================================================================
//
//	winbg, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 28 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 896 + 2048 = 2976
//
//	Time-stamp: 2023-11-09, 15:12:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINBG_H
#define GRIT_WINBG_H

#define winbgTilesLen 896
extern const unsigned short winbgTiles[448];

#define winbgMapLen 2048
extern const unsigned short winbgMap[1024];

#define winbgPalLen 32
extern const unsigned short winbgPal[16];

#endif // GRIT_WINBG_H

//}}BLOCK(winbg)
