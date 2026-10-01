========================================================================
-[EAMTX_Network dealloc]  0x000c5d64  164 bytes   EAMTX_Network.mm
========================================================================

000c5d64  push    {r4, r5, r7, lr}
000c5d66  add     r7, sp, #8
000c5d68  sub     sp, #8
000c5d6a  ldr     r4, [pc, #0x78]
000c5d6c  mov     r5, r0
000c5d6e  add     r4, pc ; -> 0x000f7da8  OBJC_IVAR_$_EAMTX_Network.m_LastRequestURL
000c5d70  ldr     r0, [r4]
000c5d72  ldr     r0, [r5, r0]
000c5d74  cbz     r0, #0xc5d96
000c5d76  ldr     r1, [pc, #0x70]
000c5d78  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c5d7a  ldr     r1, [r1]
000c5d7c  blx     #0xddbfc ; -> objc_msgSend
000c5d80  cbz     r0, #0xc5d96
000c5d82  ldr     r1, [pc, #0x68]
000c5d84  ldr     r3, [r4]
000c5d86  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c5d88  ldr     r0, [r5, r3]
000c5d8a  ldr     r1, [r1]
000c5d8c  blx     #0xddbfc ; -> objc_msgSend
000c5d90  ldr     r3, [r4]
000c5d92  movs    r2, #0
000c5d94  str     r2, [r5, r3]
000c5d96  ldr     r3, [pc, #0x58]
000c5d98  ldr     r1, [pc, #0x58]
000c5d9a  add     r3, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c5d9c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c5d9e  ldr     r3, [r3]
000c5da0  ldr     r4, [r1]
000c5da2  ldr     r0, [r5, r3]
000c5da4  mov     r1, r4
000c5da6  blx     #0xddbfc ; -> objc_msgSend
000c5daa  ldr     r3, [pc, #0x4c]
000c5dac  mov     r1, r4
000c5dae  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c5db0  ldr     r3, [r3]
000c5db2  ldr     r0, [r5, r3]
000c5db4  blx     #0xddbfc ; -> objc_msgSend
000c5db8  ldr     r3, [pc, #0x40]
000c5dba  mov     r1, r4
000c5dbc  add     r3, pc ; -> 0x000f7a48  OBJC_IVAR_$_EAMTX_Network.itemIdentifier
000c5dbe  ldr     r3, [r3]
000c5dc0  ldr     r0, [r5, r3]
000c5dc2  blx     #0xddbfc ; -> objc_msgSend
000c5dc6  ldr     r3, [pc, #0x38]
000c5dc8  ldr     r1, [pc, #0x38]
000c5dca  mov     r0, sp
000c5dcc  add     r3, pc ; -> 0x000fdd94  
000c5dce  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000c5dd0  ldr     r3, [r3]
000c5dd2  ldr     r1, [r1]
000c5dd4  str     r5, [sp]
000c5dd6  str     r3, [sp, #4]
000c5dd8  blx     #0xddc08 ; -> objc_msgSendSuper2
000c5ddc  sub.w   sp, r7, #8
000c5de0  pop     {r4, r5, r7, pc}
000c5de2  nop     
000c5de4  movs    r0, #0x36
000c5de6  movs    r3, r0
000c5de8  ldrb    r0, [r2, #9]
000c5dea  movs    r3, r0
000c5dec  ldr     r2, [r6, #0x3c]
000c5dee  movs    r3, r0
000c5df0  movs    r0, #6
000c5df2  movs    r3, r0
000c5df4  ldr     r4, [r3, #0x3c]
000c5df6  movs    r3, r0
000c5df8  subs    r2, r5, #7
000c5dfa  movs    r3, r0
000c5dfc  adds    r0, r1, #2
000c5dfe  movs    r3, r0
000c5e00  ldrb    r4, [r0, #0x1f]
000c5e02  movs    r3, r0
000c5e04  ldr     r6, [r1, #0x3c]
000c5e06  movs    r3, r0
