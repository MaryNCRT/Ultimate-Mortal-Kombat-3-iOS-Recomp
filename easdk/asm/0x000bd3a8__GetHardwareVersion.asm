========================================================================
GetHardwareVersion  0x000bd3a8  96 bytes   EAMTX_Main.mm
========================================================================

000bd3a8  push    {r4, r5, r6, r7, lr}
000bd3aa  add     r7, sp, #0xc
000bd3ac  sub     sp, #8
000bd3ae  ldr     r6, [pc, #0x4c]
000bd3b0  movs    r4, #0
000bd3b2  add     r2, sp, #4
000bd3b4  add     r6, pc ; -> 0x000e8b60  'hw.machine'
000bd3b6  mov     r1, r4
000bd3b8  mov     r3, r4
000bd3ba  mov     r0, r6
000bd3bc  str     r4, [sp]
000bd3be  blx     #0xdde30 ; -> sysctlbyname
000bd3c2  ldr     r0, [sp, #4]
000bd3c4  blx     #0xddb84 ; -> malloc
000bd3c8  add     r2, sp, #4
000bd3ca  mov     r3, r4
000bd3cc  str     r4, [sp]
000bd3ce  mov     r5, r0
000bd3d0  mov     r1, r5
000bd3d2  mov     r0, r6
000bd3d4  blx     #0xdde30 ; -> sysctlbyname
000bd3d8  ldr     r0, [pc, #0x24]
000bd3da  ldr     r1, [pc, #0x28]
000bd3dc  mov     r2, r5
000bd3de  add     r0, pc ; -> 0x000fdb5c  
000bd3e0  add     r1, pc ; -> 0x000fcfc4  
000bd3e2  movs    r3, #4
000bd3e4  ldr     r1, [r1]
000bd3e6  ldr     r0, [r0]
000bd3e8  blx     #0xddbfc ; -> objc_msgSend
000bd3ec  mov     r4, r0
000bd3ee  mov     r0, r5
000bd3f0  blx     #0xdd7ac ; -> free
000bd3f4  mov     r0, r4
000bd3f6  sub.w   sp, r7, #0xc
000bd3fa  pop     {r4, r5, r6, r7, pc}
