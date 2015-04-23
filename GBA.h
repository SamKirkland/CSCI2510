#include <time.h>
#include <stdlib.h>
#include <math.h>
#include "font.h"

//DISPLAY CONTROLLERS
#define REG_DISPCNT *(unsigned long*) 0x4000000
#define REG_DISPSTAT *(volatile unsigned short*)0x4000004

//SETMODE DEFINES
#define MODE_0 0x0
#define MODE_1 0x1
#define MODE_2 0x2
#define MODE_3 0x3
#define MODE_4 0x4
#define MODE_5 0x5
#define BG0_ENABLE 0x100
#define BG1_ENABLE 0x200
#define BG2_ENABLE 0x400
#define BG3_ENABLE 0x800
#define BG4_ENABLE 0x1000
#define BG5_ENABLE 0x2000
#define SetMode(mode) REG_DISPCNT = (mode)
//COLOR
#define RGB(r,g,b) (unsigned short)(r+(g<<5)+(b<<10))
//KEY POLLING DEFINES
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
//BOOLEAN
#define bool int
#define true 1
#define false 0
//DMA
#define REG_DMA3SAD *(volatile unsigned int*) 0x40000D4
#define REG_DMA3DAD *(volatile unsigned int*) 0x40000D8
#define REG_DMA3CNT *(volatile unsigned int*) 0x40000DC
#define DMA_ENABLE 0x80000000
#define DMA_TIMING_IMMEDIATE 0x00000000
#define DMA_16 0x00000000
#define DMA_32 0x04000000
#define DMA_32NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_32)
#define DMA_16NOW (DMA_ENABLE | DMA_TIMING_IMMEDIATE | DMA_16)
//BACKGROUNDS
#define REG_BG0HOFS *(volatile unsigned short*) 0x4000010
#define REG_BG0VOFS *(volatile unsigned short*) 0x4000012
#define REG_BG1HOFS *(volatile unsigned short*) 0x4000014
#define REG_BG1VOFS *(volatile unsigned short*) 0x4000016
#define REG_BG2HOFS *(volatile unsigned short*) 0x4000018
#define REG_BG2VOFS *(volatile unsigned short*) 0x400001A
#define REG_BG3HOFS *(volatile unsigned short*) 0x400001C
#define REG_BG3VOFS *(volatile unsigned short*) 0x400001E
#define REG_BG0CNT *(volatile unsigned short*) 0x4000008
#define REG_BG1CNT *(volatile unsigned short*) 0x400000A
#define REG_BG2CNT *(volatile unsigned short*) 0x400000C
#define REG_BG3CNT *(volatile unsigned short*) 0x400000E
#define BG_COLOR256 0x80
#define CHAR_SHIFT 2
#define SCREEN_SHIFT 8
#define WRAPAROUND 0x1
#define TEXTBG_SIZE_256x256 0x0
#define TEXTBG_SIZE_256x512 0x8000
#define TEXTBG_SIZE_512x256 0x4000
#define TEXTBG_SIZE_512x512 0xC000
#define CharBaseBlock(n) (((n)*0x4000)+0x6000000)
#define ScreenBaseBlock(n) (((n)*0x800)+0x6000000)
#define BGPaletteMem ((unsigned short*) 0x5000000)
#define BACKBUFFER 0x10
//SPRITES
#define SpriteMem ((unsigned short*)0x7000000)
#define SpriteData ((unsigned short*) 0x6010000)
#define SpritePal ((unsigned short*) 0x5000200)
typedef struct tagSprite
{
	unsigned short attribute0;
	unsigned short attribute1;
	unsigned short attribute2;
	unsigned short attribute3;
}Sprite,*pSprite;
Sprite sprites[128];
//OTHER CONSTANTS
#define OBJ_MAP_2D 0x0
#define OBJ_MAP_1D 0x40
#define OBJ_ENABLE 0x1000
//ATTRIBUTE0 DEFINES
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
//ATTRIBUTE1 DEFINES
#define ROTDATA(n)          ((n) << 9)
#define HORIZONTAL_FLIP		0x1000
#define VERTICAL_FLIP		0x2000
#define SIZE_8              0x0
#define SIZE_16             0x4000
#define SIZE_32             0x8000
#define SIZE_64             0xC000

