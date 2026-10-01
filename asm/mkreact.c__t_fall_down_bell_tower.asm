========================================================================
t_fall_down_bell_tower  0x0004858c  148 bytes   mkreact.c
========================================================================

0004858c  push    {r4, r5, r6, r7, lr}
0004858e  add     r7, sp, #0xc
00048590  ldr.w   r3, [r0, #0xa4]
00048594  mov     r5, r0
00048596  ldr.w   r4, [r0, #0x108]
0004859a  adds    r2, r3, #1
0004859c  ldr.w   r6, [r0, r2, lsl #3]
000485a0  cmp     r6, #0
000485a2  bne     #0x48608
000485a4  ldr     r3, [r4]
000485a6  mov     r2, r6
000485a8  movs    r1, #0x3d
000485aa  movs    r0, #4
000485ac  ldr     r3, [r3, #8]
000485ae  bl      #0x31a28 ; -> MKEvent_Add
000485b2  mov     r0, r4
000485b4  movs    r3, #9
000485b6  str     r3, [r4, #0x1c]
000485b8  bl      #0x580a4 ; -> group_sound
000485bc  mov     r0, r4
000485be  bl      #0x54f60 ; -> clear_shadow_bit
000485c2  mov     r0, r4
000485c4  bl      #0x57b6c ; -> center_around_me
000485c8  ldr     r3, [pc, #0x44]
000485ca  mov     r0, r4
000485cc  str     r3, [r4, #0x48]
000485ce  bl      #0x581e0 ; -> shake_a11
000485d2  ldr     r3, [pc, #0x40]
000485d4  str     r6, [r4, #0x1c]
000485d6  ldr     r2, [pc, #0x40]
000485d8  mov     r0, r6
000485da  str     r3, [r4, #0x20]
000485dc  add.w   r3, r3, #0xc6000
000485e0  str     r3, [r4, #0x24]
000485e2  movs    r3, #5
000485e4  str     r3, [r4, #0x28]
000485e6  adds    r3, #0x19
000485e8  str     r3, [r4, #0x40]
000485ea  ldr     r3, [pc, #0x30]
000485ec  add     r2, pc ; -> 0x000483a1  t_brp1
000485ee  add     r3, pc ; -> 0x00047ee5  t_pit_fall_scan
000485f0  str     r3, [r4, #0x34]
000485f2  ldr.w   r3, [r5, #0xa4]
000485f6  lsls    r3, r3, #3
000485f8  adds    r3, r3, r5
000485fa  str     r2, [r3, #4]
000485fc  ldr.w   r3, [r5, #0xa4]
00048600  adds    r3, #1
00048602  str.w   r6, [r5, r3, lsl #3]
00048606  pop     {r4, r5, r6, r7, pc}
00048608  mvn     r0, #2
0004860c  b       #0x48606
0004860e  nop     
00048610  movs    r2, r1
00048612  movs    r6, r0
00048614  movs    r0, r0
