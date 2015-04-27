#include "map.map.h"
#include "map.raw.h"
#include "map.pal.h"


struct scrollingBG {
    int xBGAhead, xBGBehind;
    int xMapAhead, xMapBehind;
    int yMapAhead, yMapBehind;
    int ulx, uly;
    int deltaX, deltaY;
    int tileUnderPlayer; // the current tile thats in map thats under the players position
    
    
    double rocketPower;
    double gravity;
    double playerVelocity;
    int terminalVelocity;
    int maxRocketVelocity;
};


struct scrollingBG bg;
int tileToCopy, locationToPaste;
int x, y;
int mapWidthTiles, mapHeightTiles;
int screenWidth, screenHeight;
int playerXTile, playerYTile;
int emptyTiles[28] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27};
unsigned short* bg0map;
unsigned short* bg1map;
int tilesFromTop = 0;
int xLoop, yLoop;

void setMineral(int position, int tile) {
    material_Map[position] = tile;                      // upper left
    material_Map[position+1] = tile+1;                  // upper right
    material_Map[position+mapWidthTiles] = tile+24;      // bottom left
    material_Map[position+mapWidthTiles+1] = tile+25;    // bottom right
}

void setDirt(int position) {
    int tile = 62;

    map_Map[position] = tile;                       // upper left
    map_Map[position+1] = tile+1;                   // upper right
    map_Map[position+mapWidthTiles] = tile+26;       // bottom left
    map_Map[position+mapWidthTiles+1] = tile+27;     // bottom right

    bg0map[position] = tile;                        // upper left
    bg0map[position+1] = tile+1;                    // upper right
    bg0map[position+32] = tile+26;                   // bottom left
    bg0map[position+32+1] = tile+27;                 // bottom right
}

void blackoutMinerals() {
    for (yLoop = 0; yLoop < 120; yLoop++) {
        for (xLoop = 0; xLoop < mapWidthTiles; xLoop++) {
            material_Map[xLoop + yLoop*32] = 95;
        }
    }
}

void addAllMinerals() {
    // we start at tile 28 because we dont want minerals above the surface
    for (yLoop = 28; yLoop < 120; yLoop+=2) {
        for (xLoop = 0; xLoop < 32; xLoop+=2) {
            int r = rand() % 20; // 0 and 19

            if (r < 3) {
                setMineral(xLoop + yLoop*mapWidthTiles, 56);
            }
		}
    }
}

void loadStartingPosition() {
    // DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW);

    for (yLoop = 0; yLoop < 32; yLoop++) {
        for (xLoop = 0; xLoop < 32; xLoop++) {
            bg0map[xLoop + yLoop*32] = map_Map[xLoop + yLoop*mapWidthTiles]; // xLoop + 16
            bg1map[xLoop + yLoop*32] = material_Map[xLoop + yLoop*mapWidthTiles]; // xLoop + 16
        }
    }
}


bool isTileOpen(int tileToCheck) {
    int i = 0;
    for (i = 0; i < sizeof(emptyTiles)/sizeof(emptyTiles[0]); i++) {
        if (map_Map[tileToCheck] == emptyTiles[i]) {
            return true;
        }
    }

    return false;
}

// returns true if the tile is open
bool checkDirection(char direction[]) {
    int tileToCompare = bg.tileUnderPlayer; // compare current tile

    if (strcmp(direction, "top") == 0) { // top
        tileToCompare -= mapWidthTiles;
    }
    else if (strcmp(direction, "right") == 0) { // right
        tileToCompare += 2;
    }
    else if (strcmp(direction, "bottom") == 0) { // bottom
        tileToCompare += mapWidthTiles;
    }
    else if (strcmp(direction, "left") == 0) { // left
        tileToCompare -= 2;
    }

    return isTileOpen(tileToCompare);
}
