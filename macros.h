typedef unsigned short u16;
typedef signed int s32;
#include "scr.h"
#include "sprite.h"
#include "map.h"

///////////////////////////////////////////////////////////////////////////////////////////GameState & bool defines
int GameState;
#define STATE_TITLESCREEN 0
#define STATE_INGAME 1
#define STATE_MENU 2
#define STATE_INVENTORY 3
#define STATE_GAMEOVER 4
#define bool int
#define true 1
#define false 0

/////////////////////////////////////////////////////////////////////////////////////////////macro defines
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

//scrolling registers for backgrounds
#define REG_BG0HOFS *(volatile unsigned short*)0x4000010
#define REG_BG0VOFS *(volatile unsigned short*)0x4000012
#define REG_BG1HOFS *(volatile unsigned short*)0x4000014
#define REG_BG1VOFS *(volatile unsigned short*)0x4000016
#define REG_BG2HOFS *(volatile unsigned short*)0x4000018
#define REG_BG2VOFS *(volatile unsigned short*)0x400001A
#define REG_BG3HOFS *(volatile unsigned short*)0x400001C
#define REG_BG3VOFS *(volatile unsigned short*)0x400001E


//background setup registers and data
#define REG_BG0CNT *(volatile unsigned short*)0x4000008
#define REG_BG1CNT *(volatile unsigned short*)0x400000A
#define REG_BG2CNT *(volatile unsigned short*)0x400000C
#define REG_BG3CNT *(volatile unsigned short*)0x400000E
#define BG_COLOR256 0x80
#define CHAR_SHIFT 2
#define SCREEN_SHIFT 8
#define WRAPAROUND 0x1


//Palette for Backgrounds
#define BGPaletteMem ((unsigned short*)0x5000000)

//background tile bitmap sizes
#define TEXTBG_SIZE_256x256 0x0
#define TEXTBG_SIZE_256x512	0x8000
#define TEXTBG_SIZE_512x256	0x4000
#define TEXTBG_SIZE_512x512	0xC000

//background memory offset macros
#define CharBaseBlock(n) (((n)*0x4000)+0x6000000)
#define ScreenBaseBlock(n) (((n)*0x800)+0x6000000)

unsigned short* bg0map =(unsigned short*)ScreenBaseBlock(31);

//macro to change the video mode
#define SetMode(mode) REG_DISPCNT = (mode)

//create a pointer to the video buffer
unsigned short* FrontBuffer = (unsigned short*)0x6000000;
unsigned short* BackBuffer = (unsigned short*)0x600A000;
unsigned short* videoBuffer;
#define BACKBUFFER 0x10

//define some video addresses
#define REG_DISPCNT *(volatile unsigned short*)0x4000000
#define BGPaletteMem ((unsigned short*)0x5000000)
//declare scanline counter for vertical blank
volatile unsigned short* ScanlineCounter = (volatile unsigned short*)0x4000006;

///////////////////////////////////////////////////////////////////////////////////////////Sprite defines
//define object attribute memory state address
#define SpriteMem ((unsigned short*)0x7000000)

//define object attribute memory image address
#define SpriteData ((unsigned short*)0x6010000)

//video modes 3-5, OAMData starts at 0x6010000 + 8192
unsigned short* SpriteData3 = SpriteData + 8192;

//define object attribute memory palette address
#define SpritePal ((unsigned short*)0x5000200)

//misc sprite constants
#define OBJ_MAP_2D 0x0
#define OBJ_MAP_1D 0x40
#define OBJ_ENABLE 0x1000
#define BG2_ENABLE	0x400

//attribute0 stuff
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
#define REG_BLDMOD     *(u16*)0x4000050

