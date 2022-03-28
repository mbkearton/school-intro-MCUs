//  main.S --
//
//  Michael Kearton
//  May 2021
    
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
    
    jal gpio_config
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
    