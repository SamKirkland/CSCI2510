#include <time.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

// Map data
#include "mapFunctions.h"

// Sprite data
#include "spriteFunctions.h"




int game_state;  //Change this initialization to 1 to skip the start menu.  Doing this will eliminate rand seeding, however.
int n;


void Initialize(){
	//Initialize global variables (gas, money, upgrade levels, damage, game state, etc.)
	//NO DECLARATIONS HERE.  All variables referenced in this function should be global.
	x = 0;
	y = 0;
		
	mapWidthTiles = 32;
	mapHeightTiles = 640;
	
	screenWidth = 240;
	screenHeight = 160;
	
	playerXTile = 16; // 16
	playerYTile = 10;
	
    xLoop = 0;
    yLoop = 0;
    
    
    
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
    bg.tileUnderPlayer = 16 + mapWidthTiles*10;
    bg.rocketPower = .15;
    bg.gravity = .1;
    bg.playerVelocity = 0;
    bg.terminalVelocity = 3;
    bg.maxRocketVelocity = 2;
	
	game_state = 1;
	bg0map = (unsigned short*)ScreenBaseBlock(23);
	bg1map = (unsigned short*)ScreenBaseBlock(31);
	
	
	//initSprites();
}



void LoadContent(){
	//Load Music and sound effects
	
	//REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (23 << SCREEN_SHIFT | 0 << CHAR_SHIFT);
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (23 << SCREEN_SHIFT | 1) | (0 << CHAR_SHIFT);
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
	UpdateSpriteMemory();
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
			SetMode(0 | BG0_ENABLE | BG1_ENABLE | OBJ_ENABLE | OBJ_MAP_1D);
			// SetMode(0 | OBJ_ENABLE | OBJ_MAP_1D | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE);
			
			UpdateSpriteMemory();
			PlaySprite(0);
			
			if (
                keyIsDown(BUTTON_A) ||
                keyIsDown(BUTTON_B) ||
                keyIsDown(BUTTON_START) ||
                keyIsDown(BUTTON_SELECT) ||
                keyIsDown(BUTTON_R) ||
                keyIsDown(BUTTON_L)
            ) {
                setDirt(bg.tileUnderPlayer);
            }
			
			// if they aren't flying - apply gravity
			if (keyIsDown(BUTTON_UP)) {
			    // check if tile above you is empty
			    if (y > 10) {
                    bg.playerVelocity -= bg.rocketPower;

                    // Max velocity of the player
                    if (bg.playerVelocity < -bg.maxRocketVelocity) {
                        bg.playerVelocity = -bg.maxRocketVelocity;
                    }

                    // Apply the velocity to the player
                    y = floor(y + bg.playerVelocity);
                    bg.deltaY += floor(bg.playerVelocity);
                } else {
                    bg.playerVelocity = 0;
                }
            }
            else if (checkDirection("bottom") == true) {
                bg.playerVelocity += bg.gravity;
                
                // Max velocity of the player
                if (bg.playerVelocity > bg.terminalVelocity) {
                    bg.playerVelocity = bg.terminalVelocity;
                }
                
                // Apply the velocity to the player
                y = floor(y + bg.playerVelocity);
                bg.deltaY += floor(bg.playerVelocity);
            }
            else { // they hit something
                // check playerVelocity here to do fall damage
                
                bg.playerVelocity = 0;
            }
			
			
			//Button Detection
			if (keyIsDown(BUTTON_LEFT) && x > 0) {
                x--;
                bg.deltaX--;
            }
			if (keyIsDown(BUTTON_RIGHT) && x < 16) {
                x++;
                bg.deltaX++;
            }

            
			if (keyIsDown(BUTTON_DOWN) && y < (mapHeightTiles*8)) {
                //digDirection("down");

                y++;
                bg.deltaY++;
            }
            
            
			REG_BG0VOFS = y;
			REG_BG1VOFS = y;
			
			REG_BG0HOFS = x;
			REG_BG1HOFS = x;
			
			
            
            if (bg.deltaX == -8) {
                bg.deltaX = 0;
                bg.tileUnderPlayer--;
            }
            else if (bg.deltaX == 8) {
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
