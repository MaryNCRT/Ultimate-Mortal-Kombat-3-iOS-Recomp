========================================================================
t_f_swat  0x000a697c  268 bytes   mkfriend.c
========================================================================

000a697c  push    {r4, r5, r6, r7, lr}
000a697e  add     r7, sp, #0xc
000a6980  mov     r5, r0
000a6982  ldr.w   r4, [r0, #0x108]
000a6986  ldr.w   r0, [r0, #0xa4]
000a698a  movw    r2, #0x372
000a698e  adds    r1, r0, #1
000a6990  ldr.w   r3, [r5, r1, lsl #3]
000a6994  cmp     r3, r2
000a6996  beq     #0xa6a2e
000a6998  ble     #0xa69ae
000a699a  movw    r2, #0x375
000a699e  cmp     r3, r2
000a69a0  beq     #0xa6a4e
000a69a2  adds    r2, #1
000a69a4  cmp     r3, r2
000a69a6  beq     #0xa6a16
000a69a8  mvn     r0, #2
000a69ac  pop     {r4, r5, r6, r7, pc}
000a69ae  cmp     r3, #0
000a69b0  bne     #0xa69a8
000a69b2  ldr     r1, [pc, #0xbc]
000a69b4  mov     r0, r4
000a69b6  add     r1, pc ; -> 0x000a57b5  t_swat_friend_proc
000a69b8  bl      #0x58a10 ; -> NewThread
000a69bc  ldr     r3, [r4, #8]
000a69be  ldr     r3, [r3, #0x28]
000a69c0  tst.w   r3, #0x10
000a69c4  str     r3, [r4, #0x2c]
000a69c6  bne     #0xa6a68
000a69c8  ldr     r6, [pc, #0xa8]
000a69ca  movs    r3, #3
000a69cc  str     r3, [r4, #0x48]
000a69ce  mov     r1, r6
000a69d0  mov     r0, r4
000a69d2  add     r1, pc
000a69d4  bl      #0x58a10 ; -> NewThread
000a69d8  ldr     r3, [r4, #0x48]
000a69da  subs    r0, r3, #1
000a69dc  str     r0, [r4, #0x48]
000a69de  cmp     r0, #0
000a69e0  bne     #0xa69ce
000a69e2  ldr     r3, [pc, #0x94]
000a69e4  movw    r2, #0x372
000a69e8  add     r3, pc ; -> 0x00177af4  a_swat_friend
000a69ea  str     r3, [r4, #0x40]
000a69ec  ldr.w   r3, [r5, #0xa4]
000a69f0  adds    r3, #1
000a69f2  str.w   r2, [r5, r3, lsl #3]
000a69f6  ldr.w   r3, [r5, #0xa4]
000a69fa  ldr     r2, [pc, #0x80]
000a69fc  adds    r3, #1
000a69fe  str.w   r3, [r5, #0xa4]
000a6a02  lsls    r3, r3, #3
000a6a04  adds    r3, r3, r5
000a6a06  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a6a08  str     r2, [r3, #4]
000a6a0a  ldr.w   r3, [r5, #0xa4]
000a6a0e  adds    r3, #1
000a6a10  str.w   r0, [r5, r3, lsl #3]
000a6a14  b       #0xa69ac
000a6a16  ldr     r2, [pc, #0x68]
000a6a18  lsls    r3, r0, #3
000a6a1a  add     r2, pc ; -> 0x000a5991  t_friendship_complete
000a6a1c  adds    r3, r3, r5
000a6a1e  movs    r0, #0
000a6a20  str     r2, [r3, #4]
000a6a22  ldr.w   r3, [r5, #0xa4]
000a6a26  adds    r3, #1
000a6a28  str.w   r0, [r5, r3, lsl #3]
000a6a2c  b       #0xa69ac
000a6a2e  mov     r0, r4
000a6a30  movs    r3, #8
000a6a32  str     r3, [r4, #0x1c]
000a6a34  bl      #0x57be4 ; -> ochar_sound
000a6a38  ldr.w   r3, [r5, #0xa4]
000a6a3c  movs    r0, #0x40
000a6a3e  movw    r2, #0x375
000a6a42  adds    r3, #1
000a6a44  str.w   r2, [r5, r3, lsl #3]
000a6a48  str.w   r0, [r5, #0xfc]
000a6a4c  b       #0xa69ac
000a6a4e  movw    r3, #0x376
000a6a52  str.w   r3, [r5, r1, lsl #3]
000a6a56  ldr.w   r3, [r5, #0xa4]
000a6a5a  ldr     r2, [pc, #0x28]
000a6a5c  adds    r3, #1
000a6a5e  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a6a60  str.w   r3, [r5, #0xa4]
000a6a64  lsls    r3, r3, #3
000a6a66  b       #0xa6a1c
000a6a68  mov     r0, r4
000a6a6a  bl      #0x55394 ; -> flip_multi
000a6a6e  b       #0xa69c8
000a6a70  ldcl    p15, c15, [fp, #0x3fc]!
000a6a74  lsls    r3, r6, #2
000a6a76  movs    r0, r0
000a6a78  asrs    r0, r1, #4
000a6a7a  movs    r5, r1
000a6a7c  ldc     p15, c15, [r7], {0xff}
