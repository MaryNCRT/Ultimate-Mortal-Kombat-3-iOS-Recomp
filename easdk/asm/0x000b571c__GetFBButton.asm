========================================================================
GetFBButton  0x000b571c  48 bytes   EAMTX_Main.mm
========================================================================

000b571c  push    {r4, r7, lr}
000b571e  add     r7, sp, #4
000b5720  ldr     r1, [pc, #0x1c]
000b5722  mov     r4, r0
000b5724  ldr     r0, [pc, #0x1c]
000b5726  add     r1, pc ; -> 0x000fd444  
000b5728  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000b572a  ldr     r1, [r1]
000b572c  ldr     r0, [r0]
000b572e  blx     #0xddbfc ; -> objc_msgSend
000b5732  ldr     r1, [pc, #0x14]
000b5734  mov     r2, r4
000b5736  add     r1, pc ; -> 0x000fd388  
000b5738  ldr     r1, [r1]
000b573a  blx     #0xddbfc ; -> objc_msgSend
000b573e  pop     {r4, r7, pc}
000b5740  ldrb    r2, [r3, #0x14]
000b5742  movs    r4, r0
000b5744  ldr     r4, [r0, #0x28]
000b5746  movs    r5, r5
000b5748  ldrb    r6, [r1, #0x11]
000b574a  movs    r4, r0
