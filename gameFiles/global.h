#include "font.h"
#include <stdlib.h>
#include <stdio.h>

int GameState;
#define STATE_TITLESCREEN 0
#define STATE_INGAME 1
#define STATE_MENU 2
#define STATE_GAMEOVERWIN 3
#define STATE_GAMEOVERLOSE 4
#define STATE_GASSTATION 5
int setGame;
#define bool int
#define true 1
#define false 0
/////////////////////////////////////////////////////////////////////////////////////////// Sprite defines
#define SpriteMem ((unsigned short*)0x7000000)
#define SpriteData ((unsigned short*)0x6010000)
unsigned short* SpriteData3 = SpriteData + 8192;
#define SpritePal ((unsigned short*)0x5000200)

#define RGB(r,g,b) (unsigned short)(r+(g<<5)+(b<<10))

#define bool int
#define true 1
#define false 0
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long u32;
typedef signed int s32;

// misc sprite constants
#define OBJ_MAP_2D          0x0
#define OBJ_MAP_1D          0x40
#define OBJ_ENABLE          0x1000
#define BG2_ENABLE          0x400

// attribute0 stuff
#define ROTATION_FLAG 		0x100
#define SIZE_DOUBLE			0x200
#define MODE_NORMAL     	0x0
#define MODE_TRANSPERANT    0x400
#define MODE_WINDOWED		0x800
#define MOSAIC				0x1000
#define COLOR_16			0x0000
#define COLOR_256			0x2000
#define SQUARE              0x0
#define TALL                0x8000
#define WIDE                0x4000
#define REG_BLDMOD          *(u16*)0x4000050

// attribute1 stuff
#define ROTDATA(n)          ((n) << 9)
#define TRANS(n)            ((n) << 10)
#define HORIZONTAL_FLIP		0x1000
#define VERTICAL_FLIP		0x2000
#define SIZE_8              0x0
#define SIZE_16             0x4000
#define SIZE_32             0x8000
#define SIZE_64             0xC000
#define REG_BLDMOD          *(u16*)0x4000050
#define REG_COLEV           *(u16*)0x4000052
#define TARGET_TOP_BG0      0x1 //"first target"
#define TARGET_TOP_BG1      0x2
#define TARGET_TOP_BG2      0x4
#define TARGET_TOP_BG3      0x8
#define TARGET_TOP_OBJ      0x10
#define TARGET_TOP_BD       0x20
#define TARGET_LOW_BG0      0x0100 //2nd target
#define TARGET_LOW_BG1      0x0200
#define TARGET_LOW_BG2      0x0400
#define TARGET_LOW_BG3      0x0800
#define TARGET_LOW_OBJ      0x1000
#define TARGET_LOW_BD       0x2000
#define BLEND_NEG           0x40

// all blends 0->14
#define BLEND_LOW(n) ( (n) * 0x1 ) //dark pixels get through
#define BLEND_HIGH(n) ( (n) * 0x100 ) //lighter pixels get through
#define BLEND_LEVEL(n) ( BLEND_LOW(n) | BLEND_HIGH(n) ) //closest to semi-transparent levels

// attribute2 stuff
#define PRIORITY(n)		((n) << 10)
#define PALETTE(n)		((n) << 12)
s32 angle = 0;
s32 angle2 = 0;
s32 zoom = 1<<8;

////////////////////////////////////////////////////////////////////////////////////////////// Sprite methods and struct defines
typedef struct tagSprite {
	unsigned short attribute0;
	unsigned short attribute1;
	unsigned short attribute2;
	unsigned short attribute3;
} Sprite,*pSprite;

Sprite gamesprites[128];

