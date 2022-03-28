//  main.S --
//
//  Michael Kearton
//  August 2021

#include <xc.h>
.global main    
.data
    
.text
.set noreorder

.ent main
main:
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero
    
    jal waitstates_config
    nop
    
    jal intsys_config
    nop
    
    jal timer1_config
    nop
    
    jal timer32_config
    nop
    
    jal gpio_config
    nop
    
    jal lcd_config
    nop
    
    jal lcd_time_init
    nop
    
    jal lcd_keypad_init
    nop
    
while_loop:
awaiting_flag:
    la t1, FLAG_10MS
    lw t0, 0(t1)
    beq t0, zero, awaiting_flag
    nop
    
found_flag:
    la t1, FLAG_10MS
    sw zero, 0(t1)
    
heartbeat:
    jal app_heartbeat
    nop
lcd_control:
    jal app_clock
    nop
    
    jal app_test_keypad
    nop
    
    jal app_test_timer32
    nop
    
    jal svc_keypad
    nop
    
    j while_loop
    nop
    
done:
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
    jr ra
    nop
.end main
    