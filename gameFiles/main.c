#include "GBA.h"

int main(void)
{
   Initialize();
   LoadContent();
   while(true)
   {
       Update();
       Draw();
       if(randseed){
            /*int n = 30000;
            while (n > 0) { n--; }*/
       }
   }
   return 0;
}