typedef struct tagspritehandler {
	int x;			//x and y position on screen
	int y;
	u16 currentFrame[13];     //animation frame
	int activeFrame;       //which frame is active
	int alive;
	int health;
	int drillType;
	int tankType;
	int hullType;
	int engineType;
	int money;
	double gasLevel;
	int Movespeed;
	int flip;
	int trans;
	int rotate;
	int scale;
	
	int animation;
	//0 for regular animation.
	//1 for jetpack animation.
	//2 for drilling down animation.
	//3 for drilling left animation.
	//4 for drilling right animation.
	
	/*
	int dynamite1;
	int dynamite2;
	bool emerGasCan;
	bool mBot;
	*/
} Spritehandler;

Spritehandler sprites[128];

typedef struct tagRotData {
	u16 filler1[3];
	u16 pa;
	u16 filler2[3];
	u16 pb;
	u16 filler3[3];
	u16 pc;
	u16 filler4[3];
	u16 pd;
}RotData, *pRotData;
pRotData rotData = (pRotData)gamesprites;


///////////////////////////////////////////////////////////////////////////////////////////// macro defines
#define BG0_ENABLE 0x100
#define BG1_ENABLE 0x200
#define BG2_ENABLE 0x400
#define BG3_ENABLE 0x800

#define REG_DMA3SAD *(volatile unsigned int*)0x40000D4
#define REG_DMA3DAD *(volatile unsigned int*)0x40000D8
#define REG_DMA3CNT *(volatile unsigned int*)0x40000DC
#define DMA_ENABLE 0x80000000
#define DMA_TIMING_IMMEDIATE 0x00000000
#define DMA_16 0x00000000
#define DMA_32 0x04000000
#define DMA_32NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_32)
#define DMA_16NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_16)

// scrolling registers for backgrounds
#define REG_BG0HOFS *(volatile unsigned short*)0x4000010
#define REG_BG0VOFS *(volatile unsigned short*)0x4000012
#define REG_BG1HOFS *(volatile unsigned short*)0x4000014
#define REG_BG1VOFS *(volatile unsigned short*)0x4000016
#define REG_BG2HOFS *(volatile unsigned short*)0x4000018
#define REG_BG2VOFS *(volatile unsigned short*)0x400001A
#define REG_BG3HOFS *(volatile unsigned short*)0x400001C
#define REG_BG3VOFS *(volatile unsigned short*)0x400001E


// background setup registers and data
#define REG_BG0CNT *(volatile unsigned short*)0x4000008
#define REG_BG1CNT *(volatile unsigned short*)0x400000A
#define REG_BG2CNT *(volatile unsigned short*)0x400000C
#define REG_BG3CNT *(volatile unsigned short*)0x400000E
#define BG_COLOR256 0x80
#define CHAR_SHIFT 2
#define SCREEN_SHIFT 8
#define WRAPAROUND 0x1


// Palette for Backgrounds
#define BGPaletteMem ((unsigned short*)0x5000000)

// background tile bitmap sizes
#define TEXTBG_SIZE_256x256 0x0
#define TEXTBG_SIZE_256x512	0x8000
#define TEXTBG_SIZE_512x256	0x4000
#define TEXTBG_SIZE_512x512	0xC000

// background memory offset macros
#define CharBaseBlock(n) (((n)*0x4000)+0x6000000)
#define ScreenBaseBlock(n) (((n)*0x800)+0x6000000)

unsigned short* bg0map =(unsigned short*)ScreenBaseBlock(31);
unsigned short* bg2map =(unsigned short*)ScreenBaseBlock(16);

// macro to change the video mode
#define SetMode(mode) REG_DISPCNT = (mode)

// create a pointer to the video buffer
unsigned short* videoBuffer = (unsigned short*)0x6000000;

#define BACKBUFFER 0x10

// define some video addresses
#define REG_DISPCNT *(volatile unsigned short*)0x4000000
#define BGPaletteMem ((unsigned short*)0x5000000)
// declare scanline counter for vertical blank
volatile unsigned short* ScanlineCounter = (volatile unsigned short*)0x4000006;

