========================================================================
t_ccp3  0x000477bc  352 bytes   mkreact.c
========================================================================

000477bc  push    {r4, r5, r7, lr}
000477be  add     r7, sp, #8
000477c0  ldr.w   r3, [r0, #0xa4]
000477c4  mov     r5, r0
000477c6  ldr.w   r4, [r0, #0x108]
000477ca  adds    r3, #1
000477cc  ldr.w   r3, [r0, r3, lsl #3]
000477d0  cbnz    r3, #0x477fc
000477d2  mov     r0, r4
000477d4  bl      #0x54ce0 ; -> am_i_joy
000477d8  ldr     r3, [r4, #0x5c]
000477da  cmp     r3, #0
000477dc  bne     #0x4789c
000477de  ldr     r3, [r4]
000477e0  ldr     r0, [r4, #0x34]
000477e2  ldr     r3, [r3, #0x4c]
000477e4  cmp     r3, r0
000477e6  str     r3, [r4, #0x1c]
000477e8  bge     #0x47802
000477ea  ldr.w   r3, [r5, #0xa4]
000477ee  cmp     r3, #0
000477f0  ble     #0x478ca
000477f2  subs    r3, #1
000477f4  movs    r0, #0
000477f6  str.w   r3, [r5, #0xa4]
000477fa  b       #0x47800
000477fc  mvn     r0, #2
00047800  pop     {r4, r5, r7, pc}
00047802  ldr.w   r3, [r5, #0xa4]
00047806  cmp     r3, #0
00047808  ble     #0x478ae
0004780a  subs    r3, #1
0004780c  str.w   r3, [r5, #0xa4]
00047810  ldr.w   r1, [r5, #0xa4]
00047814  adds    r3, r1, #1
00047816  lsls    r2, r3, #3
00047818  adds    r2, r2, r5
0004781a  ldr     r0, [r2, #4]
0004781c  adds    r2, r3, #1
0004781e  ldr.w   r2, [r5, r2, lsl #3]
00047822  str.w   r2, [r5, r3, lsl #3]
00047826  lsls    r3, r1, #3
00047828  adds    r3, r3, r5
0004782a  str     r0, [r3, #4]
0004782c  ldr.w   r3, [r5, #0xa4]
00047830  cmp     r3, #0
00047832  ble     #0x478ee
00047834  subs    r3, #1
00047836  str.w   r3, [r5, #0xa4]
0004783a  ldr.w   r1, [r5, #0xa4]
0004783e  adds    r3, r1, #1
00047840  lsls    r2, r3, #3
00047842  adds    r2, r2, r5
00047844  ldr     r0, [r2, #4]
00047846  adds    r2, r3, #1
00047848  ldr.w   r2, [r5, r2, lsl #3]
0004784c  str.w   r2, [r5, r3, lsl #3]
00047850  lsls    r3, r1, #3
00047852  adds    r3, r3, r5
00047854  str     r0, [r3, #4]
00047856  ldr.w   r3, [r5, #0xa4]
0004785a  cmp     r3, #0
0004785c  ble     #0x478d2
0004785e  subs    r3, #1
00047860  str.w   r3, [r5, #0xa4]
00047864  ldr.w   r1, [r5, #0xa4]
00047868  adds    r3, r1, #1
0004786a  lsls    r2, r3, #3
0004786c  adds    r2, r2, r5
0004786e  ldr     r0, [r2, #4]
00047870  adds    r2, r3, #1
00047872  ldr.w   r2, [r5, r2, lsl #3]
00047876  str.w   r2, [r5, r3, lsl #3]
0004787a  lsls    r3, r1, #3
0004787c  adds    r3, r3, r5
0004787e  ldr     r2, [pc, #0x88]
00047880  str     r0, [r3, #4]
00047882  ldr.w   r3, [r5, #0xa4]
00047886  add     r2, pc ; -> 0x00043251  t_separate_us
00047888  lsls    r3, r3, #3
0004788a  adds    r3, r3, r5
0004788c  movs    r0, #0
0004788e  str     r2, [r3, #4]
00047890  ldr.w   r3, [r5, #0xa4]
00047894  adds    r3, #1
00047896  str.w   r0, [r5, r3, lsl #3]
0004789a  b       #0x47800
0004789c  mov     r0, r4
0004789e  bl      #0x55df0 ; -> is_stick_away
000478a2  ldr     r3, [r4, #0x5c]
000478a4  cmp     r3, #0
000478a6  bne     #0x477de
000478a8  ldr     r3, [r4, #0x30]
000478aa  str     r3, [r4, #0x34]
000478ac  b       #0x477de
000478ae  ldr.w   r2, [pc, #0x5c]
000478b2  lsls    r3, r3, #3
000478b4  adds    r3, r3, r5
000478b6  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000478b8  ldr     r2, [r2]
000478ba  str     r2, [r3, #4]
000478bc  ldr.w   r3, [r5, #0xa4]
000478c0  movs    r2, #0
000478c2  adds    r3, #1
000478c4  str.w   r2, [r5, r3, lsl #3]
000478c8  b       #0x47810
000478ca  ldr     r2, [pc, #0x44]
000478cc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000478ce  ldr     r2, [r2]
000478d0  b       #0x47888
000478d2  ldr.w   r2, [pc, #0x40]
000478d6  lsls    r3, r3, #3
000478d8  adds    r3, r3, r5
000478da  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000478dc  ldr     r2, [r2]
000478de  str     r2, [r3, #4]
000478e0  ldr.w   r3, [r5, #0xa4]
000478e4  movs    r2, #0
000478e6  adds    r3, #1
000478e8  str.w   r2, [r5, r3, lsl #3]
000478ec  b       #0x47864
000478ee  ldr     r2, [pc, #0x28]
000478f0  lsls    r3, r3, #3
000478f2  adds    r3, r3, r5
000478f4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000478f6  ldr     r2, [r2]
000478f8  str     r2, [r3, #4]
000478fa  ldr.w   r3, [r5, #0xa4]
000478fe  movs    r2, #0
00047900  adds    r3, #1
00047902  str.w   r2, [r5, r3, lsl #3]
00047906  b       #0x4783a
00047908  cbnz    r7, #0x4793c
