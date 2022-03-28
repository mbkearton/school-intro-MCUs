//  svc_keypad.c --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

int i = 0;  // counter used to track passes through each column per row

extern int keypad_row_mask;
extern int keypad_col_mask;
extern int svc_keypad_state;
extern int KEY_PRESSED;

extern int keypad_input_pin(void);

void svc_keypad(void)
{
    switch (svc_keypad_state)
    {
        case 0:
            

            if (keypad_input_pin() == 0)
            {
                svc_keypad_state = 1;
            }
            else if (keypad_row_mask != 0x8)
            {
                keypad_row_mask = keypad_row_mask << 1;
            }
            else
            {
                keypad_row_mask = 1;
            }
            
            
            if (i < 4)
            {                
                ++i;
            }
            else
            {
                if (svc_keypad_state == 0 && keypad_col_mask == 0x8)
                {
                    keypad_col_mask = 1;
                }
                else if (svc_keypad_state == 0)
                {
                    keypad_col_mask = keypad_col_mask << 1;
                }
                
                i = 0;
            }
            
            // falls through and repeats state 0(zero)
            break;
            
        case 1:
            if (keypad_input_pin() == 0)
            {
                KEY_PRESSED = 1;
                svc_keypad_state = 2;
            }
            else
            {
                svc_keypad_state = 0;
            }
                
            break;
        case 2:
            if (keypad_input_pin() == 1)
            {
                svc_keypad_state = 3;                
            }
            // falls through and repeats state 2
            break;
        case 3:
            if (keypad_input_pin() == 1)
            {
                KEY_PRESSED = 0;
                svc_keypad_state = 0;
            }
            else
            {
                svc_keypad_state = 2;
            }
            break;
        default:
            while(1);
    }
}