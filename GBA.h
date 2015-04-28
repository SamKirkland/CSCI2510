#include "sprite.h"

///////////////////////////////////////////////////////////////////////////////////////////GameState & bool defines
int GameState;
#define STATE_TITLESCREEN 0
#define STATE_INGAME 1
#define STATE_MENU 2
#define STATE_GAMEOVERWIN 3
#define STATE_GAMEOVERLOSE 4
#define bool int
#define true 1
#define false 0

void Initialize()
{
    GameState = STATE_INGAME;
    initSprites();
	initbackgrounds();
}

void LoadContent()
{
   switch(GameState){
        case STATE_TITLESCREEN:
            loadTitle();
            
            break;
        case STATE_INGAME:
            loadBackground();
            loadSprite();
            
            break;
        case STATE_MENU:
            //menu or shop content
            
            break;
        case STATE_GAMEOVERWIN:
            //game over win content
            
            break;
        case STATE_GAMEOVERLOSE:
            //game over lose content
            
            break;
        default:
            //the end;
   }
}

void Update()
{
    switch(GameState){
        case STATE_TITLESCREEN:
            SetMode(4 | BG0_ENABLE);
            updateTitle();
            
            break;
        case STATE_INGAME:
            SetMode(0 | BG0_ENABLE | BG1_ENABLE | OBJ_ENABLE | OBJ_MAP_1D);
            drawBackground();
            PlaySprite(0);
            
            break;
        case STATE_MENU:
            //menu or shop content
            
            break;
        case STATE_GAMEOVERWIN:
            updateInventory();
            
            break;
        case STATE_GAMEOVERLOSE:
            updateGameOver();
            
            break;
        default:
            //the end
    }
}

void Draw()
{
    WaitVBlank();
    switch(GameState){
        case STATE_TITLESCREEN:
            drawTitle();
            
            break;
        case STATE_INGAME:
            WaitVBlank();
            UpdateSpriteMemory();
            
            break;
        case STATE_MENU:
            //menu or shop content
            
            break;
        case STATE_GAMEOVERWIN:
            drawInventory();
            
            break;
        case STATE_GAMEOVERLOSE:
            drawGameOver();
            
            break;
        default:
            //the end;
    }
}
