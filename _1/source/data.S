//  data.S --
//
//  Michael Kearton
//  May 2021
#include <xc.h>
	
// Used in main.S and app_heartbeat.S
.global	FLAG_10MS
.global	heartbeat_state
.global	heartbeat_count

.data
	FLAG_10MS:		.word	0
	heartbeat_state:	.word	0
	heartbeat_count:	.word	0