//attribute1 stuff
#define ROTDATA(n)          ((n) << 9)
#define TRANS(n)            ((n) << 10)
#define HORIZONTAL_FLIP		0x1000
#define VERTICAL_FLIP		0x2000
#define SIZE_8              0x0
#define SIZE_16             0x4000
#define SIZE_32             0x8000
#define SIZE_64             0xC000
#define REG_BLDMOD     *(u16*)0x4000050
#define REG_COLEV      *(u16*)0x4000052
#define TARGET_TOP_BG0 0x1 //"first target"
#define TARGET_TOP_BG1 0x2
#define TARGET_TOP_BG2 0x4
#define TARGET_TOP_BG3 0x8
#define TARGET_TOP_OBJ 0x10
#define TARGET_TOP_BD 0x20
#define TARGET_LOW_BG0 0x0100 //2nd target
#define TARGET_LOW_BG1 0x0200
#define TARGET_LOW_BG2 0x0400
#define TARGET_LOW_BG3 0x0800
#define TARGET_LOW_OBJ 0x1000
#define TARGET_LOW_BD 0x2000
#define BLEND_NEG 0x40

//all blends 0->14
#define BLEND_LOW(n) ( (n) * 0x1 ) //dark pixels get through
#define BLEND_HIGH(n) ( (n) * 0x100 ) //lighter pixels get through
#define BLEND_LEVEL(n) ( BLEND_LOW(n) | BLEND_HIGH(n) ) //closest to semi-transparent levels

//attribute2 stuff
#define PRIORITY(n)		((n) << 10)
#define PALETTE(n)		((n) << 12)
s32 angle = 0;
s32 angle2 = 0;
s32 zoom = 1<<8;

/////////////////////////////////////////////////////////////////////////////////////////////////macros method defines
void initSprites(void);
void initbackgrounds(void);
int stotal = sprite_WIDTH*sprite_HEIGHT/2;
void init()
{
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 |(31 << SCREEN_SHIFT | 0 << CHAR_SHIFT);
    SetMode(0 | OBJ_ENABLE | OBJ_MAP_1D | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE);
     DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW);
	initSprites();
	initbackgrounds();
}

void initbackgrounds()
{
     int row,coll;
    DMAFastCopy((void*)map_Tiles, (void*)CharBaseBlock(0),sizeof(map_Tiles), DMA_32NOW);
    for(coll = 0;coll < 32;coll++){
	    for(row = 0;row < 32;row++){
                    bg0map[row + (coll * 32)] = map_Map[row + (coll * 320)];
         }
     }
}

void WaitVBlank(void)
{
    while(*ScanlineCounter < 160);
}

void DMAFastCopy(void* source, void* dest, unsigned int count,unsigned int mode)
{
    if (mode == DMA_16NOW || mode == DMA_32NOW)
    {
    	REG_DMA3SAD = (unsigned int)source;
        REG_DMA3DAD = (unsigned int)dest;
        REG_DMA3CNT = count | mode;
    }
}

void DrawPixel4(int x, int y, unsigned char color)
{
    unsigned short pixel;
    unsigned short offset = (y * 240 + x) >> 1;
    pixel = videoBuffer[offset];
    if (x & 1)
        videoBuffer[offset] = (color << 8) + (pixel & 0x00FF);
    else
        videoBuffer[offset] = (pixel & 0xFF00) + color;
}

void DrawBox4(int left, int top, int right, int bottom,unsigned char color)
{
    int x, y;
    for(x = left; x < right; x++)
        for(y = top; y < bottom; y++)
            DrawPixel4(x, y, color);
}

