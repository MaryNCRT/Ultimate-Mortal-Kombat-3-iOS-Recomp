========================================================================
tl_do_sk_zap  0x00079310  332 bytes   mkzap.c
========================================================================

00079310  push    {r4, r5, r6, r7, lr}
00079312  add     r7, sp, #0xc
00079314  ldr.w   r2, [r0, #0xa4]
00079318  mov     r6, r0
0007931a  ldr.w   r4, [r0, #0x108]
0007931e  adds    r3, r2, #1
00079320  ldr.w   r5, [r0, r3, lsl #3]
00079324  cmp.w   r5, #0x6c8
00079328  beq     #0x79392
0007932a  ble     #0x79340
0007932c  movw    r3, #0x6eb
00079330  cmp     r5, r3
00079332  beq     #0x79402
00079334  adds    r3, #3
00079336  cmp     r5, r3
00079338  beq     #0x79384
0007933a  mvn     r0, #2
0007933e  pop     {r4, r5, r6, r7, pc}
00079340  cmp     r5, #0
00079342  bne     #0x7933a
00079344  mov     r0, r4
00079346  str     r5, [r4, #0x44]
00079348  bl      #0x792fc ; -> zap_init_special
0007934c  ldr     r3, [pc, #0xf4]
0007934e  mov.w   r2, #0x6c8
00079352  mov     r0, r5
00079354  str     r3, [r4, #0x40]
00079356  ldr.w   r3, [r6, #0xa4]
0007935a  adds    r3, #1
0007935c  str.w   r2, [r6, r3, lsl #3]
00079360  ldr.w   r3, [r6, #0xa4]
00079364  adds    r2, r3, #1
00079366  ldr.w   r3, [pc, #0xe0]
0007936a  str.w   r2, [r6, #0xa4]
0007936e  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00079370  ldr     r1, [r3]
00079372  lsls    r3, r2, #3
00079374  adds    r3, r3, r6
00079376  str     r1, [r3, #4]
00079378  ldr.w   r3, [r6, #0xa4]
0007937c  adds    r3, #1
0007937e  str.w   r5, [r6, r3, lsl #3]
00079382  b       #0x7933e
00079384  cmp     r2, #0
00079386  ble     #0x7943c
00079388  subs    r3, r2, #1
0007938a  str.w   r3, [r0, #0xa4]
0007938e  movs    r0, #0
00079390  b       #0x7933e
00079392  ldr     r3, [r4, #0x40]
00079394  mov     r0, r4
00079396  str     r3, [r4, #0x48]
00079398  movs    r3, #1
0007939a  str     r3, [r4, #0x1c]
0007939c  bl      #0x57be4 ; -> ochar_sound
000793a0  mov     r0, r4
000793a2  movs    r3, #0x17
000793a4  str     r3, [r4, #0x40]
000793a6  bl      #0x5520c ; -> get_char_ani
000793aa  ldr     r1, [pc, #0xa0]
000793ac  mov     r0, r4
000793ae  ldr     r5, [r4]
000793b0  add     r1, pc ; -> 0x000f3724  t_wait_forever
000793b2  ldr     r1, [r1]
000793b4  bl      #0x58b54 ; -> NewThreadProc
000793b8  str     r0, [r5, #0x64]
000793ba  ldr     r2, [r4]
000793bc  mov     r0, r4
000793be  ldr     r3, [r2, #0x64]
000793c0  ldr     r3, [r3, #8]
000793c2  str     r3, [r2, #0x68]
000793c4  ldr.w   r3, [pc, #0x88]
000793c8  add     r3, pc ; -> 0x00076cd9  t_sk_zap_proc
000793ca  str     r3, [r4, #0x38]
000793cc  bl      #0x75964 ; -> create_proj_proc
000793d0  ldr     r3, [r4]
000793d2  mov     r0, r4
000793d4  ldr     r3, [r3, #0x68]
000793d6  str     r3, [r4, #0x30]
000793d8  mvn     r3, #0x13
000793dc  str     r3, [r4, #0x1c]
000793de  adds    r3, #0xe
000793e0  str     r3, [r4, #0x20]
000793e2  bl      #0x570bc ; -> adjust_xy_a5
000793e6  mov     r0, r4
000793e8  bl      #0x7568c ; -> detach_proj
000793ec  ldr.w   r3, [r6, #0xa4]
000793f0  movs    r0, #0x20
000793f2  movw    r2, #0x6eb
000793f6  adds    r3, #1
000793f8  str.w   r2, [r6, r3, lsl #3]
000793fc  str.w   r0, [r6, #0xfc]
00079400  b       #0x7933e
00079402  ldr     r3, [r4, #0x48]
00079404  movw    r2, #0x6ee
00079408  str     r3, [r4, #0x40]
0007940a  movs    r3, #4
0007940c  str     r3, [r4, #0x1c]
0007940e  ldr.w   r3, [r0, #0xa4]
00079412  adds    r3, #1
00079414  str.w   r2, [r0, r3, lsl #3]
00079418  ldr.w   r3, [r0, #0xa4]
0007941c  adds    r2, r3, #1
0007941e  ldr     r3, [pc, #0x34]
00079420  str.w   r2, [r0, #0xa4]
00079424  add     r3, pc ; -> 0x000f37cc  t_mframew
00079426  ldr     r1, [r3]
00079428  lsls    r3, r2, #3
0007942a  adds    r3, r3, r6
0007942c  movs    r0, #0
0007942e  str     r1, [r3, #4]
00079430  ldr.w   r3, [r6, #0xa4]
00079434  adds    r3, #1
00079436  str.w   r0, [r6, r3, lsl #3]
0007943a  b       #0x7933e
0007943c  ldr     r3, [pc, #0x18]
0007943e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00079440  b       #0x79426
00079442  nop     
00079444  movs    r4, r4
00079446  movs    r3, r0
00079448  adr     r3, #0x178
0007944a  movs    r7, r0
0007944c  adr     r3, #0x1c0
0007944e  movs    r7, r0
00079450  bls     #0x7946e
