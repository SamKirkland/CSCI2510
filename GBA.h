#include "background.h"

///////////////////////////////////////////////////////////////////////////////////////////GameState & bool defines

void Initialize()
{
    GameState = STATE_TITLESCREEN;
    initSprites();
	initbackgrounds();
	initShop();
	initTitle();
}

void LoadContent()
{
   switch(GameState){
        case STATE_TITLESCREEN:
            //load the title screen
            
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
            break;
   }
}

void Update()
{
	keyPoll();
	WaitVBlank();
	
    switch(GameState){
        case STATE_TITLESCREEN:
            SetMode(3 | BG2_ENABLE);
            updateTitle();
            
            break;
        case STATE_INGAME:
            SetMode(0 | BG0_ENABLE | BG1_ENABLE | OBJ_ENABLE | OBJ_MAP_1D);
            if(setGame == 0) {
    	        loadBackground();
                loadSprite();
                setGame = 1;
            }
            drawBackground();
            PlaySprite(0);
            if((keyIsDown(BUTTON_SELECT) && keyWasUp(BUTTON_SELECT))){
                GameState = STATE_MENU;
                setGame = 0;
            }
            
            int i = 50000;
            while (i > 0) { i--; }
            
            break;
        case STATE_MENU:
            SetMode(3 | BG2_ENABLE);
            updateShop();
            break;
        case STATE_GAMEOVERWIN:
            //game over win content.
            break;
        case STATE_GAMEOVERLOSE:
            updateGameOver();
            break;
        default:
            //the end
            break;
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
			drawShop();
            break;
        case STATE_GAMEOVERWIN:
            //gameover win content.
            break;
        case STATE_GAMEOVERLOSE:
            drawGameOver();
            
            break;
        default:
            //the end;
            break;
    }
}
