//  app_app_test_keypad.c --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

#define LCD_CMD         0
#define LCD_DATA        1
#define LCD_CLEAR_CMD   0x01
#define	DATA_ADDR_COMM	0x80
#define ROW_INDEX       5
#define COL_INDEX       14

extern int app_test_keypad_state;
extern int KEY_PRESSED;
extern int keypad_row_mask;
extern int keypad_col_mask;

extern  char    LCD_BUFFER1[16];
extern  char    LCD_BUFFER2[16];

extern  void    lcd_wait_for_not_busy(void);
extern  void    lcd_write(int RS_SEL, int CMD_ADDR);
extern  void    lcd_write_string(char LCD_BUFFER[]);

void    row_col_to_lcdstr(int row_or_col, int field_type);

void app_test_keypad(void)
{
    switch (app_test_keypad_state)
    {
        case 0:
            if (KEY_PRESSED)
            {
                row_col_to_lcdstr(keypad_row_mask, ROW_INDEX);
                row_col_to_lcdstr(keypad_col_mask, COL_INDEX);
                
                lcd_wait_for_not_busy();  // << 10 ms
                lcd_write(LCD_CMD, DATA_ADDR_COMM | 0x40);  // << 10 ms
                lcd_write_string(LCD_BUFFER2);  // << 10 ms
                app_test_keypad_state = 1;
            }
            // falls through and repeats state 0(zero)
            break;
        case 1:
            if (!KEY_PRESSED)
            {
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | 0x40);
                lcd_write_string(LCD_BUFFER1);
                app_test_keypad_state = 0;
            }
            // falls through and repeats state 1
            break;
        default:
            while(1);
    }
    // process state code for each state
}

void lcd_keypad_init(void)    // called once during configuration
{   
    lcd_wait_for_not_busy();
    lcd_write(LCD_CMD, 0xc0);
    lcd_write_string(LCD_BUFFER1);
}

void row_col_to_lcdstr(int row_or_col, int field_type)
{
    int j = 0;
    
    while (row_or_col != 1)
    {
        row_or_col = row_or_col >> 1;
        ++j;
    }
    LCD_BUFFER2[field_type] = j + 0x30;
}