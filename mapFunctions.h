#include <time.h>
#include <stdlib.h>

#include "map.pal.h"
#include "map.raw.h"
//////////////////////////////////////////////////////////////////////////////////////////////map functions

const unsigned short aboveGround[1024] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 4, 5, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 8, 9, 0, 0, 0, 0, 0, 0, 10, 0x040a, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0x040a, 0, 0,
    0, 0, 11, 12, 0, 0, 0, 0, 0, 0, 13, 14, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 4, 5, 6, 7, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 15, 16, 17, 18, 0, 0, 0, 0, 0, 0,
    8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 19, 20, 21, 22, 0, 0, 0, 0, 0, 0,
    11, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    10, 0x040a, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 10, 0x040a, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 13, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0x040a, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 16, 17, 18, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 20, 21, 22, 0, 0,
    0, 0, 0, 0, 15, 16, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 19, 20, 21, 22, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0x040a, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 14, 0, 0,
    8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2,
    3, 0, 0, 0, 23, 0x0417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    11, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5,
    6, 7, 0, 0, 0x0817, 0x0c17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 15, 16, 17, 18, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 19, 20, 21, 22, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 25,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 26,
    27, 27, 0x0419, 0x0418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 25, 27, 27, 26, 26,
    26, 26, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 26, 26, 26, 26, 26,
    26, 26, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 26, 26, 26, 26, 26,
    26, 26, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 26, 26, 26, 26, 26,
    26, 26, 26, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 26, 26, 26, 26, 26,
    28, 29, 28, 29, 28, 29, 30, 31, 30, 31, 30, 31, 30, 31, 30, 31,
    30, 31, 30, 31, 30, 31, 30, 31, 28, 29, 28, 29, 28, 29, 28, 29
};


unsigned short *map_Map;
unsigned short *material_Map;

typedef struct tagscrollingBG {
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
}scrollingBG;

scrollingBG bg;

int tileToCopy, locationToPaste;
int x, y;
int mapWidthTiles, mapHeightTiles;
int screenWidth, screenHeight;
int playerXTile, playerYTile;
unsigned short* bg0map;
unsigned short* bg1map;
int tilesFromTop = 0;
int xLoop, yLoop;

void setMineral(int position, int tile) {
    material_Map[position] = tile;                      // upper left
    material_Map[position+1] = tile+1;                  // upper right
    material_Map[position+mapWidthTiles] = tile+26;      // bottom left
    material_Map[position+mapWidthTiles+1] = tile+27;    // bottom right
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
    for (yLoop = 0; yLoop < 640; yLoop++) {
        for (xLoop = 0; xLoop < mapWidthTiles; xLoop++) {
            material_Map[xLoop + yLoop*32] = 36;
        }
    }
}

void addAllMinerals() {
    // we start at tile 28 because we dont want minerals above the surface
    for (yLoop = 28; yLoop < 640; yLoop+=2) {
        for (xLoop = 0; xLoop < 32; xLoop+=2) {
            int r = rand() % 100; // 0 and 19

            if (r == 0) {
                setMineral(xLoop + yLoop*mapWidthTiles, 42);
            }
            else if (r == 1) {
                setMineral(xLoop + yLoop*mapWidthTiles, 42);
            }
            else if (r == 2) {
                setMineral(xLoop + yLoop*mapWidthTiles, 44);
            }
            else if (r == 3) {
                setMineral(xLoop + yLoop*mapWidthTiles, 46);
            }
            else if (r == 4) {
                setMineral(xLoop + yLoop*mapWidthTiles, 48);
            }
            else if (r == 5) {
                setMineral(xLoop + yLoop*mapWidthTiles, 50);
            }
            else if (r == 6) {
                setMineral(xLoop + yLoop*mapWidthTiles, 52);
            }
            else if (r == 7) {
                setMineral(xLoop + yLoop*mapWidthTiles, 54);
            }
            else if (r == 8) {
                setMineral(xLoop + yLoop*mapWidthTiles, 56);
            }
            else if (r == 9) {
                setMineral(xLoop + yLoop*mapWidthTiles, 58);
            }
            else if (r == 10) {
                setMineral(xLoop + yLoop*mapWidthTiles, 60);
            }
		}
    }
}

void generateMap() {
    // generate dirt/cloud map
    int i = 0;
    for (i = 0; i < 27*32; i++) {
        map_Map[i] = aboveGround[i];
    }


    int xLoop, yLoop;
    for (yLoop = 27; yLoop <= 640; yLoop += 2) {
        for (xLoop = 0; xLoop < 32; xLoop += 2) {
            int currentPosition = mapWidthTiles*yLoop + xLoop;
            
            map_Map[currentPosition] = 32;
            map_Map[currentPosition+1] = 33;
            map_Map[currentPosition+mapWidthTiles] = 34;
            map_Map[currentPosition+mapWidthTiles+1] = 35;
        }
    }


    // generate mineral map
    blackoutMinerals();
    addAllMinerals();
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
    if (map_Map[tileToCheck] <= 27) {
        return true;
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
