#include <xc.h>

.global main
.global timer1_delay_b

.data

.text
.set noreorder

.ent main
main:
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

    // clearing Timer 1 config.
    la t0, T1CON
    li t1, 0x0
    sw t1, 0(t0)
    
    // setting PBCLK prescaler to divide-by-8 ; 
    la t0, T1CONSET
    li t1, 0x10
    sw t1, 0(t0)
    
    // unlock sequence 
    la t0, SYSKEY
    li t1, 0x0
    sw t1, 0(t0)    // SYSKEY = 0
    
    li t1, 0xaa996655
    sw t1, 0(t0)    // SYSKEY = AA996655
    
    li t1, 0x556699aa
    sw t1, 0(t0)    // SYSKEY = 556699AA
    
    // PBDIV[1:0] (OSCCON[20:19]) == 0b11 by default
    // only clearing OSCCON[19] to set PBDIV == 0b10
    la t0, OSCCONCLR
    li t1, 0x80000  // make changes
    
    // locking up
    la t0,  SYSKEY
    li t1, 0x0
    sw t1, 0(t0)    // SYSKEY = 0

    // clearing interrupt flag bit
    la t0, IFS0
    lw t1, 0(t0)
    andi t1, t1, 0xef
    sw t1, 0(t0)


    // clears JTAGEN (DDPCON[3]), setting multiplexed path to GPIO
    // allowing using of RA[5:4][1:0] to control indicator LEDs
    la t0, DDPCON
    lw t1, 0(t0)
    andi t1, t1, 0x7
    sw t1, 0(t0)

    //
    la t0, LATACLR
    li t1, 0xff
    sw t1, 0(t0)

    //
    la t0, ODCACLR
    sw t1, 0(t0)

    la t0, TRISACLR
    sw t1, 0(t0)

    la t0, LATASET
    li t1, 0xa5
    sw t1, 0(t0)

    //
    la t0, LATAINV
    li t1, 0xff

main_loop:
    li a0, 0xf424   // a0 == 62,500
    jal timer1_delay_b
    nop

    sw t1, 0(t0)
    j main_loop
    nop

done:
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
    jr ra
    nop
.end main


.ent timer1_delay_b // 500 KHz PBCLK == 0.000002 second period
timer1_delay_b:
    addiu sp, sp, -16
    sw ra, 12(sp)
    sw fp, 8(sp)
    addu fp, sp, zero
    sw s1, 4(fp)
    sw s0, 0(fp)

    // clearing Timer 1 count value
    la s0, TMR1
    li s1, 0x0
    sw s1, 0(s0)

    // loading period register with passed-in argument
    la s0, PR1
    sw a0, 0(s0)

    // starting Timer 1
    la s0, T1CONSET
    li s1, 0x8000
    sw s1, 0(s0)

    la s0, IFS0
check_loop:
    lw s1, 0(s0)
    andi s1, s1, 0x10

    beqz s1, check_loop
    nop
    // fall through once flag is found

    // stopping Timer 1
    la s0, T1CONCLR
    li s1, 0x8000
    sw s1, 0(s0)

    // clearing interrupt flag bit
    la s0, IFS0
    lw s1, 0(s0)
    andi s1, s1, 0xef
    sw s1, 0(s0)

id_done:
    lw s1, 4(fp)
    lw s0, 0(fp)
    addu sp, fp, zero
    lw ra, 12(sp)
    lw fp, 8(sp)
    addiu sp, sp, 16
    jr ra
    nop
.end timer1_delay_b
