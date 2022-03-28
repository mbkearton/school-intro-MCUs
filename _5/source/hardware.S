//  hardware.S --
//
//  Michael Kearton
//  August 2021
#include <xc.h>

.global waitstates_config
.global gpio_config
.global instr_busy_wait
.global lcd_config
.global intsys_config
.global timer1_config
.global timer32_config

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

set_ra7_ra6:    // setting RA7 & RA 6 for heartbeat LED & flasher LED
    la s0, LATACLR
    li s1, 0x00c0
    sw s1, 0(s0)

    la s0, ODCACLR
    li s1, 0x00c0
    sw s1, 0(s0)

    la s0, TRISACLR
    li s1, 0x00c0
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
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero
    
    //
ibw_loop:
    addiu a0, a0, -1
    nop
    bne a0, zero, ibw_loop
    nop

ibw_done:
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
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

    
.ent intsys_config
intsys_config:
    addiu sp, sp, -16
    sw ra, 12(sp)
    sw fp, 8(sp)
    addu fp, sp, zero
    sw s1, 4(fp)
    sw s0, 0(fp)
    
    di	    // beginning interrupt cfg ; disabling interrupts
    
    // setting IV bit within CP0 Cause
    mfc0 s0, _CP0_CAUSE
    li s1, 0x800000
    or s0, s0, s1
    mtc0 s0, _CP0_CAUSE
    
    // set MVEC
    la s0, INTCONSET
    li s1, 0x1000
    sw s1, 0(s0)
    
    ei	    // finishing interrupt cfg ; enabling interrupts
    
intsys_cfg_done:
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 12(sp)
    lw fp, 8(sp)
    addiu sp, sp, 16
    jr ra
    nop
.end intsys_config


.ent timer1_config
timer1_config:
    addiu sp, sp, -16
    sw ra, 12(sp)
    sw fp, 8(sp)
    addu fp, sp, zero
    sw s1, 4(fp)
    sw s0, 0(fp)
    
    // clearing Timer 1 interrupt flag
    la s0, IFS0CLR
    li s1, 0x10
    sw s1, 0(s0)

    // setting interrupt priority
    la s0, IPC1SET
    li s1, 0x18
    sw s1, 0(s0)
    
    // setting Timer 1 interrupt enable
    la s0, IEC0
    li s1, 0x10
    sw s1, 0(s0)
    
    // clearing Timer 1
    la s0, TMR1
    li s1, 0x0
    sw s1, 0(s0)

    // setting period register 
    la s0, PR1
    li s1, 0x61a8
    sw s1, 0(s0)
    
    // starting Timer 1
    la s0, T1CONSET
    li s1, 0x8000
    sw s1, 0(s0)
    
timer1_cfg_done:
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 12(sp)
    lw fp, 8(sp)
    addiu sp, sp, 16
    jr ra
    nop
.end timer1_config

    
.ent timer32_config
timer32_config:
    addiu sp, sp, -16
    sw ra, 12(sp)
    sw fp, 8(sp)
    addu fp, sp, zero
    sw s1, 4(fp)
    sw s0, 0(fp)
    
    // clearing Timer 3 flag
    la s0, IFS0CLR
    li s1, 0x1000
    sw s1, 0(s0)
    
    // setting Timers 2 & 3 to comprise a single 32-bit timer
    la s0, T2CONSET
    li s1, 0x8
    sw s1, 0(s0)
    
    // setting Timer 3 interrupt priority level
    la s0, IPC3SET  // priority == 5 == 0b101 ; sub == 0b00
    li s1, 0x14	    // 0b10100 == 0x14
    sw s1, 0(s0)
    
    // setting Timer 3 interrupt enable
    la s0, IEC0SET
    li s1, 0x1000
    sw s1, 0(s0)
    
timer32_cfg_done:
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 12(sp)
    lw fp, 8(sp)
    addiu sp, sp, 16
    jr ra
    nop
.end timer32_config
