//  app_test_timer32.c --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

extern int app_timer32_state;
extern int KEY_PRESSED;

extern  int     FLASHER;

void isr_timer32(void);

void app_test_timer32(void)
{
    switch (app_timer32_state)
    {
        case 0:
            if (KEY_PRESSED)
            {
                FLASHER = 1;
                IFS0 |= 0x1000;
                app_timer32_state = 1;
            }
            // falls through and repeats state 0(zero)
            break;
        case 1:
            if (!KEY_PRESSED)
            {
                FLASHER = 0;
                app_timer32_state = 0;
            }
            // falls through and repeats state 1
            break;
        default:
            while(1);
    }
    // process state code for each state
}