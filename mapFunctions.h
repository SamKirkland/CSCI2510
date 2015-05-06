#include <time.h>
#include <stdlib.h>

void saveLastPosition();
void loadLastPosition();

#include "map.pal.h"
#include "map.raw.h"
#include "sprite.h"
//////////////////////////////////////////////////////////////////////////////////////////////map functions

void move(char direction[]);
bool checkDirection(char direction[]);
bool canDig(char direction[]);

unsigned short *map_Map;
unsigned short *material_Map;
unsigned short *lastLocation;
unsigned short *lastLocationMinerals;

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


typedef struct tagmaterial {
    unsigned short topLeftTile;         // number of the top left tile
    unsigned short minimumDrillLevel;   // minimum drill level to mine the mineral
    unsigned short value;               // money received when mining complete
    unsigned short speedMultiplyer;     // how fast the mineral should be dug
}material;

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
material materials[15];  // create array of all materials

int tileToCopy, locationToPaste;
int x, y;
int mapWidthTiles, mapHeightTiles;
int screenWidth, screenHeight;
unsigned short* bg0map;
unsigned short* bg1map;
int tilesFromTop = 0;
int xLoop, yLoop;

int mineralDiggingValue;
int mineralDiggingTile;


// returns the value of the material with the given tile
int mineralValue(int position) {
    for (xLoop = 0; xLoop < 15; xLoop++) {
        if (materials[xLoop].topLeftTile == material_Map[position]) {
            return materials[xLoop].value;
        }
    }
    
    return 0;
}

// returns true if the current players drill can drill the given mineral
bool mineralDiggable(int position) {
    for (xLoop = 0; xLoop < 15; xLoop++) {
        if (materials[xLoop].topLeftTile == material_Map[position]) {
            // checks to make sure the drill is high enough to drill material
            if (sprites[0].drillType <= materials[xLoop].minimumDrillLevel) {
                return true;
            }
            else {
                return false;
            }
        }
    }
    
    return false;
}


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
            int r = rand() % 100; // 0 and 99

            // pick random mineral to add
            if (r < 11) {
                setMineral(xLoop + yLoop*mapWidthTiles, materials[r].topLeftTile);
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

void saveLastPosition() {
    for (yLoop = 0; yLoop < 32; yLoop++) {
        for (xLoop = 0; xLoop < 32; xLoop++) {
            lastLocation[xLoop + yLoop*32] = bg0map[xLoop + yLoop*32];
            lastLocationMinerals[xLoop + yLoop*32] = bg1map[xLoop + yLoop*32];
        }
    }
}

// loads the last position the user was at
void loadLastPosition() {
    for (yLoop = 0; yLoop < 32; yLoop++) {
        for (xLoop = 0; xLoop < 32; xLoop++) {
            bg0map[xLoop + yLoop*32] = lastLocation[xLoop + yLoop*32];
            bg1map[xLoop + yLoop*32] = lastLocationMinerals[xLoop + yLoop*32];
        }
    }
}

// loads the top of the map
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
        
        int diggingTile = 0;
        int tile = 0;
        // get current mineral we are digging
        for (tile = 0; tile < 13; tile++) {
            if (materials[tile].topLeftTile == mineralDiggingTile) {
                diggingTile = tile;
            }
        }
        
        // calculate dig speed
        bg.digTotal = materials[diggingTile].speedMultiplyer*(sprites[0].engineType*16 + sprites[0].drillType*16) + 16; // how many frames the 16x16 tile should take to be dug
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
        sprites[0].money += mineralDiggingValue; // add money
        sprites[0].gasLevel -= .5; // remove gas
        
        // reset player animation
        sprites[0].animation = 0;

        return;
    }

    bg.digProgress++; // advance another frame
    bool digThisFrame = false;

    if (bg.digProgress%(bg.digTotal/16) == 0) {
        digThisFrame = true;
    }

    // move the player
    if (digThisFrame) {
        
    	// sprites[0].animation = X;
    	// 0 for not moving
        // 1 for driving animation.
    	// 2 for jetpack animation.
    	// 3 for drilling down animation.
    	// 4 for drilling left animation.
    	// 5 for drilling right animation.
        
        switch (bg.digDirection) {
            case 'l':
            case 'L':
                move("left");
                sprites[0].animation = 4;
                break;

            case 'r':
            case 'R':
                move("right");
                sprites[0].animation = 5;
                break;

            case 'd':
            case 'D':
                move("down");
                sprites[0].animation = 3;
                break;
        }
    }
}

// attempts to move in the passed direction
void move(char direction[]) {
    if (strcmp(direction, "up") == 0) {
        // the tile above the player is empty
        if (checkDirection(direction)) {
            sprites[0].animation = 2;
            
            // don't let the player fly too high
            if (y <= 16) {// && bg.playerVelocity < 0) {
                y = 16;
                bg.playerVelocity = 0;
                bg.directionToKeepMovingY = 0;
            }
            else {
                bg.directionToKeepMovingY = 1;
                
                y = y - 2;
                bg.deltaY = bg.deltaY - 2;
            }
        }
    }
    else if (strcmp(direction, "down") == 0 && canDig(direction)) {
        // bottom of map bounds checking
    	if (y < (mapHeightTiles*8)-160) {
            // start to dig if the tile isn't open & is diggable
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
    else if (strcmp(direction, "left") == 0 && canDig(direction)) {
        // start to dig if the tile isn't open
        if (!bg.currentlyDigging && !checkDirection(direction) && sprites[0].x > 0) {
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
            else if (sprites[0].x > 0) {
                sprites[0].x--;
            }

            
            if (checkDirection("down")) {
                sprites[0].animation = 2; // flying animation
        	}
        	else {
                sprites[0].animation = 1;
            }
            bg.directionToKeepMovingX = -1;
        }
    }
    else if (strcmp(direction, "right") == 0 && canDig(direction)) {
        // start to dig if the tile isn't open
        if (!bg.currentlyDigging && !checkDirection(direction) && sprites[0].x < 224) {
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
            else if (sprites[0].x < 224) {
                sprites[0].x++;
            }

            if (checkDirection("down")) {
                sprites[0].animation = 2; // flying animation
        	}
        	else {
                sprites[0].animation = 1;
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


// returns true if the tile is diggable
bool canDig(char direction[]) {
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
    
    mineralDiggingValue = mineralValue(tileToCompare);
    mineralDiggingTile = material_Map[tileToCompare];
    
    return mineralDiggable(tileToCompare);
}

