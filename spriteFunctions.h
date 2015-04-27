#include "scr.h"
#include "sprite.h"

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


unsigned short* bg0map =(unsigned short*)ScreenBaseBlock(31);


//video modes 3-5, OAMData starts at 0x6010000 + 8192
unsigned short* SpriteData3 = SpriteData + 8192;

typedef struct tagSprite
{
	unsigned short attribute0;
	unsigned short attribute1;
	unsigned short attribute2;
	unsigned short attribute3;
}Sprite,*pSprite;

Sprite gamesprites[128];


/////////////////////////////////////////////////////////////////////////////////////////////////macros method defines
int stotal = sprite_WIDTH*sprite_HEIGHT/2;
/*
void init()
{
    REG_BG0CNT = BG_COLOR256 | TEXTBG_SIZE_256x256 |(31 << SCREEN_SHIFT | 0 << CHAR_SHIFT);
    SetMode(0 | OBJ_ENABLE | OBJ_MAP_1D | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | BG3_ENABLE);
	initSprites();
}
*/

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




void drawTitle()
{

}

void updateTitle()
{

}

void loadTitle()
{

}

void drawInventory()
{

}

void updateInventory()
{

}

void drawGameOver()
{

}

void updateGameOver()
{

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




