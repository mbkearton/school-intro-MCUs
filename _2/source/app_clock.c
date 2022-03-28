//  app_clock.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

#define LCD_CMD         0
#define LCD_DATA        1
#define LCD_CLEAR_CMD   0x01
#define	DATA_ADDR_COMM	0x80
#define FIELD_HOURS     0x07
#define FIELD_MINUTES   0x0a
#define FIELD_SECONDS   0x0d

// variable declarations
extern  int clock_state;
extern  int clock_count;
extern  int clock_hour;
extern  int clock_minute;
extern  int clock_second;

extern char TIME_INIT[];
// function prototype declarations
extern  void    lcd_wait_for_not_busy(void);
extern  void    lcd_write(int RS_SEL, int CMD_ADDR);
extern  void    lcd_write_string(char LCD_BUFFER[]);

void clock_field_to_lcdstr(int clockfield, int field_type);

void app_clock(void)
{
    if (clock_count < 100)
    {
        clock_count++;
    }
    else
    {
        clock_count = 1;
    }
    
    switch (clock_state)
    {
        case 0: // "base" state; counting seconds
            if (clock_count == 100)
            {
                if (clock_second < 59)
                {
                    ++clock_second;
                    clock_state = 1; // update seconds
                }
                else if (clock_minute < 59)
                {
                    clock_second = 0;
                    ++clock_minute;
                    clock_state = 2; // update minutes
                }
                else
                {
                    clock_second = 0;
                    clock_minute = 0;
                    if (clock_hour < 12)
                    {
                        ++clock_hour;
                    }
                    else
                    {
                        clock_hour = 1;
                    }
                    clock_state = 3; // update hours
                }
            }
            break;
        case 1: // updating seconds
            if (clock_count == 100)
            {
                clock_field_to_lcdstr(clock_second, FIELD_SECONDS);
                
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | FIELD_SECONDS);
                lcd_wait_for_not_busy();
                lcd_write(LCD_DATA, TIME_INIT[FIELD_SECONDS]);
                
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | FIELD_SECONDS + 1);
                lcd_wait_for_not_busy();
                lcd_write(LCD_DATA, TIME_INIT[FIELD_SECONDS + 1]);
                
                clock_state = 0;
            }
            break;
        case 2: // updating minutes
            if (clock_count == 100)
            {
                clock_field_to_lcdstr(clock_minute, FIELD_MINUTES);
                
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | FIELD_MINUTES);
                lcd_wait_for_not_busy();
                lcd_write(LCD_DATA, TIME_INIT[FIELD_MINUTES]);
                
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | FIELD_MINUTES + 1);
                lcd_wait_for_not_busy();
                lcd_write(LCD_DATA, TIME_INIT[FIELD_MINUTES + 1]);
                
                clock_state = 1;
            }
            break;
        case 3: // updating hours
            if (clock_count == 100)
            {
                clock_field_to_lcdstr(clock_hour, FIELD_HOURS);
                
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | FIELD_HOURS);
                lcd_wait_for_not_busy();
                lcd_write(LCD_DATA, TIME_INIT[FIELD_HOURS]);
                
                lcd_wait_for_not_busy();
                lcd_write(LCD_CMD, DATA_ADDR_COMM | FIELD_HOURS + 1);
                lcd_wait_for_not_busy();
                lcd_write(LCD_DATA, TIME_INIT[FIELD_HOURS + 1]);
                
                clock_state = 2;
            }
            break;
        default:
            while(1);
    }
}

void lcd_time_init(void)    // called once during configuration
{   
    lcd_wait_for_not_busy();
    lcd_write(LCD_CMD, 0x00);
    lcd_write_string(TIME_INIT);
}

void clock_field_to_lcdstr(int clockfield, int field_type)
{
    if (field_type == FIELD_HOURS && clockfield < 10)
    {
        TIME_INIT[field_type] = ' ';
    }
    else
    {
        TIME_INIT[field_type] = (clockfield / 10) + 0x30;
    }
    TIME_INIT[field_type + 1] = (clockfield % 10) + 0x30;
}