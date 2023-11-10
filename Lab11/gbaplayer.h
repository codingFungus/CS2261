
//{{BLOCK(gbaplayer)

//======================================================================
//
//	gbaplayer, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 89 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2848 + 2048 = 5408
//
//	Time-stamp: 2022-11-02, 23:51:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GBAPLAYER_H
#define GRIT_GBAPLAYER_H

#define gbaplayerTilesLen 2848
extern const unsigned short gbaplayerTiles[1424];

#define gbaplayerMapLen 2048
extern const unsigned short gbaplayerMap[1024];

#define gbaplayerPalLen 512
extern const unsigned short gbaplayerPal[256];

#endif // GRIT_GBAPLAYER_H

//}}BLOCK(gbaplayer)
