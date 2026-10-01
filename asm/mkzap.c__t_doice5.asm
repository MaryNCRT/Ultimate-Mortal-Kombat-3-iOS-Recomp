========================================================================
t_doice5  0x00079940  348 bytes   mkzap.c
========================================================================

00079940  push    {r4, r5, r6, r7, lr}
00079942  add     r7, sp, #0xc
00079944  ldr.w   r2, [r0, #0xa4]
00079948  movw    r1, #0x11b0
0007994c  mov     r4, r0
0007994e  adds    r3, r2, #1
00079950  ldr.w   r6, [r0, #0x108]
00079954  ldr.w   r5, [r0, r3, lsl #3]
00079958  cmp     r5, r1
0007995a  beq     #0x79a08
0007995c  ble     #0x79972
0007995e  movw    r3, #0x11b9
00079962  cmp     r5, r3
00079964  beq     #0x79a3c
00079966  adds    r3, #5
00079968  cmp     r5, r3
0007996a  beq     #0x799fa
0007996c  mvn     r0, #2
00079970  pop     {r4, r5, r6, r7, pc}
00079972  cbz     r5, #0x799ae
00079974  movw    r3, #0x11ad
00079978  cmp     r5, r3
0007997a  bne     #0x7996c
0007997c  movs    r3, #2
0007997e  str     r3, [r6, #0x1c]
00079980  ldr.w   r3, [r0, #0xa4]
00079984  adds    r3, #1
00079986  str.w   r1, [r0, r3, lsl #3]
0007998a  ldr.w   r3, [r0, #0xa4]
0007998e  adds    r2, r3, #1
00079990  ldr     r3, [pc, #0xf0]
00079992  str.w   r2, [r0, #0xa4]
00079996  add     r3, pc ; -> 0x000f37cc  t_mframew
00079998  ldr     r1, [r3]
0007999a  lsls    r3, r2, #3
0007999c  adds    r3, r3, r4
0007999e  movs    r0, #0
000799a0  str     r1, [r3, #4]
000799a2  ldr.w   r3, [r4, #0xa4]
000799a6  adds    r3, #1
000799a8  str.w   r0, [r4, r3, lsl #3]
000799ac  b       #0x79970
000799ae  movs    r3, #6
000799b0  mov     r0, r6
000799b2  str     r3, [r6, #0x20]
000799b4  str     r5, [r6, #0x44]
000799b6  bl      #0x79590 ; -> zap_init_special_act
000799ba  mov     r0, r6
000799bc  str     r5, [r6, #0x1c]
000799be  bl      #0x57be4 ; -> ochar_sound
000799c2  mov.w   r3, #0x30000
000799c6  str     r3, [r6, #0x40]
000799c8  ldr.w   r3, [r4, #0xa4]
000799cc  movw    r2, #0x11ad
000799d0  mov     r0, r5
000799d2  adds    r3, #1
000799d4  str.w   r2, [r4, r3, lsl #3]
000799d8  ldr.w   r3, [r4, #0xa4]
000799dc  adds    r2, r3, #1
000799de  ldr     r3, [pc, #0xa8]
000799e0  str.w   r2, [r4, #0xa4]
000799e4  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
000799e6  ldr     r1, [r3]
000799e8  lsls    r3, r2, #3
000799ea  adds    r3, r3, r4
000799ec  str     r1, [r3, #4]
000799ee  ldr.w   r3, [r4, #0xa4]
000799f2  adds    r3, #1
000799f4  str.w   r5, [r4, r3, lsl #3]
000799f8  b       #0x79970
000799fa  cmp     r2, #0
000799fc  ble     #0x79a7a
000799fe  subs    r3, r2, #1
00079a00  str.w   r3, [r0, #0xa4]
00079a04  movs    r0, #0
00079a06  b       #0x79970
00079a08  mov     r0, r6
00079a0a  bl      #0x56d20 ; -> delete_slave
00079a0e  ldr     r1, [pc, #0x7c]
00079a10  mov     r0, r6
00079a12  add     r1, pc ; -> 0x000776b1  t_sky_ice_proc
00079a14  bl      #0x58a10 ; -> NewThread
00079a18  movs    r3, #3
00079a1a  str     r3, [r6, #0x1c]
00079a1c  ldr.w   r3, [r4, #0xa4]
00079a20  movw    r2, #0x11b9
00079a24  adds    r3, #1
00079a26  str.w   r2, [r4, r3, lsl #3]
00079a2a  ldr.w   r3, [r4, #0xa4]
00079a2e  adds    r2, r3, #1
00079a30  ldr.w   r3, [pc, #0x5c]
00079a34  str.w   r2, [r4, #0xa4]
00079a38  add     r3, pc ; -> 0x000f37cc  t_mframew
00079a3a  b       #0x79998
00079a3c  mov     r0, r6
00079a3e  bl      #0x56d20 ; -> delete_slave
00079a42  movs    r0, #0
00079a44  movs    r3, #3
00079a46  str     r0, [r6, #0x40]
00079a48  str     r3, [r6, #0x1c]
00079a4a  ldr.w   r3, [r4, #0xa4]
00079a4e  movw    r2, #0x11be
00079a52  adds    r3, #1
00079a54  str.w   r2, [r4, r3, lsl #3]
00079a58  ldr.w   r3, [r4, #0xa4]
00079a5c  adds    r2, r3, #1
00079a5e  ldr     r3, [pc, #0x34]
00079a60  str.w   r2, [r4, #0xa4]
00079a64  add     r3, pc ; -> 0x000f3704  t_backwards_ani2
00079a66  ldr     r1, [r3]
00079a68  lsls    r3, r2, #3
00079a6a  adds    r3, r3, r4
00079a6c  str     r1, [r3, #4]
00079a6e  ldr.w   r3, [r4, #0xa4]
00079a72  adds    r3, #1
00079a74  str.w   r0, [r4, r3, lsl #3]
00079a78  b       #0x79970
00079a7a  ldr.w   r3, [pc, #0x1c]
00079a7e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00079a80  b       #0x79998
00079a82  nop     
00079a84  ldr     r6, [sp, #0xc8]
00079a86  movs    r7, r0
00079a88  ldr     r4, [sp, #0x360]
00079a8a  movs    r7, r0
00079a8c  bgt     #0x799c6
