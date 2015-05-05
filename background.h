#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include "mapFunctions.h"

int previousX;

////////////////////////////////////////////////////////////////This method initializes the background variables of the game.
void initbackgrounds() {
    material_Map = (unsigned short *)malloc(20480 * sizeof(unsigned short));
    map_Map = (unsigned short *)malloc(20480 * sizeof(unsigned short));
    lastLocation = (unsigned short *)malloc(1024 * sizeof(unsigned short));
    lastLocationMinerals = (unsigned short *)malloc(1024 * sizeof(unsigned short));

    previousX = 0;
    x = 0;
	y = 0;
		
	mapWidthTiles = 32;
	mapHeightTiles = 640;
	
	screenWidth = 240;
	screenHeight = 160;
	
    xLoop = 0;
    yLoop = 0;
    
    // Drill levels
    // 4 = starting,    3 = iron,   2 = emerald,    1 = titanium,   0 = diamond
    
    // --------- Starting Drill ---------
    materials[0].topLeftTile = 38;              // white gravel
    materials[0].minimumDrillLevel = 4;
    materials[0].value = 75;
    
    materials[1].topLeftTile = 40;              // gray gravel
    materials[1].minimumDrillLevel = 4;
    materials[1].value = 75;
    
    
    // --------- Iron Drill ---------
    materials[2].topLeftTile = 42;              // sand
    materials[2].minimumDrillLevel = 3;
    materials[2].value = 150;
    
    materials[3].topLeftTile = 46;              // bronze
    materials[3].minimumDrillLevel = 3;
    materials[3].value = 150;


    // --------- Emerald Drill ---------
    materials[4].topLeftTile = 44;              // iron
    materials[4].minimumDrillLevel = 2;
    materials[4].value = 300;
    
    materials[5].topLeftTile = 60;              // white
    materials[5].minimumDrillLevel = 2;
    materials[5].value = 300;


    // --------- Titanium Drill ---------
    materials[6].topLeftTile = 52;              // red
    materials[6].minimumDrillLevel = 1;
    materials[6].value = 600;

    materials[7].topLeftTile = 54;              // purple
    materials[7].minimumDrillLevel = 1;
    materials[7].value = 600;

    materials[8].topLeftTile = 56;              // green
    materials[8].minimumDrillLevel = 1;
    materials[8].value = 600;

    materials[9].topLeftTile = 58;              // pink
    materials[9].minimumDrillLevel = 1;
    materials[9].value = 600;
    
    
    // --------- Diamond Drill ---------
    materials[10].topLeftTile = 48;             // gold
    materials[10].minimumDrillLevel = 0;
    materials[10].value = 1000;

    materials[11].topLeftTile = 50;             // purple stripes
    materials[11].minimumDrillLevel = 0;
    materials[11].value = 1000;
    
    
    // --------- Other Tiles ---------
    materials[11].topLeftTile = 36;             // empty tile
    materials[11].minimumDrillLevel = 4;
    materials[11].value = 0;


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
    bg.tileUnderPlayer = 15 + mapWidthTiles*10;
    bg.rocketPower = .15;
    bg.gravity = .1;
    bg.playerVelocity = 0;
    bg.terminalVelocity = 3;
    bg.maxRocketVelocity = 2;

    bg.currentlyDigging = false;
    bg.digProgress = 0;
    bg.digTotal = 0;

    bg.directionToKeepMovingX = 0; // stores a positive or negative number to keep the player moving left or right
    bg.directionToKeepMovingY = 0; // same but up and down
    bg.tileUnderPlayer = 0;
    bg.tilesFromTop = 9;
    bg.tilesFromLeft = 0;
    
	bg0map = (unsigned short*)ScreenBaseBlock(23);
	bg1map = (unsigned short*)ScreenBaseBlock(31);
}

//////////////////////////////////////////////////////////This method loads the backgrounds of the game.
void loadBackground() {
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (23 << SCREEN_SHIFT | 1) | (0 << CHAR_SHIFT);
	REG_BG1CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (31 << SCREEN_SHIFT);
	
	DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW); // copy palette into the background
    DMAFastCopy((void*)map_Tiles, (void*)CharBaseBlock(0), 12288/4, DMA_32NOW); // copy tiles into memory

    // Generate map
    generateMap();
    
    // Load the starting position
    loadStartingPosition();
}

//////////////////////////////////////////////////////////This method reloads the background at the last position it was in
void reloadBackground() {
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (23 << SCREEN_SHIFT | 1) | (0 << CHAR_SHIFT);
	REG_BG1CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (31 << SCREEN_SHIFT);
	
	DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW); // copy palette into the background
    DMAFastCopy((void*)map_Tiles, (void*)CharBaseBlock(0), 12288/4, DMA_32NOW); // copy tiles into memory

    // Load the starting position
    loadLastPosition();
}


/////////////////////////////////////////////////////////////This method draws the backgrouds to the screen of the game.
void drawBackground() {
    keyPoll();
    WaitVBlank();
    
    bg.tileUnderPlayer = bg.tilesFromTop*mapWidthTiles + bg.tilesFromLeft;

    if (bg.currentlyDigging) {
        dig();
    }
    else if (bg.directionToKeepMovingX == 0 && bg.directionToKeepMovingY == 0) {
   	    // see if we are flying
        if (checkDirection("down")) {
            sprites[0].animation = 2; // flying animation
    	}
    	else {
            sprites[0].animation = 0;
        }
        
    	if (keyIsDown(BUTTON_UP)) {
    	    move("up");
    	}
    	else if (keyIsDown(BUTTON_DOWN)) {
    	    move("down");
    	}
    	else if (keyIsDown(BUTTON_LEFT)) {
    	    move("left");
    	}
    	else if (keyIsDown(BUTTON_RIGHT)) {
    	    move("right");
    	}
   	}
   	
    // move to nearest X tile
   	else if (bg.directionToKeepMovingX != 0) {
        //if (!keyIsDown(BUTTON_LEFT) && !keyIsDown(BUTTON_RIGHT)) {
            moveToXTile();
        //}
    }
    
	
	// move to nearest Y tile
	else if (bg.directionToKeepMovingY != 0) {
        //if (!keyIsDown(BUTTON_UP) && !keyIsDown(BUTTON_DOWN)) {
            moveToYTile();
        //}
    }

	REG_BG0VOFS = y;
	REG_BG1VOFS = y;
	
	REG_BG0HOFS = x;
	REG_BG1HOFS = x;
}

