========================================================================
-[EAMTX_Network init]  0x000c6758  84 bytes   EAMTX_Network.mm
========================================================================

000c6758  push    {r4, r7, lr}
000c675a  add     r7, sp, #4
000c675c  sub     sp, #8
000c675e  ldr     r3, [pc, #0x3c]
000c6760  ldr     r1, [pc, #0x3c]
000c6762  str     r0, [sp]
000c6764  add     r3, pc ; -> 0x000fdd94  
000c6766  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c6768  ldr     r3, [r3]
000c676a  ldr     r1, [r1]
000c676c  mov     r0, sp
000c676e  str     r3, [sp, #4]
000c6770  blx     #0xddc08 ; -> objc_msgSendSuper2
000c6774  mov     r4, r0
000c6776  cbz     r0, #0xc6792
000c6778  ldr     r1, [pc, #0x28]
000c677a  movs    r2, #0
000c677c  add     r1, pc ; -> 0x000fd4d8  
000c677e  ldr     r1, [r1]
000c6780  blx     #0xddbfc ; -> objc_msgSend
000c6784  ldr     r1, [pc, #0x20]
000c6786  mov     r0, r4
000c6788  movs    r2, #0
000c678a  add     r1, pc ; -> 0x000fd4d4  
000c678c  ldr     r1, [r1]
000c678e  blx     #0xddbfc ; -> objc_msgSend
000c6792  mov     r0, r4
000c6794  sub.w   sp, r7, #4
000c6798  pop     {r4, r7, pc}
000c679a  nop     
000c679c  strb    r4, [r5, #0x18]
000c679e  movs    r3, r0
000c67a0  str     r6, [r2, #0x20]
000c67a2  movs    r3, r0
000c67a4  ldr     r0, [r3, #0x54]
000c67a6  movs    r3, r0
000c67a8  ldr     r6, [r0, #0x54]
000c67aa  movs    r3, r0
