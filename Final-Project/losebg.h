
//{{BLOCK(losebg)

//======================================================================
//
//	losebg, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 33 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 1056 + 2048 = 3136
//
//	Time-stamp: 2023-11-09, 15:14:40
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSEBG_H
#define GRIT_LOSEBG_H

#define losebgTilesLen 1056
extern const unsigned short losebgTiles[528];

#define losebgMapLen 2048
extern const unsigned short losebgMap[1024];

#define losebgPalLen 32
extern const unsigned short losebgPal[16];

#endif // GRIT_LOSEBG_H

//}}BLOCK(losebg)
