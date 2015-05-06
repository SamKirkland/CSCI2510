#include "background.h"

///////////////////////////////////////////////////////////////////////////////////////////GameState & bool defines

void Initialize()
{
    //GameState = STATE_INGAME;
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
		case STATE_GASSTATION:
			//gas station content
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
            // first load
            if(setGame == 0) {
    	        loadBackground();
                loadSprite();
                setGame = 1;
            }
            // loading from shop
            else if (setGame == 2) {
           	    DMAFastCopy((void*)map_Palette, (void*)BGPaletteMem, 256, DMA_16NOW); // copy palette into the background
                DMAFastCopy((void*)map_Tiles, (void*)CharBaseBlock(0), 12288/4, DMA_32NOW); // copy tiles into memory
                loadLastPosition();
                loadSprite();
                setGame = 1;
            }
            drawBackground();
            PlaySprite(0);
            //if((keyIsDown(BUTTON_SELECT) && keyWasUp(BUTTON_SELECT))){
            if(keyIsDown(BUTTON_SELECT)) {
                saveLastPosition();
                GameState = STATE_MENU;
                setGame = 1;
            }
 			if(keyIsDown(BUTTON_START)){
				saveLastPosition();
				GameState = STATE_GASSTATION;
				setGame = 1;
			}
            
            int i = 25000;
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
		case STATE_GASSTATION:
			SetMode(3 | BG2_ENABLE);
			updateGas();
			
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
		case STATE_GASSTATION:
			drawGas();
			
			break;
        default:
            //the end;
            break;
    }
}
