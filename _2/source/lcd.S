//  lcd.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

.global lcd_read
.global lcd_write
.global lcd_wait_for_not_busy
.global lcd_write_string
    
.ent lcd_read
lcd_read:
    // called function stack frame
    addiu sp, sp, -16
    sw ra, 12(sp)
    sw fp, 8(sp)
    addu fp, sp, zero
    sw s1, 4(fp)
    sw s0, 0(fp)
    
    // setting or clearing RS (register select)
    beqz a0, clear_RS_read
    nop
    la s0, LATBSET
    li s1, 0x8000
    sw s1, 0(s0)
    j set_read
    nop
clear_RS_read:
    la s0, LATBCLR
    li s1, 0x8000
    sw s1, 0(s0)
    
    // setting RW' (read) & E (enable)
set_read:
    la s0, LATDSET
    li s1, 0x0030
    sw s1, 0(s0)
    // nine (9) nop delays for enable pulse-wdith timing
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    // reading DB[7:0] (PORTE[7:0]) into v0 with byte mask -- 0xFF
    la s0, PORTE
    lw v0, 0(s0)
    andi v0, v0, 0xff
    
    // disabling LCD controller after completion of read
    la s0, LATDCLR
    li s1, 0x0010
    sw s1, 0(s0)
    
read_done:
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 12(sp)
    lw fp, 8(sp)
    addiu sp, sp, 16
    jr ra
    nop
.end lcd_read
    
    
.ent lcd_write
lcd_write:
    // called function stack frame
    addiu sp, sp, -32
    sw ra, 28(sp)
    sw fp, 24(sp)
    addu fp, sp, zero
    sw s1, 20(fp)
    sw s0, 16(fp)
    
   
    la s0, LATECLR // clearing RE[7:0] and then...
    li s1, 0x00ff
    sw s1, 0(s0)
    
    la s0, LATESET  // ...setting RE[7:0] with provided command or data value
    sw a1, 0(s0)
    
    beqz a0, clear_RS_write // setting or clearing RS (register select)
    nop
    la s0, LATBSET
    li s1, 0x8000
    sw s1, 0(s0)
    j clear_read
    nop
clear_RS_write:
    la s0, LATBCLR
    li s1, 0x8000
    sw s1, 0(s0)
    
clear_read:
    // clearing RW' (setting write)
    la s0, LATDCLR
    li s1, 0x0020
    sw s1, 0(s0)
    
    // setting (E)nable
    la s0, LATDSET
    li s1, 0x0010
    sw s1, 0(s0)
    
    // driving PORTE[7:0] pins to output
    la s0, TRISECLR
    li s1, 0x00ff
    sw s1, 0(s0)
    // nine (9) nop delays for enable pulse-wdith timing
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    // disabling LCD controller after completion of write
    la s0, LATDCLR
    li s1, 0x0010
    sw s1, 0(s0)
    
    // floating PORTE[7:0] pins to input 
    la s0, TRISESET
    li s1, 0x00ff
    sw s1, 0(s0)
    
write_done:
    lw s1, 20(fp)
    lw s0, 16(fp)
    addu sp, fp, zero
    lw ra, 28(sp)
    lw fp, 24(sp)
    addiu sp, sp, 32
    jr ra
    nop
.end lcd_write

    
.ent lcd_wait_for_not_busy
lcd_wait_for_not_busy:
    addiu sp, sp, -12
    sw ra, 8(sp)
    sw fp, 4(sp)
    addu fp, sp, zero
    sw s0, 0(fp)
    
    // 
loop_polling:
    addu a0, zero, zero
    jal lcd_read
    nop
    
    andi s0, v0, 0x0080
    beqz s0, wfnb_done
    nop
    j loop_polling
    nop
       
wfnb_done:
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 8(sp)
    lw fp, 4(sp)
    addiu sp, sp, 12
    jr ra
    nop
.end lcd_wait_for_not_busy


.ent lcd_write_string
lcd_write_string:
    addiu sp, sp, -16
    sw ra, 12(sp)
    sw fp, 8(sp)
    addu fp, sp, zero
    sw s1, 4(fp)
    sw s0, 0(fp)
    
    la s0, 0(a0)
loop_writing:
    lb s1, 0(s0) // loading current char into s1
    
    beqz s1, ws_done // return to calling function if null char
    nop
    
    jal lcd_wait_for_not_busy
    nop
    addiu a0, zero, 1 
    addu a1, s1, zero
    jal lcd_write
    nop
    
    addiu s0, s0, 1 // incrementing string address by one byte to the next char
    j loop_writing
    nop    
    
ws_done:
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 12(sp)
    lw fp, 8(sp)
    addiu sp, sp, 16
    jr ra
    nop
.end lcd_write_string
