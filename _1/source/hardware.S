//  hardware.S --
//
//  Michael Kearton
//  May 2021
#include <xc.h>
    
.global waitstates_config
.global gpio_config

.ent waitstates_config
waitstates_config:
    //called function stack frame
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

set_waitstates:
    la s0, CHECONCLR    // Address of CHECON Clear register is held by t0
    li s1, 0x0000007    // Selection of first 3 CHECON bits is held by t1
    sw s1, 0(s0)        // Stores the slection in the Clear register to set '000' SYSCLK wait states

ws_done:
    //called function stack frame wind-up
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
    jr ra
    nop
.end waitstates_config


.ent gpio_config
gpio_config:
    //called function stack frame
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

set_ra7:
    la s0, LATACLR
    li s1, 0x0080
    sw s1, 0(s0)

    la s0, ODCACLR
    li s1, 0x0080
    sw s1, 0(s0)

    la s0, TRISACLR
    li s1, 0x0080
    sw s1, 0(s0)

gpio_done:
    //called function stack frame wind-up
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
    jr ra
    nop
.end gpio_config
