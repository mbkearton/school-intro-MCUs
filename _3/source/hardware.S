//  hardware.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

.global waitstates_config
.global gpio_config
.global instr_busy_wait
.global lcd_config

.ent waitstates_config
waitstates_config:
    //called function stack frame
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

set_waitstates:
    la s0, CHECONCLR    // Address of CHECON Clear register is held by s0
    li s1, 0x0000007    // Selection of first 3 CHECON bits is held by s1
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

set_ra7:    // LED heartbeat
    la s0, LATACLR
    li s1, 0x0080
    sw s1, 0(s0)

    la s0, ODCACLR
    li s1, 0x0080
    sw s1, 0(s0)

    la s0, TRISACLR
    li s1, 0x0080
    sw s1, 0(s0)

set_rb15:   // LCD RS signal [register-select]
    la s0, LATBCLR
    li s1, 0x8000
    sw s1, 0(s0)

    la s0, ODCBCLR
    li s1, 0x8000
    sw s1, 0(s0)

    la s0, TRISBCLR
    li s1, 0x8000
    sw s1, 0(s0)

set_rd5_rd4:    // rd5 == LCD RW' signal ; rd4 == LCD E signal
    la s0, LATDCLR
    li s1, 0x0030
    sw s1, 0(s0)

    la s0, ODCDCLR
    li s1, 0x0030
    sw s1, 0(s0)

    la s0, TRISDCLR
    li s1, 0x0030
    sw s1, 0(s0)

set_rd3__d0:	// RD[4:0] established as row inputs
    la s0, LATDCLR
    li s1, 0x000f
    sw s1, 0(s0)

    la s0, ODCDSET
    li s1, 0x000f
    sw s1, 0(s0)

    la s0, TRISDCLR
    li s1, 0x000f
    sw s1, 0(s0)

set_ad1pcfg:
    la s0, AD1PCFGSET
    li s1, 0x000b
    sw s1, 0(s0)

set_cnpue:
    la s0, CNPUESET
    li s1, 0x082C   // 82c == 1000 0010 1100 ; CN11, CN5, CN3, CN2
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


.ent instr_busy_wait
instr_busy_wait:
    addiu a0, a0, -1
    nop
    bne a0, zero, instr_busy_wait
    nop

ibw_done:
    jr ra
    nop
.end instr_busy_wait


.ent lcd_config
lcd_config:
    addiu sp, sp, -32
    sw ra, 28(sp)
    sw fp, 24(sp)
    addu fp, sp, zero
    sw s1, 20(fp)
    sw s0, 16(fp)

    li a0, 0x30d40  // a0 = 200,000 ; wait for 40 ms
    jal instr_busy_wait
    nop

    addu a0, zero, zero
    li a1, 0x0038	    // function set
    jal lcd_write
    nop

    jal lcd_wait_for_not_busy
    nop

    addu a0, zero, zero
    li a1, 0x06	    // entry mode set
    jal lcd_write
    nop

    jal lcd_wait_for_not_busy
    nop

    addu a0, zero, zero
    li a1, 0x0f	    // display mode set
    jal lcd_write
    nop

    jal lcd_wait_for_not_busy
    nop

    addu a0, zero, zero
    li a1, 0x80	    // set address = 0
    jal lcd_write
    nop

    jal lcd_wait_for_not_busy
    nop

    addu a0, zero, zero
    li a1, 0x01	    // clear display
    jal lcd_write
    nop

lcd_cfg_done:
    lw s1, 20(fp)
    lw s0, 16(fp)
    addu sp, fp, zero
    lw ra, 28(sp)
    lw fp, 24(sp)
    addiu sp, sp, 32
    jr ra
    nop
.end lcd_config
