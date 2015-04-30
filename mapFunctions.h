#include <time.h>
#include <stdlib.h>

#include "map.pal.h"
#include "map.raw.h"
//////////////////////////////////////////////////////////////////////////////////////////////map functions

void move(char direction[]);
bool checkDirection(char direction[]);

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

    int tilesFromTop;
    int tilesFromLeft;
    
    int directionToKeepMovingX;
    int directionToKeepMovingY;

    double rocketPower;
    double gravity;
    double playerVelocity;
    int terminalVelocity;
    int maxRocketVelocity;
    
    bool currentlyDigging;
    int digProgress;
    int digTotal;
    char digDirection;
}scrollingBG;

scrollingBG bg;

int tileToCopy, locationToPaste;
int x, y;
int mapWidthTiles, mapHeightTiles;
int screenWidth, screenHeight;
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

    map_Map[position] = tile;                           // upper left
    map_Map[position+1] = tile+1;                       // upper right
    map_Map[position+mapWidthTiles] = tile+26;          // bottom left
    map_Map[position+mapWidthTiles+1] = tile+27;        // bottom right

    bg0map[(position%1024)] = tile;                     // upper left
    bg0map[(position%1024)+1] = tile+1;                 // upper right
    bg0map[(position%1024)+mapWidthTiles] = tile+26;    // bottom left
    bg0map[(position%1024)+mapWidthTiles+1] = tile+27;  // bottom right
}

void removeMineral(int position) {
    int tile = 36;

    material_Map[position] = tile;                      // upper left
    material_Map[position+1] = tile;                    // upper right
    material_Map[position+mapWidthTiles] = tile;        // bottom left
    material_Map[position+mapWidthTiles+1] = tile;      // bottom right

    bg1map[(position%1024)] = tile;                     // upper left
    bg1map[(position%1024)+1] = tile;                   // upper right
    bg1map[(position%1024)+mapWidthTiles] = tile;       // bottom left
    bg1map[(position%1024)+mapWidthTiles+1] = tile;     // bottom right
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
    if (map_Map[tileToCheck] <= 27 ||
        map_Map[tileToCheck] == 62 ||
        map_Map[tileToCheck] == 63 ||
        map_Map[tileToCheck] == 88 ||
        map_Map[tileToCheck] == 89) {
        return true;
    }
    return false;
}


void moveToYTile() {
    bool isTileAligned = false;
    if ((sprites[0].y + y) % 16 == 0) {
        isTileAligned = true;
        bg.directionToKeepMovingY = 0;
        bg.tilesFromTop = (sprites[0].y + y)/8;
    }

    if (!isTileAligned) { // keep moving them to a 16x16 tile
        if (bg.directionToKeepMovingY > 0) {
            move("up");
        }
        else if (bg.directionToKeepMovingY < 0) {
            move("down");
        }
    }
}

void moveToXTile() {
    bool isTileAligned = false;
    if ((sprites[0].x + x) % 16 == 0) {
        isTileAligned = true;
        bg.directionToKeepMovingX = 0;
        bg.tilesFromLeft = (sprites[0].x + x)/8;
    }

    if (!isTileAligned) { // keep moving them to a 16x16 tile
        if (bg.directionToKeepMovingX > 0) {
            move("right");
        }
        else if (bg.directionToKeepMovingX < 0) {
            move("left");
        }
    }
}


// attemps to dig in the passed direction
void dig() {
    // first loop
    if (bg.digTotal == 0) {
        bg.currentlyDigging = true;
        // calculate dig speed
        bg.digTotal = sprites[0].engineType*16 + sprites[0].drillType*16 + 16; // how many frames the 16x16 tile should take to be dug
    }
    
    // see if we are done digging
    else if (bg.digProgress == bg.digTotal) {
        bg.currentlyDigging = false;
        bg.digTotal = 0;
        bg.digProgress = 0;

        bg.tilesFromTop = (sprites[0].y + y)/8;
        bg.tilesFromLeft = (sprites[0].x + x)/8;
        bg.tileUnderPlayer = bg.tilesFromTop*mapWidthTiles + bg.tilesFromLeft;

        removeMineral(bg.tileUnderPlayer); // remove mineral
        setDirt(bg.tileUnderPlayer); // set background to dirt
        // add money
        // remove gas

        return;
    }
    
    bg.digProgress++; // advance another frame
    bool digThisFrame = false;
    
    if (bg.digProgress%(bg.digTotal/16) == 0) {
        digThisFrame = true;
    }
    
    // move the player
    if (digThisFrame) {
        switch (bg.digDirection) {
            case 'l':
            case 'L':
                move("left");
                break;
            
            case 'r':
            case 'R':
                move("right");
                break;
                
            case 'd':
            case 'D':
                move("down");
                break;
        }
    }
}

