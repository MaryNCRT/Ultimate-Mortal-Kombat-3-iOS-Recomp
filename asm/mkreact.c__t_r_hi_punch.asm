========================================================================
t_r_hi_punch  0x00045784  244 bytes   mkreact.c
========================================================================

00045784  push    {r4, r5, r6, r7, lr}
00045786  add     r7, sp, #0xc
00045788  str     r8, [sp, #-0x4]!
0004578c  ldr.w   r2, [r0, #0xa4]
00045790  movw    r8, #0xe66
00045794  mov     r4, r0
00045796  adds    r3, r2, #1
00045798  ldr.w   r5, [r0, #0x108]
0004579c  ldr.w   r6, [r0, r3, lsl #3]
000457a0  cmp     r6, r8
000457a2  beq     #0x45814
000457a4  movw    r3, #0xe72
000457a8  cmp     r6, r3
000457aa  beq     #0x457fa
000457ac  cbz     r6, #0x457b8
000457ae  mvn     r0, #2
000457b2  ldr     r8, [sp], #4
000457b6  pop     {r4, r5, r6, r7, pc}
000457b8  mov     r0, r5
000457ba  bl      #0x41580 ; -> inc_p_block
000457be  ldr     r3, [pc, #0xa0]
000457c0  ldr     r2, [pc, #0xa0]
000457c2  mov     r0, r6
000457c4  add     r3, pc ; -> 0x00042cd5  t_r_airpunch
000457c6  str     r3, [r5, #0x30]
000457c8  movs    r3, #1
000457ca  str     r3, [r5, #0x34]
000457cc  ldr     r3, [pc, #0x98]
000457ce  add     r2, pc ; -> 0x00044b85  t_reaction_start
000457d0  add     r3, pc ; -> 0x000415c5  t_cc_hi_punch
000457d2  str     r3, [r5, #0x38]
000457d4  ldr.w   r3, [r4, #0xa4]
000457d8  adds    r3, #1
000457da  str.w   r8, [r4, r3, lsl #3]
000457de  ldr.w   r3, [r4, #0xa4]
000457e2  adds    r3, #1
000457e4  str.w   r3, [r4, #0xa4]
000457e8  lsls    r3, r3, #3
000457ea  adds    r3, r3, r4
000457ec  str     r2, [r3, #4]
000457ee  ldr.w   r3, [r4, #0xa4]
000457f2  adds    r3, #1
000457f4  str.w   r6, [r4, r3, lsl #3]
000457f8  b       #0x457b2
000457fa  ldr     r3, [pc, #0x70]
000457fc  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000457fe  ldr     r1, [r3]
00045800  lsls    r3, r2, #3
00045802  adds    r3, r3, r4
00045804  movs    r0, #0
00045806  str     r1, [r3, #4]
00045808  ldr.w   r3, [r4, #0xa4]
0004580c  adds    r3, #1
0004580e  str.w   r0, [r4, r3, lsl #3]
00045812  b       #0x457b2
00045814  mov     r0, r5
00045816  bl      #0x420e4 ; -> rsnd_react_voice
0004581a  movs    r1, #7
0004581c  mov     r0, r5
0004581e  bl      #0x57dbc ; -> rsnd_func
00045822  mov     r0, r5
00045824  bl      #0x54dec ; -> dec_my_p_hit
00045828  mov     r0, r5
0004582a  movs    r3, #3
0004582c  str     r3, [r5, #0x1c]
0004582e  bl      #0x5877c ; -> create_blood_proc
00045832  ldr     r3, [r5]
00045834  movw    r2, #0x509
00045838  str     r2, [r5, #0x1c]
0004583a  str     r2, [r3, #0x18]
0004583c  ldr     r3, [pc, #0x30]
0004583e  movw    r2, #0xe72
00045842  str     r3, [r5, #0x40]
00045844  ldr.w   r3, [r4, #0xa4]
00045848  adds    r3, #1
0004584a  str.w   r2, [r4, r3, lsl #3]
0004584e  ldr.w   r3, [r4, #0xa4]
00045852  adds    r2, r3, #1
00045854  ldr.w   r3, [pc, #0x1c]
00045858  str.w   r2, [r4, #0xa4]
0004585c  add     r3, pc ; -> 0x000f36d0  t_animate_a9
0004585e  b       #0x457fe
00045860  bpl     #0x4587e
00045862  vrsra.u64 d31, d19, #1
