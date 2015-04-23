#include <time.h>
#include <stdlib.h>
#include <math.h>

#include "map.map.h"
#include "map.raw.h"
#include "map.pal.h"


struct scrollingBG {
    int xBGAhead, xBGBehind;
    int xMapAhead, xMapBehind;
    int yMapAhead, yMapBehind;
    int ulx, uly;
    int deltaX, deltaY;
};


struct scrollingBG bg;
int game_state;  //Change this initialization to 1 to skip the start menu.  Doing this will eliminate rand seeding, however.
int n, tileToCopy, locationToPaste;
int x, y;
int mapWidthTiles, mapHeightTiles;
int screenWidth, screenHeight;
int playerXTile, playerYTile;
int xLoop, yLoop;
unsigned short* bg0map;
unsigned short* bg1map;


void Initialize(){
	//Initialize global variables (gas, money, upgrade levels, damage, game state, etc.)
	//NO DECLARATIONS HERE.  All variables referenced in this function should be global.
	x = 0;
	y = 0;
	
	
    bg.xBGBehind = 31;
    bg.xBGAhead = 30;
    bg.xMapBehind = -1; // 16
    bg.xMapAhead = 32; // 47
    bg.yMapBehind = -1;
    bg.yMapAhead = 32;
    bg.ulx = 0;
    bg.uly = 0;
    bg.deltaX = 0;
    bg.deltaY = 0;
	
	mapWidthTiles = 64;
	mapHeightTiles = 320;
	
	screenWidth = 240;
	screenHeight = 160;
	
	playerXTile = 16; // 16
	playerYTile = 10;
	
    xLoop = 0;
    yLoop = 0;
	
	game_state = 1;
	bg0map = (unsigned short*)ScreenBaseBlock(23);
	bg1map = (unsigned short*)ScreenBaseBlock(31);
}

void setMineral(int position, int tile) {
    material_Map[position] = tile;                      // upper left
    material_Map[position+1] = tile+1;                  // upper right
    material_Map[position+mapWidthTiles] = tile+8;      // bottom left
    material_Map[position+mapWidthTiles+1] = tile+9;    // bottom right
}

void setDirt() {
    int tile = 32;
    int position = playerXTile + playerYTile*mapWidthTiles;
    
    map_Map[position] = tile;                       // upper left
    map_Map[position+1] = tile+1;                   // upper right
    map_Map[position+mapWidthTiles] = tile+8;       // bottom left
    map_Map[position+mapWidthTiles+1] = tile+9;     // bottom right
    
    bg0map[position] = tile;                        // upper left
    bg0map[position+1] = tile+1;                    // upper right
    bg0map[position+32] = tile+8;                   // bottom left
    bg0map[position+32+1] = tile+9;                 // bottom right
}

void blackoutMinerals() {
    for (yLoop = 0; yLoop < 64; yLoop++) {
        for (xLoop = 0; xLoop < 64; xLoop++) {
            material_Map[xLoop + yLoop*32] = 48;
        }
    }
}

void addAllMinerals() {
    for (yLoop = 12; yLoop < 32; yLoop+=2) {
        for (xLoop = 0; xLoop < 64; xLoop+=2) {
            int r = rand() % 20; // 0 and 19

            if (r < 3) {
                setMineral(xLoop + yLoop*mapWidthTiles, 28);
            }
		}
    }
}

void loadStartingPosition() {
    for (yLoop = 0; yLoop < 32; yLoop++) {
        for (xLoop = 0; xLoop < 32; xLoop++) {
            bg0map[xLoop + yLoop*32] = map_Map[xLoop + yLoop*mapWidthTiles]; // xLoop + 16
            bg1map[xLoop + yLoop*32] = material_Map[xLoop + yLoop*mapWidthTiles]; // xLoop + 16
        }
    }
}

void LoadContent(){
	//Load Music and sound effects
	
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (23 << SCREEN_SHIFT | 1);
	REG_BG1CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (31 << SCREEN_SHIFT);
	
	DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW); // copy palette into the background
    DMAFastCopy((void*)map_Tiles, (void*)CharBaseBlock(0), 12288/4, DMA_32NOW); // copy tiles into memory

    srand(time(NULL));

    // fill material map with black
    blackoutMinerals();

    // Place all minerals
    addAllMinerals();
    
    // Load the starting position
    loadStartingPosition();
}

