========================================================================
t_fall_down_pit  0x0004823c  356 bytes   mkreact.c
========================================================================

0004823c  push    {r4, r5, r6, r7, lr}
0004823e  add     r7, sp, #0xc
00048240  str     r8, [sp, #-0x4]!
00048244  ldr.w   r3, [r0, #0xa4]
00048248  movw    r8, #0x9e2
0004824c  mov     r5, r0
0004824e  adds    r2, r3, #1
00048250  ldr.w   r4, [r0, #0x108]
00048254  ldr.w   r6, [r0, r2, lsl #3]
00048258  cmp     r6, r8
0004825a  beq     #0x48300
0004825c  ble     #0x48276
0004825e  movw    r3, #0x9ed
00048262  cmp     r6, r3
00048264  beq     #0x4835a
00048266  cmp.w   r6, #0x9f0
0004826a  beq     #0x482dc
0004826c  mvn     r0, #2
00048270  ldr     r8, [sp], #4
00048274  pop     {r4, r5, r6, r7, pc}
00048276  cmp     r6, #0
00048278  bne     #0x4826c
0004827a  ldr     r3, [r4]
0004827c  movs    r1, #0x3b
0004827e  mov     r2, r6
00048280  movs    r0, #4
00048282  ldr     r3, [r3, #8]
00048284  bl      #0x31a28 ; -> MKEvent_Add
00048288  mov     r0, r4
0004828a  movs    r3, #9
0004828c  str     r3, [r4, #0x1c]
0004828e  bl      #0x580a4 ; -> group_sound
00048292  ldr     r3, [pc, #0xf0]
00048294  str     r6, [r4, #0x1c]
00048296  mov     r0, r6
00048298  str     r3, [r4, #0x20]
0004829a  add.w   r3, r3, #0xc6000
0004829e  str     r3, [r4, #0x24]
000482a0  movs    r3, #5
000482a2  str     r3, [r4, #0x28]
000482a4  adds    r3, #0x19
000482a6  str     r3, [r4, #0x40]
000482a8  ldr.w   r3, [pc, #0xdc]
000482ac  add     r3, pc ; -> 0x00047ee5  t_pit_fall_scan
000482ae  str     r3, [r4, #0x34]
000482b0  ldr.w   r3, [r5, #0xa4]
000482b4  adds    r3, #1
000482b6  str.w   r8, [r5, r3, lsl #3]
000482ba  ldr.w   r3, [r5, #0xa4]
000482be  adds    r2, r3, #1
000482c0  ldr     r3, [pc, #0xc8]
000482c2  str.w   r2, [r5, #0xa4]
000482c6  add     r3, pc ; -> 0x000f37f4  t_flight_call
000482c8  ldr     r1, [r3]
000482ca  lsls    r3, r2, #3
000482cc  adds    r3, r3, r5
000482ce  str     r1, [r3, #4]
000482d0  ldr.w   r3, [r5, #0xa4]
000482d4  adds    r3, #1
000482d6  str.w   r6, [r5, r3, lsl #3]
000482da  b       #0x48270
000482dc  mov     r0, r4
000482de  bl      #0x336e8 ; -> death_blow_complete
000482e2  ldr     r3, [pc, #0xac]
000482e4  movs    r0, #0
000482e6  add     r3, pc ; -> 0x000f3724  t_wait_forever
000482e8  ldr     r2, [r3]
000482ea  ldr.w   r3, [r5, #0xa4]
000482ee  lsls    r3, r3, #3
000482f0  adds    r3, r3, r5
000482f2  str     r2, [r3, #4]
000482f4  ldr.w   r3, [r5, #0xa4]
000482f8  adds    r3, #1
000482fa  str.w   r0, [r5, r3, lsl #3]
000482fe  b       #0x48270
00048300  mov     r0, r4
00048302  movs    r3, #0x1a
00048304  str     r3, [r4, #0x1c]
00048306  bl      #0x58d70 ; -> create_fx
0004830a  ldr     r1, [pc, #0x88]
0004830c  mov     r0, r4
0004830e  add     r1, pc ; -> 0x00047985  t_machine_sound
00048310  bl      #0x58a10 ; -> NewThread
00048314  ldr     r1, [pc, #0x80]
00048316  mov     r0, r4
00048318  add     r1, pc ; -> 0x0004791d  t_bone_grind_sound
0004831a  bl      #0x58a10 ; -> NewThread
0004831e  movs    r3, #5
00048320  str     r3, [r4, #0x1c]
00048322  subs    r3, #2
00048324  str     r3, [r4, #0x20]
00048326  str     r3, [r4, #0x24]
00048328  ldr.w   r3, [r5, #0xa4]
0004832c  movw    r2, #0x9ed
00048330  movs    r0, #0
00048332  adds    r3, #1
00048334  str.w   r2, [r5, r3, lsl #3]
00048338  ldr.w   r3, [r5, #0xa4]
0004833c  adds    r2, r3, #1
0004833e  ldr     r3, [pc, #0x5c]
00048340  str.w   r2, [r5, #0xa4]
00048344  add     r3, pc ; -> 0x000f36f8  t_shake_ob_up
00048346  ldr     r1, [r3]
00048348  lsls    r3, r2, #3
0004834a  adds    r3, r3, r5
0004834c  str     r1, [r3, #4]
0004834e  ldr.w   r3, [r5, #0xa4]
00048352  adds    r3, #1
00048354  str.w   r0, [r5, r3, lsl #3]
00048358  b       #0x48270
0004835a  mov     r0, r4
0004835c  bl      #0x54f70 ; -> set_inviso
00048360  ldr     r0, [r4]
00048362  movs    r2, #0
00048364  movs    r1, #0x3c
00048366  ldr     r3, [r0, #8]
00048368  movs    r0, #4
0004836a  bl      #0x31a28 ; -> MKEvent_Add
0004836e  ldr.w   r3, [r5, #0xa4]
00048372  movs    r0, #0x60
00048374  mov.w   r2, #0x9f0
00048378  adds    r3, #1
0004837a  str.w   r2, [r5, r3, lsl #3]
0004837e  str.w   r0, [r5, #0xfc]
00048382  b       #0x48270
00048384  movs    r0, r0
00048386  vcvt.f16.u16 d31, d21, #0xc