void FlipPage(void)
{
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

///////////////////////////////////////////////////////////////////////////////////////////////button defines
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

////////////////////////////////////////////////////////////////////////////////////////////////button method defines
void keyPoll()
{
	prev_state = curr_state;
	curr_state = ~(*BUTTONS) & 0x03FF;
}

int keyIsDown(int key)
{ return curr_state & key; }
int keyIsUp(int key)
{ return ~curr_state & key; }
int keyWasDown(int key)
{ return prev_state & key; }
int keyWasUp(int key)
{ return ~prev_state & key; }

//True if key has changed state
int keyTransition(int key)
{ return (curr_state ^ prev_state) & key; }
//True if key is currently pressed and was pressed
int keyHeld(int key)
{ return (curr_state & prev_state) & key; }
//True if key is currently pressed and was unpressed
int keyHit(int key)
{ return (curr_state & ~prev_state) & key; }
//True if key is currently not pressed but was pressed
int keyReleased(int key)
{ return (~curr_state & prev_state) & key; }

//////////////////////////////////////////////////////////////////////////////////////////////Sprite method & struct defines
typedef struct tagSprite
{
	unsigned short attribute0;
	unsigned short attribute1;
	unsigned short attribute2;
	unsigned short attribute3;
}Sprite,*pSprite;

Sprite gamesprites[128];

typedef struct tagspritehandler
{
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
	int gasLevel;
	int Movespeed;
	int flip;
	int trans;
	int rotate;
	int scale;
	/*
	int dynamite1;
	int dynamite2;
	bool emerGasCan;
	bool mBot;
	*/
}Spritehandler;

Spritehandler sprites[128];

typedef struct tagRotData
{
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

void UpdateSpriteMemory()
{
    int n;
    unsigned short* temp;
    temp = (unsigned short*)gamesprites;
    for(n = 0; n < 128*4; n++)
        SpriteMem[n] = temp[n];
}

void setSpriteInfo(int num)
{
    sprites[num].activeFrame = 0;
    sprites[num].currentFrame[0] = 0;
    sprites[num].currentFrame[1] = 8;
    sprites[num].currentFrame[2] = 16;
    sprites[num].currentFrame[3] = 24;
    sprites[num].currentFrame[4] = 32;
    sprites[num].currentFrame[5] = 40;
    sprites[num].currentFrame[6] = 48;
    sprites[num].currentFrame[7] = 56;
    sprites[num].currentFrame[8] = 64;
    sprites[num].currentFrame[9] = 72;
    sprites[num].currentFrame[10] = 80;
    sprites[num].currentFrame[11] = 88;
    sprites[num].currentFrame[12] = 96;
    sprites[num].currentFrame[13] = 104;
    sprites[num].x = 240;
    sprites[num].y = 160;
    sprites[num].alive = 1;
    sprites[num].hullType = 50;
    sprites[num].engineType = 1;
    sprites[num].Movespeed = 1;
    sprites[num].drillType = 1;
    sprites[num].tankType = 1;
    sprites[num].money = 0;
    sprites[num].gasLevel = 50;
    sprites[num].activeFrame = 0;
}

void CopySpritePal()
{
    int n;
	for(n = 0; n < 256; n++)	
		SpritePal[n] = spritePalette[n];
}

void CopySpriteData()
{
    int n;
	for(n = 0; n < stotal; n++)
		SpriteData[n] = spriteData[n];
}

void initSprites()
{
    int n;
    for(n = 0; n < 128; n++)
	{
        setSpriteInfo(n);
		gamesprites[n].attribute0 = 160; //using copy of OAM
		gamesprites[n].attribute1 = 240;
		gamesprites[n].attribute2 = 0;
	}
	
	//copying the sprite data to the memory.
    CopySpritePal();
    CopySpriteData();
    
    //declaring the x and y for the sprites.
    sprites[0].x = 0;
    sprites[0].y = 8;
    
    //updating the position and the animation of the sprite.
    updateSprite(0);
}

void flipSprite(int flip, int num)
{
    if (flip == 0)
        gamesprites[num].attribute1 = gamesprites[num].attribute1 | 0x1000;
    else if (flip == 1)
    {
        gamesprites[num].attribute1 = gamesprites[num].attribute1 & -0x1111;
        gamesprites[num].attribute1 = gamesprites[num].attribute1 | 0x1000;
        gamesprites[num].attribute1 = gamesprites[num].attribute1 & -0x1111;
    }
    else if (flip == 2);
    else if (flip == 3);
}

void RotateSprite(int rotDataIndex, s32 angle, s32 x_scale,s32 y_scale)
{

	s32 pa,pb,pc,pd;

	pa = ((x_scale) * (s32)COS[angle])>>8;    //(do my fixed point multiplies and shift back down)
	pb = ((y_scale) * (s32)SIN[angle])>>8;
	pc = ((x_scale) * (s32)-SIN[angle])>>8;
	pd = ((y_scale) * (s32)COS[angle])>>8;

	rotData[rotDataIndex].pa = pa;  //put them in my data struct
	rotData[rotDataIndex].pb = pb;
	rotData[rotDataIndex].pc = pc;
	rotData[rotDataIndex].pd = pd;
}

void updateSprite(int num)
{
    gamesprites[num].attribute0 = COLOR_256 | SQUARE | sprites[num].y;
    gamesprites[num].attribute1 = SIZE_16 | sprites[num].x;
    gamesprites[num].attribute2 = sprites[num].currentFrame[sprites[num].activeFrame];
}

void setHealth(int health, int num)
{
	sprites[num].health = health;
}

void setAlive(int num, int life)
{
    sprites[num].alive = life;
}

void setGas(int num, int gas)
{
    sprites[num].gasLevel = gas;
}

void setMoney(int num, int money)
{
    sprites[num].money = money;
}

void setDrill(int num, int drill)
{
    sprites[num].drillType = drill;
}

void setSpeed(int num, int speed)
{
    sprites[num].Movespeed = speed;
}

void setEngine(int num, int Engine)
{
    sprites[num].engineType = Engine;
}

void setTank(int num, int tank)
{
    sprites[num].tankType = tank;
}

void setHull(int num, int hull)
{
    sprites[num].hullType = hull;
}

void PlaySprite(int num)
{
    keyPoll();
    WaitVBlank();
    if(sprites[num].alive == 1)
    {
        if(keyHeld(BUTTON_UP))
        {
            if(sprites[num].y > 0)
                sprites[num].y -= 1;
            if(sprites[num].activeFrame == 11){
                sprites[num].activeFrame = 12;
            }else{
                sprites[num].activeFrame = 11;
            }
        }

        if(keyHeld(BUTTON_DOWN))
        {
            if(sprites[num].y < (160-16))
                sprites[num].y += 1;
            if(sprites[num].activeFrame == 6){
                sprites[num].activeFrame = 7;
            }else{
                sprites[num].activeFrame = 6;
            }
        }

        if(keyHeld(BUTTON_LEFT))
        {
            if(sprites[num].x > 0)
                sprites[num].x -= 1;
            if(sprites[num].y <= 8){
                if(sprites[num].activeFrame == 0){
                    sprites[num].activeFrame = 1;
                }else{
                    sprites[num].activeFrame = 0;
                }
            }
            else
            {
                if(sprites[num].activeFrame == 4){
                    sprites[num].activeFrame = 5;
                }else{
                    sprites[num].activeFrame = 4;
                }
            }
        }

        if(keyHeld(BUTTON_RIGHT))
        {
            if(sprites[num].x < (240-16))
                sprites[num].x += 1;

            //checking if the sprite is above the ground or below.
            if(sprites[num].y <= 8){
                //animation for the sprite above the ground.
                if(sprites[num].activeFrame == 0){
                    sprites[num].activeFrame = 1;
                }else{
                    sprites[num].activeFrame = 0;
                }
            }
            else
            {
                //animation for sprite below the ground.
                if(sprites[num].activeFrame == 2){
                    sprites[num].activeFrame = 3;
                }else{
                    sprites[num].activeFrame = 2;
                }
            }
        }
        
        //adding gravity to the sprite once it is in the air.
        if(keyIsUp(BUTTON_UP) && sprites[num].y < 8)
        {
            if(sprites[num].y != 8)
                sprites[num].y += 4;
            if(sprites[num].y == 8)
                sprites[num].activeFrame = 0;
        }
    }
    else if(sprites[num].alive == 0)
    {
        if(sprites[num].activeFrame == 10){
            sprites[num].activeFrame = 11;
        }else if(sprites[num].activeFrame == 11){
            drawGameOver();
        }else{
            sprites[num].activeFrame = 10;
        }
    }
    updateSprite(num);
}



