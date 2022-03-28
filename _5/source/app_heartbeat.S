//  app_heartbeat.S --
//
//  Michael Kearton
//  May 2021
#include <xc.h>
    
.global app_heartbeat

.ent app_heartbeat
app_heartbeat:
    //called function stack frame
    addiu sp, sp, -8
    sw ra, 4(sp)
    sw fp, 0(sp)
    addu fp, sp, zero

    
increment:
    la s0, heartbeat_count  // load heartbeat_count ADDRESS into s0
    lw s7, 0(s0)	    // load ehartbeat_count VALUE into s7
    li s1, 99		    // load 99		    into s1
    
    // if s7 != 99; increment normally
    bne s7, s1, hc_inc
    nop
    // else if s7 == s1 == 99; zero out s7, then update hc
    li s7, 0
    j hc_update
    nop
hc_inc:
    addi s7, s7, 1
hc_update:
    sw s7, 0(s0)    // update heartbeat_count in memory
    
    
state_transition:
    la s1, heartbeat_state  // load heartbeat_state ADDRESS into s1
    lw s6, 0(s1)	    // load heartbeat_state VALUE into s6
    li s2, 0		    // load 0		    into s2
    li s3, 1		    // load 1		    into s3
    
    // if state == 1; jump to state one statements
    beq s6, s3, hs_one
    nop
    // else state == 0;
hs_zero:
    // if heartbeat_count != 0; stay in state 0
    bne s7, s2, next_zero
    nop
    // else heartbeat_count == 0; set bit 7 of PORTA
    la s4, PORTASET
    li s5, 0x0080
    sw s5, 0(s4)
    // then set next state to one
    j next_one
    nop
hs_one:
    li s0, 25		    // load 25 into s0  
    // if hc != 25; stay in state 1
    bne s7, s0, next_one
    nop
    // else hc == 25; clear bit 7 of PORTA
    la s4, PORTACLR
    li s5, 0x0080
    sw s5, 0(s4)
    // then set next state to zero
next_zero:
   sw s2, 0(s1)
   j done
   nop
next_one:
    sw s3, 0(s1)
    
    
done:
    //called function stack frame wind-up
    addu sp, fp, zero
    lw ra, 4(sp)
    lw fp, 0(sp)
    addiu sp, sp, 8
    jr ra
    nop
.end app_heartbeat