//ATTRIBUTE2 DEFINES
#define PRIORITY(n)		((n) << 10)
#define PALETTE(n)		((n) << 12)

//TIMER CONTROL REGISTERS
#define REG_TM0CNT *(volatile short*) 0x4000102  	
#define REG_TM1CNT *(volatile short*) 0x4000106 	
#define REG_TM2CNT *(volatile short*) 0x400010A	
#define REG_TM3CNT *(volatile short*) 0x400010E	
//TIMER DATA REGISTERS
#define REG_TM0D *(volatile short*) 0x4000100
#define REG_TM1D *(volatile short*) 0x4000104
#define REG_TM2D *(volatile short*) 0x4000108
#define REG_TM3D *(volatile short*) 0x400010C
//OTHER TIMER DEFINES
#define TIMER_FREQUENCY_SYSTEM 0x0		//1 CPU cycle = .000000059 seconds
#define TIMER_FREQUENCY_64 0x1					// 64 CPU cycles = .000003815 seconds
#define TIMER_FREQUENCY_256 0x2				// 256 CPU cycles = .00001526 seconds
#define TIMER_FREQUENCY_1024 0x3				// 1024 CPU cycles = .00006104 seconds
#define TIMER_OVERFLOW 0x4
#define TIMER_ENABLE 0x80


//OTHER VARS
unsigned short* videoBuffer = (unsigned short*)0x6000000;
volatile unsigned int *BUTTONS = (volatile unsigned int*)0x04000130;
bool buttons[10];
unsigned short* paletteMem = (unsigned short*) 0x5000000;
volatile unsigned short* ScanlineCounter = (volatile unsigned short*) 0x4000006;
unsigned short* FrontBuffer = (unsigned short*)0x6000000;
unsigned short* BackBuffer = (unsigned short*)0x600A000;
unsigned short curr_state, prev_state;