// attempts to move in the passed direction
void move(char direction[]) {
    if (strcmp(direction, "up") == 0) {
        // the tile above the player is empty
        if (checkDirection(direction)) {
            // don't let the player fly too high
            if (y < 16 && bg.playerVelocity < 0) {
                y = 16;
                bg.playerVelocity = 0;
            }
            else {
                bg.directionToKeepMovingY = 1;

                // check if tile above player is empty
                y--;
                bg.deltaY--;
            }
        }
    }
    else if (strcmp(direction, "down") == 0) {
        // bottom of map bounds checking
    	if (y < (mapHeightTiles*8)-200) {
            // start to dig if the tile isn't open
            if (!bg.currentlyDigging && !checkDirection(direction)) {
                bg.digDirection = 'd'; // down
                dig();
            }
            else {
                y++;
                bg.deltaY++;
                
                bg.directionToKeepMovingY = -1;
            }
        }
    }
    else if (strcmp(direction, "left") == 0) {
        // start to dig if the tile isn't open
        if (!bg.currentlyDigging && !checkDirection(direction)) {
            // dont let them dig while flying
            if (!checkDirection("down")) {
                bg.digDirection = 'l'; // left
                dig();
            }
        }
        else {
            if (sprites[0].x > 120) {
                sprites[0].x--;
            }
            else if (x > 0) {
                x--;
            }
            else if (sprites[0].x > 8) {
                sprites[0].x--;
            }
            
            bg.directionToKeepMovingX = -1;
        }
    }
    else if (strcmp(direction, "right") == 0) {
        // start to dig if the tile isn't open
        if (!bg.currentlyDigging && !checkDirection(direction)) {
            // dont let them dig while flying
            if (!checkDirection("down")) {
                bg.digDirection = 'r'; // right
                dig();
            }
        }
        else {
            if (sprites[0].x < 120) {
                sprites[0].x++;
            }
            else if (x < 16) {
                x++;
            }
            else if (sprites[0].x < 232) {
                sprites[0].x++;
            }

            bg.directionToKeepMovingX = 1;
        }
    }
    
    
    
    if (bg.deltaX <= -8) {
        bg.deltaX = 0;
        bg.tileUnderPlayer--;
    }
    else if (bg.deltaX >= 8) {
        bg.deltaX = 0;
        bg.tileUnderPlayer++;
    }
    
    
    
    if (bg.deltaY <= -8) { // moved up
        tilesFromTop--;
        bg.deltaY += 8;
        bg.tileUnderPlayer -= mapWidthTiles;

        tileToCopy = 32 * (abs(tilesFromTop - 1));
        locationToPaste = 32 * (abs(tilesFromTop - 1) % 32);

        int loopMe = 0;
        for (loopMe = 0; loopMe < 32; loopMe++) {
            bg0map[locationToPaste + loopMe] = map_Map[loopMe + tileToCopy];
            bg1map[locationToPaste + loopMe] = material_Map[loopMe + tileToCopy];
        }
    }
    else if (bg.deltaY >= 8) { // moved down
        tilesFromTop++;
        bg.deltaY -= 8;
        bg.tileUnderPlayer += mapWidthTiles;

        tileToCopy = 32 * (tilesFromTop + 21);
        locationToPaste = 32 * ((tilesFromTop + 21) % 32);

        int loopMe = 0;
        for (loopMe = 0; loopMe < 32; loopMe++) {
            bg0map[locationToPaste + loopMe] = map_Map[loopMe + tileToCopy];
            bg1map[locationToPaste + loopMe] = material_Map[loopMe + tileToCopy];
        }
    }
}



// returns true if the tile is open
bool checkDirection(char direction[]) {
    int tileToCompare = bg.tileUnderPlayer; // compare current tile

    if (strcmp(direction, "up") == 0) { // top
        tileToCompare -= 2*mapWidthTiles;
    }
    else if (strcmp(direction, "right") == 0) { // right
        tileToCompare += 2;
    }
    else if (strcmp(direction, "down") == 0) { // bottom
        tileToCompare += 2*mapWidthTiles;
    }
    else if (strcmp(direction, "left") == 0) { // left
        tileToCompare -= 2;
    }

    return isTileOpen(tileToCompare);
}
