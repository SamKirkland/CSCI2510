#include "shopmenu.h"
#include "global.h"
#include "titlemenu.h"

int shopInit;
int titleInit;
int shopIndex;
int leftx;
int rightx;
int topy;
int boty;
int randseed;
int randcounter;
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
		titleInit = 0;
		GameState = STATE_INGAME;
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
				for (y = 0; y < 160; y++){
					for (x = 0; x < 240; x++){
						videoBuffer[y * 240 + x] = shopmenu_Bitmap[y * 240 + x];
					}
				}
				
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
			}
			//CHEAT CODE FOR DEMO PURPOSES L + R + SELECT + START = FULL UPGRADES
			if(keyIsDown(BUTTON_L) && keyIsDown(BUTTON_R) && keyIsDown(BUTTON_SELECT) && keyIsDown(BUTTON_START)){
				sprites[0].drillType = 0;
				sprites[0].tankType = 0;
				sprites[0].hullType = 0;
				sprites[0].engineType = 0;
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
    
}

void drawGameOver()
{
    
}

void updateGameOver()
{
    
}
