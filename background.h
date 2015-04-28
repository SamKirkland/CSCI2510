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


    previousX = 0;
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
    bg.tileUnderPlayer = 15 + mapWidthTiles*10;
    bg.rocketPower = .15;
    bg.gravity = .1;
    bg.playerVelocity = 0;
    bg.terminalVelocity = 3;
    bg.maxRocketVelocity = 2;
    
	bg0map = (unsigned short*)ScreenBaseBlock(23);
	bg1map = (unsigned short*)ScreenBaseBlock(31);
}

//////////////////////////////////////////////////////////This method loads the backgrounds of the game.
void loadBackground() {
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (23 << SCREEN_SHIFT | 1) | (0 << CHAR_SHIFT);
	REG_BG1CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 | (31 << SCREEN_SHIFT);
	
	DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW); // copy palette into the background
    DMAFastCopy((void*)map_Tiles, (void*)CharBaseBlock(0), 12288/4, DMA_32NOW); // copy tiles into memory

    srand(time(NULL));

    // Generate map
    generateMap();
    
    // Load the starting position
    loadStartingPosition();
}

/////////////////////////////////////////////////////////////This method draws the backgrouds to the screen of the game.
void drawBackground() {
    keyPoll();
    WaitVBlank();
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
			
			
    // don't let the player fly too high
    if (y < 16 && bg.playerVelocity < 0) {
        y = 16;
        bg.playerVelocity = 0;
    }
    
    // keep moving the player in their last direction until they stop on a 16x16 tile
    bool isTileAligned = false;
    if ((sprites[0].x + x) % 16 == 0) {
        isTileAligned = true;
    }

    if (!keyIsDown(BUTTON_LEFT) && !keyIsDown(BUTTON_RIGHT)) {
        if (!isTileAligned) { // keep moving them to a 16x16 tile
            int changeInX = previousX - x - sprites[0].x;

            if (changeInX > 0) {
                sprites[0].x += 1;
            }
            else if (changeInX < 0) {
                sprites[0].x -= 1;
            }
        }
    }


    	
			
	// if they aren't flying - apply gravity
	if (keyIsDown(BUTTON_UP)) {
	    // check if tile above you is empty
	
	    // vertical min/max
	    if (y > 16 && y < (mapHeightTiles*8 - 16)) {
            bg.playerVelocity -= bg.rocketPower;

            // Max velocity of the player
            if (bg.playerVelocity < -bg.maxRocketVelocity) {
                bg.playerVelocity = -bg.maxRocketVelocity;
            }

            // Apply the velocity to the player
            y = floor(y + bg.playerVelocity);
            bg.deltaY += floor(bg.playerVelocity);
        }
        else {
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
	if (keyIsDown(BUTTON_LEFT)) {
	    // move background
        if (x > 0) {
            x--;
            bg.deltaX--;
        }
        
        // move player
        else if (sprites[0].x > 0) {
            sprites[0].x -= 1;
        }
    }
    
    
	if (keyIsDown(BUTTON_RIGHT)) {
	    // move background
        if (x < 16) {
            x++;
            bg.deltaX++;
        }

        // move player
        else if (sprites[0].x < (240-16) ) {
            sprites[0].x += 1;
        }
    }


	if (keyIsDown(BUTTON_DOWN) && y < (mapHeightTiles*8)) {
        y++;
        bg.deltaY++;
    }

	REG_BG0VOFS = y;
	REG_BG1VOFS = y;
	
	REG_BG0HOFS = x;
	REG_BG1HOFS = x;
	
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
    
    
    
    previousX = x + sprites[0].x;
}

//This method is used to draw pixels to the backgrounds.
void DrawPixel4(int x, int y, unsigned char color) {
    unsigned short pixel;
    unsigned short offset = (y * 240 + x) >> 1;
    pixel = videoBuffer[offset];
    if (x & 1)
        videoBuffer[offset] = (color << 8) + (pixel & 0x00FF);
    else
        videoBuffer[offset] = (pixel & 0xFF00) + color;
}

//This methods is used to draw boxes in mode 4.
void DrawBox4(int left, int top, int right, int bottom,unsigned char color) {
    int x, y;
    for(x = left; x < right; x++)
        for(y = top; y < bottom; y++)
            DrawPixel4(x, y, color);
}

//This method is used to flip the page of the background in mode 4.
void FlipPage(void) {
    if (REG_DISPCNT & BACKBUFFER) {
        REG_DISPCNT &= ~BACKBUFFER;
        videoBuffer = BackBuffer;
    }
    else {
        REG_DISPCNT |= BACKBUFFER;
        videoBuffer = FrontBuffer;
    }
}

//This method is used to draw pixels in mode 3.
void DrawPixel3(int x, int y, unsigned short c) {
	WaitVBlank();
	videoBuffer[y*240+x] = c;
}

//This method is used to draw circles in mode 3.
void DrawCircle3(int xCenter, int yCenter, int radius, unsigned short color) {
	int x = 0;
	int y = radius;
	int p = 3 - 2 * radius;
	while (x <= y) {
		DrawPixel3(xCenter + x, yCenter + y, color);
		DrawPixel3(xCenter - x, yCenter + y, color);
		DrawPixel3(xCenter + x, yCenter - y, color);
		DrawPixel3(xCenter - x, yCenter - y, color);
		DrawPixel3(xCenter + y, yCenter + x, color);
		DrawPixel3(xCenter - y, yCenter + x, color);
		DrawPixel3(xCenter + y, yCenter - x, color);
		DrawPixel3(xCenter - y, yCenter - x, color);
		if (p < 0) {
			p += 4 * x++ + 6;
		}
		else {
			p += 4 * (x++ - y--) + 10;
		}
	}
}

//This method is used to drawLines in mode 3.
void DrawLine3(int x1, int y1, int x2, int y2, unsigned short color) {
	int i, deltax, deltay, numpixels;
	int d, dinc1, dinc2;
	int x, xinc1, xinc2;
	int y, yinc1, yinc2;
	//calculate deltaX and deltaY
	deltax = abs(x2 - x1);
	deltay = abs(y2 - y1);
	//initialize
	if (deltax >= deltay) {
		//If x is independent variable
		numpixels = deltax + 1;
		d = (2 * deltay) - deltax;
		dinc1 = deltay << 1;
		dinc2 = (deltay - deltax) << 1;
		xinc1 = 1;
		xinc2 = 1;
		yinc1 = 0;
		yinc2 = 1;
	}
	else {
		//if y is independent variable
		numpixels = deltay + 1;
		d = (2 * deltax) - deltay;
		dinc1 = deltax << 1;
		dinc2 = (deltax - deltay) << 1;
		xinc1 = 0;
		xinc2 = 1;
		yinc1 = 1;
		yinc2 = 1;
	}
	if (x1 > x2) {
		xinc1 = -xinc1;
		xinc2 = -xinc2;
	}
	if (y1 > y2) {
		yinc1 = -yinc1;
		yinc2 = -yinc2;
	}
	x = x1;
	y = y1;
	//draw the pixels
	for (i = 1; i < numpixels; i++) {
		DrawPixel3(x, y, color);
		if (d < 0) {
		    d = d + dinc1;
		    x = x + xinc1;
		    y = y + yinc1;
		}
		else {
		    d = d + dinc2;
		    x = x + xinc2;
		    y = y + yinc2;
		}
	}
}

//This method is used to draw boxes in mode 3.
void DrawBox3(int left, int top, int right, int bottom, unsigned short color) {
	int x, y;
	for(y = top; y < bottom; y++)
	for(x = left; x < right; x++)
	DrawPixel3(x, y, color);
}



//TEXT
void DrawChar(int left, int top, char letter, unsigned short color)
{
int x, y;
int draw;
	for(y = 0; y < 8; y++){
		for (x = 0; x < 8; x++)
		{
		// grab a pixel from the font char
		draw = font[(letter-32) * 64 + y * 8 + x];
			
		// if pixel = 1, then draw it
		if (draw)
			DrawPixel3(left + x, top + y, color);//or other DrawPixel function
		}
	}
}

void Print(int left, int top, char *str, unsigned short color)
{
    int pos = 0;
    while (*str)
    {
        DrawChar(left + pos, top, *str++, color);
        pos += 8;
    }
}
