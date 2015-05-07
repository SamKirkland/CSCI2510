#include "shopmenu.h"
#include "global.h"
#include "titlemenu.h"
#include "gasmenu.h"
#include "black.h"
#include "gameover.h"
#include "win.h"

int shopInit;
int titleInit;
int gasInit;
int gasIndex;
int shopIndex;
int leftx;
int rightx;
int topy;
int boty;
int randseed;
int randcounter;
int maxgas;
int gameoverInit;
int winInit;

void drawTitle()
{
    if(titleInit == 0){
		SetMode(3 | BG2_ENABLE);
		DMAFastCopy((void*)titlemenu_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
		titleInit = 1;
    }
}

void updateTitle()
{
    randcounter++;
	if(keyIsDown(BUTTON_A) && keyWasUp(BUTTON_A)){
		randseed = randcounter;
		srand(randseed);
		DMAFastCopy((void*)black_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
		Print(8, 8, "Instructions:", RGB(31, 31, 31));
		Print(8, 28, "Move your character with the", RGB(31, 31, 31));
		Print(8, 38, "D-Pad.", RGB(31, 31, 31));
		Print(8, 58, "Enter the shop and gas", RGB(31, 31, 31));
		Print(8, 68, "station with A.", RGB(31, 31, 31));
		Print(8, 88, "Don't run out of gas or", RGB(31, 31, 31));
		Print(8, 98, "you'll explode!", RGB(31, 31, 31));
		Print(8, 118, "Reach the finish line at the", RGB(31, 31, 31));
		Print(8, 128, "bottom to win!", RGB(31, 31, 31));
		Print(8, 148, "Press Start to continue.", RGB(31, 31, 31));
	}
	if(keyIsDown(BUTTON_START) && keyWasUp(BUTTON_START)){
		GameState = STATE_INGAME;
		titleInit = 0;
	}
}

void initTitle()
{
    titleInit = 0;
	randseed = 0;
	randcounter = 0;
}

void initShop()
{
    shopInit = 0;
	shopIndex = 0;
}

void initGas()
{
	gasInit = 0;
	gasIndex = 0;
	maxgas = 20;
}

void drawShop()
{
            leftx = (32 * (shopIndex % 4 + 1)) - 1;
			topy = 32 * (shopIndex / 4 + 1) - 1;
			rightx = (32 * (shopIndex % 4 + 1)) + 16;
			boty = 32 * (shopIndex / 4 + 1) + 16;
			
			DrawLine3(leftx, topy, rightx, topy, RGB(20, 0, 0));
			DrawLine3(leftx, boty, rightx + 1, boty, RGB(20, 0, 0));
			DrawLine3(leftx, topy, leftx, boty, RGB(20, 0, 0));
			DrawLine3(rightx, topy, rightx, boty, RGB(20, 0, 0));
			
			
			switch(shopIndex){
				case 0:
					Print(168, 16, "Iron", RGB(27, 13, 0));
					Print(168, 26, "Drill", RGB(27, 13, 0));
					Print(168, 70, "$500", RGB(31, 28, 0));
				break;
				case 1:
					Print(168, 16, "Small", RGB(27, 13, 0));
					Print(168, 26, "Tank", RGB(27, 13, 0));
					Print(168, 70, "$300", RGB(31, 28, 0));
				break;
				case 2:
					Print(168, 16, "Weak", RGB(27, 13, 0));
					Print(168, 26, "Hull", RGB(27, 13, 0));
					Print(168, 70, "$300", RGB(31, 28, 0));
				break;
				case 3:
					Print(168, 16, "Compact", RGB(27, 13, 0));
					Print(168, 26, "Engine", RGB(27, 13, 0));
					Print(168, 70, "$250", RGB(31, 28, 0));
				break;
				case 4:
					Print(168, 16, "Emerald", RGB(27, 13, 0));
					Print(168, 26, "Drill", RGB(27, 13, 0));
					Print(168, 70, "$2000", RGB(31, 28, 0));
				break;
				case 5:
					Print(168, 16, "Double", RGB(27, 13, 0));
					Print(168, 26, "Tank", RGB(27, 13, 0));
					Print(168, 70, "$1500", RGB(31, 28, 0));
				break;
				case 6:
					Print(168, 16, "Sturdy", RGB(27, 13, 0));
					Print(168, 26, "Hull", RGB(27, 13, 0));
					Print(168, 70, "$1250", RGB(31, 28, 0));
				break;
				case 7:
					Print(168, 16, "Basic", RGB(27, 13, 0));
					Print(168, 26, "Engine", RGB(27, 13, 0));
					Print(168, 70, "$1250", RGB(31, 28, 0));
				break;
				case 8:
					Print(168, 16, "Titanium", RGB(27, 13, 0));
					Print(168, 26, "Drill", RGB(27, 13, 0));
					Print(168, 70, "$5000", RGB(31, 28, 0));
				break;
				case 9:
					Print(168, 16, "Mega", RGB(27, 13, 0));
					Print(168, 26, "Tank", RGB(27, 13, 0));
					Print(168, 70, "$4000", RGB(31, 28, 0));
				break;
				case 10:
					Print(168, 16, "Robust", RGB(27, 13, 0));
					Print(168, 26, "Hull", RGB(27, 13, 0));
					Print(168, 70, "$2500", RGB(31, 28, 0));
				break;
				case 11:
					Print(168, 16, "Rigid", RGB(27, 13, 0));
					Print(168, 26, "Engine", RGB(27, 13, 0));
					Print(168, 70, "$2800", RGB(31, 28, 0));
				break;
				case 12:
					Print(168, 16, "Diamond", RGB(27, 13, 0));
					Print(168, 26, "Drill", RGB(27, 13, 0));
					Print(168, 70, "$12000", RGB(31, 28, 0));
				break;
				case 13:
					Print(168, 16, "Giga", RGB(27, 13, 0));
					Print(168, 26, "Tank", RGB(27, 13, 0));
					Print(168, 70, "$10000", RGB(31, 28, 0));
				break;
				case 14:
					Print(168, 16, "Grand", RGB(27, 13, 0));
					Print(168, 26, "Hull", RGB(27, 13, 0));
					Print(168, 70, "$8500", RGB(31, 28, 0));
				break;
				case 15:
					Print(168, 16, "Flawless", RGB(27, 13, 0));
					Print(168, 26, "Engine", RGB(27, 13, 0));
					Print(168, 70, "$9000", RGB(31, 28, 0));
				break;
			}
}

void updateShop()
{
    if (shopInit == 0){
				/*for (y = 0; y < 160; y++){
					for (x = 0; x < 240; x++){
						videoBuffer[y * 240 + x] = shopmenu_Bitmap[y * 240 + x];
					}
				}*/
				
				DMAFastCopy((void*)shopmenu_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
				
				cashToString(sprites[0].money);
				Print(85, 4, "Upgrades", RGB(27, 13, 0));
				Print(8, 8, "$", RGB(5, 31, 5));
				Print(16, 8, moneybuffer, RGB(5, 31, 5));
				Print(166, 98, "A = Buy", RGB(0, 14, 7));
				Print(166, 110, "B = Exit", RGB(0, 14, 7));
				shopInit = 1;
			}
			if(keyIsDown(BUTTON_RIGHT) && keyWasUp(BUTTON_RIGHT)){
				if(shopIndex % 4 != 3){
					shopIndex++;
					ClearSelection();
					DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
				}
			}
			if(keyIsDown(BUTTON_LEFT) && keyWasUp(BUTTON_LEFT)){
				if(shopIndex % 4 != 0){
					shopIndex--;
					ClearSelection();
					DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
				}
			}
			if(keyIsDown(BUTTON_UP) && keyWasUp(BUTTON_UP)){
				if(shopIndex / 4 > 0){
					shopIndex -= 4 ;
					ClearSelection();
					DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
				}
			}
			if(keyIsDown(BUTTON_DOWN) && keyWasUp(BUTTON_DOWN)){
				if(shopIndex / 4 != 3){
					shopIndex += 4;
					ClearSelection();
					DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
				}
			}
			if(keyIsDown(BUTTON_B) && keyWasUp(BUTTON_B)){
			    shopInit = 0;
				GameState = STATE_INGAME;
				setGame = 2; // used so the background can be loaded from its last position
			}
			//CHEAT CODE FOR DEMO PURPOSES L + R + SELECT + START = FULL UPGRADES
			if(keyIsDown(BUTTON_L) && keyIsDown(BUTTON_R) && keyIsDown(BUTTON_SELECT) && keyIsDown(BUTTON_START)){
				sprites[0].drillType = 0;
				sprites[0].tankType = 0;
				sprites[0].hullType = 0;
				sprites[0].engineType = 0;
				sprites[0].gasLevel = 50000;
				sprites[0].money = 133337;
				DrawBox3(16, 8, 68, 16, RGB(20, 20, 20));
				cashToString(sprites[0].money);
				Print(16, 8, moneybuffer, RGB(5, 31, 5));
			}
			if(keyIsDown(BUTTON_A && keyWasUp(BUTTON_A))){
				switch(shopIndex){
					case 0:
						if(sprites[0].money >= 500){
							sprites[0].drillType = 3;
							sprites[0].money -= 500;
						}
					break;
					case 1:
						if(sprites[0].money >= 300){
							sprites[0].tankType = 3;
							sprites[0].money -= 300;
							sprites[0].gasLevel = 40;
						}
					break;
					case 2:
						if(sprites[0].money >= 300){
							sprites[0].hullType = 3;
							sprites[0].money -= 300;
						}
					break;
					case 3:
						if(sprites[0].money >= 250){
							sprites[0].engineType = 3;
							sprites[0].money -= 250;
						}
					break;
					case 4:
						if(sprites[0].money >= 2000){
							sprites[0].drillType = 2;
							sprites[0].money -= 2000;
						}
					break;
					case 5:
						if(sprites[0].money >= 1500){
							sprites[0].tankType = 2;
							sprites[0].money -= 1500;
							sprites[0].gasLevel = 60;
						}
					break;
					case 6:
						if(sprites[0].money >= 1250){
							sprites[0].hullType = 2;
							sprites[0].money -= 1250;
						}
					break;
					case 7:
						if(sprites[0].money >= 1250){
							sprites[0].engineType = 2;
							sprites[0].money -= 1250;
						}
					break;
					case 8:
						if(sprites[0].money >= 5000){
							sprites[0].drillType = 1;
							sprites[0].money -= 5000;
						}
					break;
					case 9:
						if(sprites[0].money >= 4000){
							sprites[0].tankType = 1;
							sprites[0].money -= 4000;
							sprites[0].gasLevel = 80;
						}
					break;
					case 10:
						if(sprites[0].money >= 2500){
							sprites[0].hullType = 1;
							sprites[0].money -= 2500;
						}			
					break;
					case 11:				
						if(sprites[0].money >= 2800){
							sprites[0].engineType = 1;
							sprites[0].money -= 2800;
						}
					break;
					case 12: 				
						if(sprites[0].money >= 12000){
							sprites[0].drillType = 0;
							sprites[0].money -= 12000;
						}
					break;
					case 13: 				
						if(sprites[0].money >= 10000){
							sprites[0].tankType = 0;
							sprites[0].money -= 10000;
							sprites[0].gasLevel = 99;
						}
					break;
					case 14: 				
						if(sprites[0].money >= 8500){
							sprites[0].hullType = 0;
							sprites[0].money -= 8500;
						}
					break;
					case 15: 	
						if(sprites[0].money >= 9000){
							sprites[0].engineType = 0;
							sprites[0].money -= 9000;
						}
					break;
				}
				DrawBox3(16, 8, 68, 16, RGB(20, 20, 20));
				cashToString(sprites[0].money);
				Print(16, 8, moneybuffer, RGB(5, 31, 5));
			}
}

void initGameOver()
{
    gameoverInit = 0;
}

void drawGameOver()
{
	if(gameoverInit == 0){
		SetMode(3 | BG2_ENABLE);
		DMAFastCopy((void*)gameover_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
		Print (82, 120, "GAME OVER!", RGB(31, 0, 0));
		gameoverInit = 1;
	}
}

void updateGameOver()
{
    /*
    // start a new game
	if(keyIsDown(BUTTON_A) && keyWasUp(BUTTON_A)){		
		GameState = STATE_TITLESCREEN;
	}
	*/
}

void initWin()
{
	winInit = 0;
}

void drawWin()
{
	if(winInit  == 0){
		SetMode(3 | BG2_ENABLE);
		DMAFastCopy((void*)win_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
		Print(90, 16, "YOU WIN!", RGB(31, 31, 31));
		winInit = 1;
	}
}


void updateWin()
{
	if(keyIsDown(BUTTON_A) && keyWasUp(BUTTON_A)){
		DMAFastCopy((void*)black_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
		Print(90, 4, "Credits", RGB(31, 31, 31));
		Print(8, 20, "Sam Kirkland", RGB(31, 24, 0));
		Print(24, 30, "Map / Background Generation", RGB(31, 31, 31));
		Print(24, 40, "Movement / Hit Detection", RGB(31, 31, 31));
		Print(24, 50, "HUD, Game Logic", RGB(31, 31, 31));
		Print(8, 66, "Nikhit Adusumilli", RGB(31, 24, 0));
		Print(24, 76, "Sprites and OAM", RGB(31, 31, 31));
		Print(24, 86, "Music and Sound", RGB(31, 31, 31));
		Print(8, 102, "Jared Trimm", RGB(31, 24, 0));
		Print (24, 112, "Bitmap Modes and Font", RGB(31, 31, 31));
		Print(24, 122, "Shop Logic and Graphics", RGB(31, 31, 31));
		Print(8, 138, "Grant Norenberg", RGB(31, 24, 0));
		Print(24, 148, "Additional Graphics", RGB(31, 31, 31));
	}
}



void drawGas()
{	
	if(keyIsDown(BUTTON_RIGHT) && keyWasUp(BUTTON_RIGHT)){
		if(gasIndex == 0){ gasIndex = 1;}
		else if (gasIndex == 2){ gasIndex = 3;}
		else {}
		clearGas();
		DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
	}
	if(keyIsDown(BUTTON_LEFT) && keyWasUp(BUTTON_LEFT)){
		if(gasIndex == 1){ gasIndex = 0;}
		else if (gasIndex == 3){ gasIndex = 2;}
		else {}
		clearGas();
		DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
	}
	if(keyIsDown(BUTTON_UP) && keyWasUp(BUTTON_UP)){
		if(gasIndex == 4){ gasIndex = 3;}
		else if (gasIndex == 3){ gasIndex = 1;}
		else if (gasIndex == 2){ gasIndex = 0;}
		else {}
		clearGas();
		DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
	}
	if(keyIsDown(BUTTON_DOWN) && keyWasUp(BUTTON_DOWN)){
		if(gasIndex == 0){ gasIndex = 2;}
		else if (gasIndex == 1){ gasIndex = 3;}
		else if (gasIndex == 2){ gasIndex = 4;}
		else if (gasIndex == 3){ gasIndex = 4;}
		else {}
		clearGas();
		DrawBox3(164, 4, 236, 80, RGB(5, 5, 5));
	}
	
	switch(gasIndex){
		case 0:
			Print(168, 16, "Five", RGB(27, 13, 0));
			Print(168, 26, "Gallons", RGB(27, 13, 0));
			Print(168, 70, "$5", RGB(31, 28, 0));
			DrawLine3(37, 29, 82, 29, RGB(31, 0, 0));
			DrawLine3(37, 64, 83, 64, RGB(31, 0, 0));
			DrawLine3(37, 29, 37, 64, RGB(31, 0, 0));
			DrawLine3(82, 29, 82, 64, RGB(31, 0, 0));
		break;
		case 1:
			Print(168, 16, "Ten", RGB(27, 13, 0));
			Print(168, 26, "Gallons", RGB(27, 13, 0));
			Print(168, 70, "$10", RGB(31, 28, 0));
			DrawLine3(87, 29, 132, 29, RGB(31, 0, 0));
			DrawLine3(87, 64, 132, 64, RGB(31, 0, 0));
			DrawLine3(87, 29, 87, 64, RGB(31, 0, 0));
			DrawLine3(132, 29, 132, 64, RGB(31, 0, 0));
		break;
		case 2:
			Print(168, 16, "Twenty", RGB(27, 13, 0));
			Print(168, 26, "Gallons", RGB(27, 13, 0));
			Print(168, 70, "$20", RGB(31, 28, 0));
			DrawLine3(37, 69, 82, 69, RGB(31, 0, 0));
			DrawLine3(37, 104, 83, 104, RGB(31, 0, 0));
			DrawLine3(37, 69, 37, 104, RGB(31, 0, 0));
			DrawLine3(82, 69, 82, 104, RGB(31, 0, 0));
		break;
		case 3:
			Print(168, 16, "Fifty", RGB(27, 13, 0));
			Print(168, 26, "Gallons", RGB(27, 13, 0));
			Print(168, 70, "$50", RGB(31, 28, 0));
			DrawLine3(87, 69, 132, 69, RGB(31, 0, 0));
			DrawLine3(87, 104, 133, 104, RGB(31, 0, 0));
			DrawLine3(87, 69, 87, 104, RGB(31, 0, 0));
			DrawLine3(132, 69, 132, 104, RGB(31, 0, 0));
		break;
		case 4:
			Print(168, 16, "Fill", RGB(27, 13, 0));
			Print(168, 26, "Tank", RGB(27, 13, 0));
			Print(168, 70, "$", RGB(31, 28, 0));
			if(sprites[0].gasLevel < 100){cashToString(maxgas - sprites[0].gasLevel);}
			Print(176, 70, moneybuffer, RGB(31, 28, 0));
			DrawLine3(37, 109, 132, 109, RGB(31, 0, 0));
			DrawLine3(37, 130, 132, 130, RGB(31, 0, 0));
			DrawLine3(37, 109, 37, 130, RGB(31, 0, 0));
			DrawLine3(132, 109, 132, 130, RGB(31, 0, 0));
		break;
		default:
		break;
	}
}

void updateGas()
{	

	 if (gasInit == 0){				
		DMAFastCopy((void*)gasmenu_Bitmap, (void*)videoBuffer, 76800/4, DMA_32NOW);
		
		
		cashToString(sprites[0].money);
		Print(85, 4, "Natasco", RGB(27, 13, 0));
		Print(8, 8, "$", RGB(5, 31, 5));
		Print(16, 8, moneybuffer, RGB(5, 31, 5));
		Print(166, 98, "A = Buy", RGB(0, 14, 7));
		Print(166, 110, "B = Exit", RGB(0, 14, 7));
		Print(50, 44, "$5", RGB(31, 24, 0));
		Print(95, 44, "$10", RGB(31, 24, 0));
		Print(46, 84, "$20", RGB(31, 24, 0));
		Print(95, 84, "$50", RGB(31, 24, 0));
		Print(48, 117, "Fill Tank", RGB(31, 24, 0));
		
		clearGas();
		
		switch(sprites[0].tankType){
		case 0:
			maxgas = 99;
			break;
		case 1:
			maxgas = 80;
			break;
		case 2:
			maxgas = 60;
			break;
		case 3:
			maxgas = 40;
			break;
		default:
			maxgas = 20;
			break;
		}
		
		DrawBox3(166, 120, 208, 138, RGB(20, 20, 20));
		cashToString(sprites[0].gasLevel);
    	Print(166, 126, moneybuffer, RGB(31, 24, 0));
    	Print(182, 126, "/", RGB(31, 24, 0));
    	cashToString(maxgas);
    	Print(190, 126, moneybuffer, RGB(31, 24, 0));
		
		gasInit = 1;
	}

	if(keyIsDown(BUTTON_A && keyWasUp(BUTTON_A))){
		switch(gasIndex){
			case 0:
				if(sprites[0].money >= 5 && sprites[0].gasLevel + 5 >= maxgas){
					sprites[0].gasLevel = maxgas;
					sprites[0].money -= 5;
				} else if (sprites[0].money >= 5) {
					sprites[0].gasLevel += 5;
				} else {}
				break;
			case 1:
				if(sprites[0].money >= 10 && sprites[0].gasLevel + 10 >= maxgas){
					sprites[0].gasLevel = maxgas;
					sprites[0].money -= 10;
				} else if (sprites[0].money >= 10) {
					sprites[0].gasLevel += 10;
				} else {}
				break;
			case 2:
				if(sprites[0].money >= 20 && sprites[0].gasLevel + 20 >= maxgas){
					sprites[0].gasLevel = maxgas;
					sprites[0].money -= 20;
				} else if (sprites[0].money >= 20){
					sprites[0].gasLevel += 20;
				} else {}
				break;
			case 3:
				if(sprites[0].money >= 50 && sprites[0].gasLevel + 50 >= maxgas){
					sprites[0].gasLevel = maxgas;
					sprites[0].money -= 50;
				} else if (sprites[0].money >= 50){
					sprites[0].gasLevel += 50;
				} else {}
				break;
			case 4:
				if(sprites[0].money >= (maxgas - sprites[0].gasLevel)){
					sprites[0].money -= (maxgas - sprites[0].gasLevel);
					sprites[0].gasLevel = maxgas;
				}
			default:
			break;
		}
		DrawBox3(166, 120, 208, 138, RGB(20, 20, 20));
		cashToString(sprites[0].gasLevel);
    	Print(166, 126, moneybuffer, RGB(31, 24, 0));
    	Print(182, 126, "/", RGB(31, 24, 0));
    	cashToString(maxgas);
    	Print(190, 126, moneybuffer, RGB(31, 24, 0));
	
		DrawBox3(16, 8, 68, 16, RGB(20, 20, 20));
		cashToString(sprites[0].money);
		Print(8, 8, "$", RGB(5, 31, 5));
		Print(16, 8, moneybuffer, RGB(5, 31, 5));
	}
	if(keyIsDown(BUTTON_B) && keyWasUp(BUTTON_B)){
		gasInit = 0;
		GameState = STATE_INGAME;
		setGame = 2; // used so the background can be loaded from its last position
	}
}

