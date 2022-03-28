//  keypad.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>
    
.global keypad_input_pin
    
.ent keypad_input_pin
keypad_input_pin:
    addiu sp, sp, -20
    sw ra, 16(sp)
    sw fp, 12(sp)
    addu fp, sp, zero
    sw s2, 8(fp)
    sw s1, 4(fp)
    sw s0, 0(fp)

    // energizing single row w/mask
    la s0, keypad_row_mask
    lw s1, 0(s0)
    la s0, LATDCLR
    sw s1, 0(s0)
    
    // capturing RB3, RB1, RB0
    la s0, PORTB
    lw s1, 0(s0)
    andi s1, s1, 0xb
    
    // capturing RG9
    la s0, PORTG
    lw s2, 0(s0)
    andi s0, s2, 0x200
    
    // shifting RG9 right, bitwise-OR w/ capture PORTB values
    li a0, 0x7
    srlv s0, s0, a0
    or s0, s0, s1
    
    // final composite w/columns mask
    la s2, keypad_col_mask
    lw s1, 0(s2)
    and v0, s0, s1
    
    // determining return value
    beqz v0, key_in_done
    nop
    li v0, 0x1
    
key_in_done:
    la s0, LATDSET
    li s1, 0xf
    sw s1, 0(s0)
    
    lw s2, 8(fp)
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 16(sp)
    lw fp, 12(sp)
    addiu sp, sp, 20
    jr ra
    nop
.end keypad_input_pin
