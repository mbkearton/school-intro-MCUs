//  data.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

// Lab 1
.global	FLAG_10MS
.global	heartbeat_state
.global	heartbeat_count
// Lab 2 -- Pt. 1
.global	lcd_test_state
.global	lcd_test_count
.global	LCD_TEST_LINE1
.global	LCD_TEST_LINE2
// Lab 2 -- Pt. 2
.global clock_second
.global clock_minute
.global clock_hour
.global clock_count
.global clock_state
.global TIME_INIT
// Lab 3
.global keypad_row_mask
.global keypad_col_mask
.global svc_keypad_state
.global KEY_PRESSED
.global app_test_keypad_state
.global LCD_BUFFER1
.global LCD_BUFFER2
// Lab 5
.global FLASHER
.global app_timer32_state

.data
    // Lab 1
    FLAG_10MS:			.word	0
    heartbeat_state:		.word	0
    heartbeat_count:		.word	0
    // Lab 2
    lcd_test_state:		.word	0
    lcd_test_count:		.word	0
    clock_second:		.word	45
    clock_minute:		.word	10
    clock_hour:		.word	10
    clock_count:		.word	0
    clock_state:		.word	0
    TIME_INIT:			.asciiz "Time:  10:10:45"
    // Lab 3
    keypad_row_mask:		.word	1
    keypad_col_mask:		.word	1
    svc_keypad_state:		.word	0
    KEY_PRESSED:		.word	0
    app_test_keypad_state:	.word	0
    LCD_BUFFER1:		.asciiz "No key pressed "
    LCD_BUFFER2:		.asciiz "ROW:   & COL:  "
    // Lab 5
    FLASHER:			.word	0
    app_timer32_state:	.word	0
    
.text
    LCD_TEST_LINE1:		.asciiz "This is line 1"
    LCD_TEST_LINE2:		.asciiz "This is line 2"