//DMA FAST COPY
void DMAFastCopy(void* source,void* dest,unsigned int count,unsigned int mode)
{
	if (mode == DMA_16NOW || mode == DMA_32NOW)
	{
		REG_DMA3SAD = (unsigned int)source;
		REG_DMA3DAD = (unsigned int)dest;
		REG_DMA3CNT = count | mode;
	}
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
			DrawPixel4(left + x, top + y, color);//or other DrawPixel function
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


//VERTICAL REFRESH
void WaitVBlank(void)
{
    while((REG_DISPSTAT & 1)); // changed
    //while(*ScanlineCounter < 160){}
}

//OLD KEY POLLING
void CheckButtons()
{
	buttons[0] = !((*BUTTONS) & BUTTON_A);
	buttons[1] = !((*BUTTONS) & BUTTON_B);
	buttons[2] = !((*BUTTONS) & BUTTON_LEFT);
	buttons[3] = !((*BUTTONS) & BUTTON_RIGHT);
	buttons[4] = !((*BUTTONS) & BUTTON_UP);
	buttons[5] = !((*BUTTONS) & BUTTON_DOWN);
	buttons[6] = !((*BUTTONS) & BUTTON_START);
	buttons[7] = !((*BUTTONS) & BUTTON_SELECT);
	buttons[8] = !((*BUTTONS) & BUTTON_R);
	buttons[9] = !((*BUTTONS) & BUTTON_L);
}

bool Pressed(int button)
{
	switch(button)
	{
		case BUTTON_A: return buttons[0];
		case BUTTON_B: return buttons[1];
		case BUTTON_LEFT: return buttons[2];
		case BUTTON_RIGHT: return buttons[3];
		case BUTTON_UP: return buttons[4];
		case BUTTON_DOWN: return buttons[5];
		case BUTTON_START: return buttons[6];
		case BUTTON_SELECT: return buttons[7];
		case BUTTON_R: return buttons[8];
		case BUTTON_L: return buttons[9];
	}
	return 0;
}

//NEW KEY POLLING
void keyPoll()
{
	prev_state = curr_state;
	curr_state = ~(*BUTTONS) & 0x03FF;
}

int keyIsDown(int key){ return curr_state & key; }
int keyIsUp(int key){ return ~curr_state & key; }
int keyWasDown(int key){ return prev_state & key; }
int keyWasUp(int key){ return ~prev_state & key; }
int keyTransition(int key){ return (curr_state ^ prev_state)  & key; }  			//True if key has changed state
int keyHeld(int key){ return (curr_state & prev_state) & key; }						//True if key is currently pressed and was pressed
int keyHit(int key){ return (curr_state & ~prev_state) & key; }						//True if key is currently pressed and was unpressed
int keyReleased(int key){ return (~curr_state & prev_state) & key; }			//True if key is currently not pressed but was pressed

//MODE 3 FUNCTIONS
void DrawPixel3(int x, int y, unsigned short c)
{
	WaitVBlank();
	videoBuffer[y*240+x] = c;
}

void DrawCircle3(int xCenter, int yCenter, int radius, unsigned short color)
{
	int x = 0;
	int y = radius;
	int p = 3 - 2 * radius;
	while (x <= y)
	{
		DrawPixel3(xCenter + x, yCenter + y, color);
		DrawPixel3(xCenter - x, yCenter + y, color);
		DrawPixel3(xCenter + x, yCenter - y, color);
		DrawPixel3(xCenter - x, yCenter - y, color);
		DrawPixel3(xCenter + y, yCenter + x, color);
		DrawPixel3(xCenter - y, yCenter + x, color);
		DrawPixel3(xCenter + y, yCenter - x, color);
		DrawPixel3(xCenter - y, yCenter - x, color);
		if (p < 0)
			p += 4 * x++ + 6;
		else
			p += 4 * (x++ - y--) + 10;
	}
}

void DrawLine3(int x1, int y1, int x2, int y2, unsigned short color)
{
	int i, deltax, deltay, numpixels;
	int d, dinc1, dinc2;
	int x, xinc1, xinc2;
	int y, yinc1, yinc2;
	//calculate deltaX and deltaY
	deltax = abs(x2 - x1);
	deltay = abs(y2 - y1);
	//initialize
	if(deltax >= deltay)
	{
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
	else
	{
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
	if(x1 > x2)
	{
		xinc1 = -xinc1;
		xinc2 = -xinc2;
	}
	if(y1 > y2)
	{
		yinc1 = -yinc1;
		yinc2 = -yinc2;
	}
	x = x1;
	y = y1;
	//draw the pixels
	for(i = 1; i < numpixels; i++)
	{
		DrawPixel3(x, y, color);
		if(d < 0)
		{
		    d = d + dinc1;
		    x = x + xinc1;
		    y = y + yinc1;
		}
		else
		{
		    d = d + dinc2;
		    x = x + xinc2;
		    y = y + yinc2;
		}
	}
}

void DrawBox3(int left, int top, int right, int bottom, unsigned short color)
{
	int x, y;
	for(y = top; y < bottom; y++)
	for(x = left; x < right; x++)
	DrawPixel3(x, y, color);
}

//MODE 4 FUNCTIONS
void DrawPixel4(int x, int y, unsigned char color)
{
	unsigned short pixel;
	unsigned short offset = (y * 240 + x) >> 1;
	WaitVBlank();
	pixel = videoBuffer[offset];
	if(x & 1){
		videoBuffer[offset] = (color << 8) + (pixel & 0x00ff);
	} else {
		videoBuffer[offset] = (pixel & 0xFF00) + color;
	}
}

void DrawBitmap4(int x, int y, int dim1, int dim2, const unsigned char * bitmap)
{
int a;
int b;
for(a= y; a < a+(dim2-1); a++){
        for(b = x; b < b+dim1; b++){
            videoBuffer[a*240+b] = bitmap[(a-y)*dim1+b+dim1-x];
        }
    }
}

void FlipPage(void){
	if(REG_DISPCNT & BACKBUFFER)
	{
		REG_DISPCNT &= ~BACKBUFFER;
		videoBuffer = BackBuffer;
    }
    else
    {
		REG_DISPCNT |= BACKBUFFER;
		videoBuffer = FrontBuffer;
	}
}
