typedef unsigned short u16;
typedef signed int s32;

#include "scr.h"
#include "title.h"
#include "playerSprite.h"

int stotal = sprite_WIDTH*sprite_HEIGHT/2;
void updateSprite();

//This methods updates the sprite memory as soon as the changes are made.
void UpdateSpriteMemory() {
    int n;
    unsigned short* temp;
    temp = (unsigned short*)gamesprites;
    for (n = 0; n < 128*4; n++) {
        SpriteMem[n] = temp[n];
    }
}

//This method sets the player attributes to the player struct.
void setSpriteInfo(int num) {
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
    sprites[num].aboveground = true;
    sprites[num].rightanim = false;
    sprites[num].belowground = false;
    sprites[num].leftanim = false;
    sprites[num].hullType = 4;
    sprites[num].engineType = 4;
    sprites[num].Movespeed = 1;
    sprites[num].drillType = 4;
    sprites[num].tankType = 4;
    sprites[num].money = 0;
    sprites[num].gasLevel = 20;
    sprites[num].activeFrame = 0;
}

//This methods copies the sprite pallete to the memory.
void CopySpritePal() {
    int n;
	for (n = 0; n < 256; n++) {
		SpritePal[n] = spritePalette[n];
	}
}

//this method copies the sprite data to the memory.
void CopySpriteData() {
    int n;
	for (n = 0; n < stotal; n++) {
		SpriteData[n] = spriteData[n];
    }
}

//Methods to initialize the player sprite.
void initSprites() {
    int n;
    for(n = 0; n < 128; n++) {
        setSpriteInfo(n);
		gamesprites[n].attribute0 = 160; //using copy of OAM
		gamesprites[n].attribute1 = 240;
		gamesprites[n].attribute2 = 0;
	}

    //declaring the x and y for the sprites.
    sprites[0].x = 0;
    sprites[0].y = 70;
}

//Method to load the player sprites.
void loadSprite() {
    //copying the sprite data to the memory.
    CopySpritePal();
    CopySpriteData();
    //updating the position and the animation of the sprite.
    updateSprite(0);
}

//method used to flip the sprites that the player has.
void flipSprite(int flip, int num) {
    if (flip == 0) {
        gamesprites[num].attribute1 = gamesprites[num].attribute1 | 0x1000;
    }
    else if (flip == 1) {
        gamesprites[num].attribute1 = gamesprites[num].attribute1 & -0x1111;
        gamesprites[num].attribute1 = gamesprites[num].attribute1 | 0x1000;
        gamesprites[num].attribute1 = gamesprites[num].attribute1 & -0x1111;
    }
    else if (flip == 2);
    else if (flip == 3);
}

//The methods for the rotatoin of the player sprites.
void RotateSprite(int rotDataIndex, s32 angle, s32 x_scale, s32 y_scale) {
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

//update Sprite each time the player moves.
void updateSprite(int num) {
    gamesprites[num].attribute0 = COLOR_256 | SQUARE | sprites[num].y;
    gamesprites[num].attribute1 = SIZE_16 | sprites[num].x;
    gamesprites[num].attribute2 = sprites[num].currentFrame[sprites[num].activeFrame];
}

//setter method to set the health of the player.
void setHealth(int health, int num) {
	sprites[num].health = health;
}

//setter method to set the life state of the player.
void setAlive(int num, int life) {
    sprites[num].alive = life;
}

//setter method to set the gas of the player.
void setGas(int num, int gas) {
    sprites[num].gasLevel = gas;
}

//setter method to set the money of the player.
void setMoney(int num, int money) {
    sprites[num].money = money;
}

//setter method to set the drill of the player.
void setDrill(int num, int drill) {
    sprites[num].drillType = drill;
}

//setter method to set the speed of the player.
void setSpeed(int num, int speed) {
    sprites[num].Movespeed = speed;
}

//setter method to set the engine of the player.
void setEngine(int num, int Engine) {
    sprites[num].engineType = Engine;
}

//setter method to set the tank of the player.
void setTank(int num, int tank) {
    sprites[num].tankType = tank;
}

//setter method to set the hull of the player.
void setHull(int num, int hull) {
    sprites[num].hullType = hull;
}

///The methods for the player movement across the screen. Little details added.
void PlaySprite(int num) {
    if (sprites[num].alive == 1) {
        if (keyHeld(BUTTON_UP)) {
            /*
            if (sprites[num].y > 0) {
                sprites[num].y -= 1;
            }
            */
            if (sprites[num].activeFrame == 11) {
                sprites[num].activeFrame = 12;
            }
            else {
                sprites[num].activeFrame = 11;
            }
        }


        if (keyHeld(BUTTON_DOWN)) {
            /*
            if (sprites[num].y < (160-16)) {
                sprites[num].y += 1;
            }
            */

            if (sprites[num].activeFrame == 6) {
                sprites[num].activeFrame = 7;
            }
            else {
                sprites[num].activeFrame = 6;
            }
        }

        if(keyIsUp(BUTTON_UP) && keyIsUp(BUTTON_DOWN)){
            if (sprites[num].leftanim == true) {
                /*
                if (sprites[num].x > 0) {
                    sprites[num].x -= 1;
                }
                */
                if (sprites[num].aboveground == true){
                    //setting the animation for the movement above the ground.
                    if (sprites[num].activeFrame == 0) {
                        sprites[num].activeFrame = 1;
                    }
                    else {
                        sprites[num].activeFrame = 0;
                    }
                }
                else if(sprites[num].belowground == true){
                    //setting the animation for the movement under the ground
                    if (sprites[num].activeFrame == 4) {
                        sprites[num].activeFrame = 5;
                    }
                    else {
                        sprites[num].activeFrame = 4;
                    }
                }
            }

            if (sprites[num].rightanim == true) {
                //setting the x value for the movement to right.
                /*
                if (sprites[num].x < (240-16)) {
                    sprites[num].x += 1;
                }
                */

                //checking if the sprite is above the ground or below.
                if (sprites[num].aboveground == true) {
                    //animation for the sprite above the ground.
                    if (sprites[num].activeFrame == 0) {
                        sprites[num].activeFrame = 1;
                    }
                    else {
                        sprites[num].activeFrame = 0;
                    }
                }
                else if(sprites[num].belowground == true){
                    //animation for sprite below the ground.
                    if (sprites[num].activeFrame == 2) {
                        sprites[num].activeFrame = 3;
                    }
                    else {
                        sprites[num].activeFrame = 2;
                    }
                }
            }
        }

        //adding gravity to the sprite once it is in the air.
        if (keyIsUp(BUTTON_UP) && sprites[num].y < 30) {
            if (sprites[num].y != 30) {
                sprites[num].y += 4;
                sprites[num].activeFrame = 0;
            }
        }
    }
    else if(sprites[num].alive == 0) {
        if (sprites[num].activeFrame == 10) {
            sprites[num].activeFrame = 11;
        }
        else if (sprites[num].activeFrame == 11) {
            drawGameOver();
        }
        else {
            sprites[num].activeFrame = 10;
        }
    }
    updateSprite(num);
}