/////////////////////////////////////////////////////////////////////////////////////////////// button defines
volatile unsigned int *BUTTONS = (volatile unsigned int *)0X4000130; //button pointer
unsigned short curr_state, prev_state;
#define BUTTON_A 1
#define BUTTON_B 2
#define BUTTON_SELECT 4
#define BUTTON_START 8
#define BUTTON_RIGHT 16
#define BUTTON_LEFT 32
#define BUTTON_UP 64
#define BUTTON_DOWN 128
#define BUTTON_R 256
#define BUTTON_L 512
short buttons[10]; //button status
char moneybuffer[8];

//////////////////////////////////////////////////////////////////////////////////////////////// button method defines
void keyPoll() {
	prev_state = curr_state;
	curr_state = ~(*BUTTONS) & 0x03FF;
}

int keyIsDown(int key) { return curr_state & key; }
int keyIsUp(int key) { return ~curr_state & key; }
int keyWasDown(int key) { return prev_state & key; }
int keyWasUp(int key) { return ~prev_state & key; }

int keyTransition(int key) { return (curr_state ^ prev_state) & key; }
int keyHeld(int key) { return (curr_state & prev_state) & key; }
int keyHit(int key) { return (curr_state & ~prev_state) & key; }
int keyReleased(int key) { return (~curr_state & prev_state) & key; }

/////////////////////////////////////////////////////////////////////////////////////////////////background and other method defines
void WaitVBlank(void) {
    while(*ScanlineCounter < 160);
}

void DMAFastCopy(void* source, void* dest, unsigned int count,unsigned int mode) {
    if (mode == DMA_16NOW || mode == DMA_32NOW) {
    	REG_DMA3SAD = (unsigned int)source;
        REG_DMA3DAD = (unsigned int)dest;
        REG_DMA3CNT = count | mode;
    }
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

void ClearSelection(){
	DrawLine3(31, 31, 160, 31, RGB(20, 20, 20));
	DrawLine3(31, 63, 160, 63, RGB(20, 20, 20));
	DrawLine3(31, 95, 160, 95, RGB(20, 20, 20));
	DrawLine3(31, 127, 160, 127, RGB(20, 20, 20));
	
	DrawLine3(31, 48, 160, 48, RGB(20, 20, 20));
	DrawLine3(31, 80, 160, 80, RGB(20, 20, 20));
	DrawLine3(31, 112, 160, 112, RGB(20, 20, 20));
	DrawLine3(31, 144, 160, 144, RGB(20, 20, 20));	
	
	DrawLine3(31, 31, 31, 150, RGB(20, 20, 20));
	DrawLine3(63, 31, 63, 150, RGB(20, 20, 20));
	DrawLine3(95, 31, 95, 150, RGB(20, 20, 20));
	DrawLine3(127, 31, 127, 150, RGB(20, 20, 20));
	
	DrawLine3(48, 31, 48, 150, RGB(20, 20, 20));
	DrawLine3(80, 31, 80, 150, RGB(20, 20, 20));
	DrawLine3(112, 31, 112, 150, RGB(20, 20, 20));
	DrawLine3(144, 31, 144, 150, RGB(20, 20, 20));

}

void clearGas(){
	DrawLine3(37, 29, 133, 29, RGB(20, 20, 20));
	DrawLine3(37, 64, 133, 64, RGB(20, 20, 20));
	DrawLine3(37, 69, 133, 69, RGB(20, 20, 20));
	DrawLine3(37, 104, 133, 104, RGB(20, 20, 20));
	DrawLine3(37, 109, 133, 109, RGB(20, 20, 20));
	DrawLine3(37, 130, 133, 130, RGB(20, 20, 20));
	
	DrawLine3(37, 29, 37, 130, RGB(20, 20, 20));
	DrawLine3(132, 29, 132, 130, RGB(20, 20, 20));
	DrawLine3(82, 29, 82, 104, RGB(20, 20, 20));
	DrawLine3(87, 29, 87, 104, RGB(20, 20, 20));	
}

void cashToString (int money){
    int x = 0;
	for (x = 0; x  < 8; x++){
		moneybuffer[x] = '\0';
	}
	sprintf(moneybuffer, "%d", money);
}