void Update(){
    /*
    Game state table:
        State 0		Start Screen
        State 1		Explore Mode
        State 2		Shop/Menu Mode
        State 3		Game Over (Death)
        State 4		Game Over (Win)
    */
	keyPoll();
	WaitVBlank();

	switch(game_state){
		case 0:
			//Set mode 4
			SetMode(4 | BG0_ENABLE);
            //wait for start to be pressed and seed rand with the user input.
			//Logic for a controls menu
			//Increment game_state
			break;
		case 1:
			SetMode(0 | BG0_ENABLE | BG1_ENABLE);
			
			//Button Detection
			if ( keyIsDown(BUTTON_LEFT) && x > 0) {
                x--;
                bg.deltaX--;
            }
			if ( keyIsDown(BUTTON_RIGHT) && x < ((mapWidthTiles-32)*8) ) {
                x++;
                bg.deltaX++;
            }
			if (keyIsDown(BUTTON_UP) && y > 0) { y--; }
			if (keyIsDown(BUTTON_DOWN) && y < (mapHeightTiles*8)) { y++; }
			
			REG_BG0VOFS = y;
			REG_BG1VOFS = y;
			
			REG_BG0HOFS = x;
			REG_BG1HOFS = x;
			
			
			/*
                int xBGAhead = 31;
                int xBGBehind = 30;
                int xMapAhead = 31;
                int xMapBehind = 0;
                int ulx = 0;
                int uly = 0;
                int deltaX = 0;
                int deltaY = 0;
            */

            if (bg.deltaX == -8) { // LEFT
                bg.deltaX = 0;
                bg.xMapAhead = bg.xMapAhead - 1;
                bg.xMapBehind = bg.xMapBehind - 1;
                bg.xBGAhead = bg.xBGAhead - 1; // abs(bg.xBGAhead - 1) % 32;
                if (bg.xBGAhead == -1) {
                    bg.xBGAhead = 31;
                }
                bg.xBGBehind = bg.xBGBehind - 1; // abs(bg.xBGBehind - 1) % 32;
                if (bg.xBGBehind == -1) {
                    bg.xBGBehind = 31;
                }
                
                int loopY = 0;
                for (loopY = 0; loopY < 32; loopY++) {
                    bg0map[loopY*32 + bg.xBGBehind] = map_Map[loopY*mapWidthTiles + bg.xMapBehind];
                }
            }
            if (bg.deltaX == 8) {  // RIGHT
                bg.deltaX = 0;
                bg.xMapAhead = bg.xMapAhead + 1;
                bg.xMapBehind = bg.xMapBehind + 1;
                bg.xBGAhead = bg.xBGAhead + 1;
                bg.xBGAhead = bg.xBGAhead % 32;
                bg.xBGBehind = bg.xBGBehind + 1;
                bg.xBGBehind = bg.xBGBehind % 32;
                
                int loopY = 0;
                for (loopY = 0; loopY < 32; loopY++) {
                    bg0map[loopY*32 + bg.xBGAhead] = map_Map[loopY*mapWidthTiles + bg.xMapAhead];
                }
            }
            
            /*
			
                int loopMe = 0;
                for (loopMe = 0; loopMe < 32; loopMe++) {
                    bg0map[loopMe*32 + locationToPaste] = map_Map[loopMe*mapWidthTiles + tileToCopy];
                }
			*/
			
			WaitVBlank();
			
			n = 40000;
			while(n--);
			//Hit Detection
			//Game physics
			//HUD
			//Update dynamic values such as gas, money, upgrade levels, damage, etc.
			//If statement to detect game over scenarios and shop scenarios
			break;
		case 2:
			//Set mode to (4 | BG2_ENABLE)
			SetMode(3 | BG0_ENABLE);
			//Switch to determine which menu
			//Logic for each respective menu
			//Page flipping maybe
			break;
		case 3:
			//Set mode to (4 | BG2_ENABLE)
			SetMode(3 | BG0_ENABLE);
			//Continue/Restart/Quit menu
			break;
		case 4:
			//Set mode to (4 | BG2_ENABLE)
			SetMode(3 | BG0_ENABLE);
			//Display score/statistics
			break;
	}
}

void Draw(){
	switch (game_state) {
		case 0:
			//Draw appropriate graphics
			break;
		case 1:
            //Draw appropriate graphics
            break;
		case 2:
			//Draw appropriate graphics
			break;
		case 3:
			//Draw appropriate graphics
			break;
		case 4:
			//Draw appropriate graphics
			break;
	}
}
