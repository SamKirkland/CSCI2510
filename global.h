/////////////////////////////////////////////////////////////////////////////////////////// Sprite defines
#define SpriteMem ((unsigned short*)0x7000000)
#define SpriteData ((unsigned short*)0x6010000)
unsigned short* SpriteData3 = SpriteData + 8192;
#define SpritePal ((unsigned short*)0x5000200)

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

// macro to change the video mode
#define SetMode(mode) REG_DISPCNT = (mode)

// create a pointer to the video buffer
unsigned short* FrontBuffer = (unsigned short*)0x6000000;
unsigned short* BackBuffer = (unsigned short*)0x600A000;
unsigned short* videoBuffer;
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
