#include "font.h"
#include "GBA.h"
#include "game.h"

int main(void)
{
    Initialize();
    LoadContent();
    while(1)
    {
       Update();
       Draw();
    }

    return 0;
}


/* END OF FILE */
