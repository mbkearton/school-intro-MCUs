//  data.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>
	
// Used in main.S and app_heartbeat.S
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

.data
    FLAG_10MS:		.word	0
    heartbeat_state:	.word	0
    heartbeat_count:	.word	0
    lcd_test_state:	.word	0
    lcd_test_count:	.word	0
    clock_second:	.word	58
    clock_minute:	.word	59
    clock_hour:	.word	12
    clock_count:	.word	0
    clock_state:	.word	0
    TIME_INIT:		.asciiz "Time:  12:59:58"

    
.text
    LCD_TEST_LINE1:	.asciiz "This is line 1"
    LCD_TEST_LINE2:	.asciiz "This is line 2"
    
    //TIME_INIT:		.asciiz "Time:  10:10:45"