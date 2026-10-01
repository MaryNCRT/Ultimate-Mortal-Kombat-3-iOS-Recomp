========================================================================
getFreeSpace  0x000be47c  112 bytes   EAMTX_Main.mm
========================================================================

000be47c  push    {r4, r5, r7, lr}
000be47e  add     r7, sp, #8
000be480  sub.w   sp, sp, #0x860
000be484  sub     sp, #0x18
000be486  movs    r1, #1
000be488  movs    r0, #9
000be48a  mov     r2, r1
000be48c  blx     #0xdd3ec ; -> NSSearchPathForDirectoriesInDomains
000be490  ldr     r1, [pc, #0x4c]
000be492  movs    r2, #0
000be494  add     r4, sp, #0x18
000be496  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000be498  subs    r4, #0x18
000be49a  ldr     r1, [r1]
000be49c  blx     #0xddbfc ; -> objc_msgSend
000be4a0  ldr     r1, [pc, #0x40]
000be4a2  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000be4a4  ldr     r1, [r1]
000be4a6  blx     #0xddbfc ; -> objc_msgSend
000be4aa  mov     r1, sp
000be4ac  blx     #0xdddd0 ; -> statfs
000be4b0  ldr.w   r3, [pc, #0x34]
000be4b4  add.w   r1, sp, #0x860
000be4b8  adds    r1, #0x18
000be4ba  ldr     r0, [r4, #0x18]
000be4bc  ldr     r2, [r1, r3]
000be4be  ldr     r3, [r4, #0x1c]
000be4c0  umull   r4, r5, r0, r2
000be4c4  mla     r1, r3, r2, r5
000be4c8  mov     r0, r4
000be4ca  cmp     r1, #0
000be4cc  bhi     #0xbe4da
000be4ce  bne     #0xbe4d6
000be4d0  cmp.w   r4, #0x500000
000be4d4  bhs     #0xbe4da
000be4d6  movs    r0, #0
000be4d8  movs    r1, #0
000be4da  sub.w   sp, r7, #8
000be4de  pop     {r4, r5, r7, pc}
000be4e0  b       #0xbe0a8
000be4e2  movs    r3, r0
000be4e4  b       #0xbdfdc
000be4e6  movs    r3, r0
000be4e8  bl      #0x474ea
