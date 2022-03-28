#include <xc.h>

.global main
.global instr_delay

.data

.text
.set noreorder

.ent main
main:
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

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
    sw t1, 0(t0)    // s1 == 0xff , as above

    la t0, LATASET
    li t1, 0xa5
    sw t1, 0(t0)

    //
    la t0, LATAINV
    li t1, 0xff

main_loop:
    li a0, 0xf424   // a0 == 62,500
    jal instr_delay
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


.ent instr_delay
instr_delay:
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

    //
id_loop:
    nop
    addi a0, a0, -1
    bne a0, zero, id_loop
    nop

id_done:
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
    jr ra
    nop
.end instr_delay
