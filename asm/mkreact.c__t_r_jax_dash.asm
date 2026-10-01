========================================================================
t_r_jax_dash  0x00042fe4  224 bytes   mkreact.c
========================================================================

00042fe4  push    {r4, r5, r7, lr}
00042fe6  add     r7, sp, #8
00042fe8  ldr.w   r2, [r0, #0xa4]
00042fec  mov     r4, r0
00042fee  ldr.w   r5, [r0, #0x108]
00042ff2  adds    r3, r2, #1
00042ff4  movw    r1, #0x59f
00042ff8  ldr.w   r0, [r0, r3, lsl #3]
00042ffc  cmp     r0, r1
00042ffe  beq     #0x4305c
00043000  movw    r3, #0x5ae
00043004  cmp     r0, r3
00043006  beq     #0x43042
00043008  cbz     r0, #0x43010
0004300a  mvn     r0, #2
0004300e  pop     {r4, r5, r7, pc}
00043010  str     r0, [r5, #0x30]
00043012  str     r0, [r5, #0x38]
00043014  movs    r3, #2
00043016  str     r3, [r5, #0x34]
00043018  ldr.w   r3, [r4, #0xa4]
0004301c  ldr     r2, [pc, #0x98]
0004301e  adds    r3, #1
00043020  add     r2, pc ; -> 0x00044b85  t_reaction_start
00043022  str.w   r1, [r4, r3, lsl #3]
00043026  ldr.w   r3, [r4, #0xa4]
0004302a  adds    r3, #1
0004302c  str.w   r3, [r4, #0xa4]
00043030  lsls    r3, r3, #3
00043032  adds    r3, r3, r4
00043034  str     r2, [r3, #4]
00043036  ldr.w   r3, [r4, #0xa4]
0004303a  adds    r3, #1
0004303c  str.w   r0, [r4, r3, lsl #3]
00043040  b       #0x4300e
00043042  ldr.w   r1, [pc, #0x78]
00043046  add     r1, pc ; -> 0x000425b9  t_reaction_land
00043048  lsls    r3, r2, #3
0004304a  adds    r3, r3, r4
0004304c  movs    r0, #0
0004304e  str     r1, [r3, #4]
00043050  ldr.w   r3, [r4, #0xa4]
00043054  adds    r3, #1
00043056  str.w   r0, [r4, r3, lsl #3]
0004305a  b       #0x4300e
0004305c  mov     r0, r5
0004305e  movs    r3, #2
00043060  str     r3, [r5, #0x1c]
00043062  bl      #0x580a4 ; -> group_sound
00043066  movs    r1, #0xa
00043068  mov     r0, r5
0004306a  bl      #0x57dbc ; -> rsnd_func
0004306e  mov     r0, r5
00043070  mov.w   r3, #0x60006
00043074  str     r3, [r5, #0x48]
00043076  bl      #0x581e0 ; -> shake_a11
0004307a  mov.w   r3, #0x80000
0004307e  str     r3, [r5, #0x1c]
00043080  sub.w   r3, r3, #0xe0000
00043084  str     r3, [r5, #0x20]
00043086  add.w   r3, r3, #0x66000
0004308a  str     r3, [r5, #0x24]
0004308c  movs    r3, #5
0004308e  str     r3, [r5, #0x28]
00043090  adds    r3, #0x19
00043092  str     r3, [r5, #0x40]
00043094  ldr.w   r3, [r4, #0xa4]
00043098  movw    r2, #0x5ae
0004309c  adds    r3, #1
0004309e  str.w   r2, [r4, r3, lsl #3]
000430a2  ldr.w   r3, [r4, #0xa4]
000430a6  adds    r2, r3, #1
000430a8  ldr.w   r3, [pc, #0x14]
000430ac  str.w   r2, [r4, #0xa4]
000430b0  add     r3, pc ; -> 0x000f3720  t_flight
000430b2  ldr     r1, [r3]
000430b4  b       #0x43048
000430b6  nop     
000430b8  subs    r1, r4, r5
000430ba  movs    r0, r0
000430bc  bl      #0xffdb30be
000430c0  lsls    r4, r5, #0x19
000430c2  movs    r3, r1
