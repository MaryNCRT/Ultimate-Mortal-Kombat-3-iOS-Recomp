========================================================================
t_fr_mileena  0x000a6ff4  248 bytes   mkfriend.c
========================================================================

000a6ff4  push    {r4, r5, r6, r7, lr}
000a6ff6  add     r7, sp, #0xc
000a6ff8  ldr.w   r2, [r0, #0xa4]
000a6ffc  mov     r4, r0
000a6ffe  ldr.w   r6, [r0, #0x108]
000a7002  adds    r3, r2, #1
000a7004  ldr.w   r5, [r0, r3, lsl #3]
000a7008  cmp     r5, #0x74
000a700a  beq     #0xa7088
000a700c  ble     #0xa701c
000a700e  cmp     r5, #0x79
000a7010  beq     #0xa70be
000a7012  cmp     r5, #0x7b
000a7014  beq     #0xa706e
000a7016  mvn     r0, #2
000a701a  pop     {r4, r5, r6, r7, pc}
000a701c  cbz     r5, #0xa7030
000a701e  cmp     r5, #0x73
000a7020  bne     #0xa7016
000a7022  movs    r2, #0x74
000a7024  str.w   r2, [r0, r3, lsl #3]
000a7028  movs    r0, #0x60
000a702a  str.w   r0, [r4, #0xfc]
000a702e  b       #0xa701a
000a7030  mov     r0, r6
000a7032  movs    r3, #0x1a
000a7034  str     r3, [r6, #0x40]
000a7036  bl      #0x55228 ; -> get_char_ani2
000a703a  movs    r3, #5
000a703c  str     r3, [r6, #0x1c]
000a703e  ldr.w   r3, [r4, #0xa4]
000a7042  movs    r2, #0x73
000a7044  mov     r0, r5
000a7046  adds    r3, #1
000a7048  str.w   r2, [r4, r3, lsl #3]
000a704c  ldr.w   r3, [r4, #0xa4]
000a7050  adds    r2, r3, #1
000a7052  ldr     r3, [pc, #0x88]
000a7054  str.w   r2, [r4, #0xa4]
000a7058  add     r3, pc ; -> 0x000f37cc  t_mframew
000a705a  ldr     r1, [r3]
000a705c  lsls    r3, r2, #3
000a705e  adds    r3, r3, r4
000a7060  str     r1, [r3, #4]
000a7062  ldr.w   r3, [r4, #0xa4]
000a7066  adds    r3, #1
000a7068  str.w   r5, [r4, r3, lsl #3]
000a706c  b       #0xa701a
000a706e  ldr.w   r1, [pc, #0x70]
000a7072  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a7074  lsls    r3, r2, #3
000a7076  adds    r3, r3, r4
000a7078  movs    r0, #0
000a707a  str     r1, [r3, #4]
000a707c  ldr.w   r3, [r4, #0xa4]
000a7080  adds    r3, #1
000a7082  str.w   r0, [r4, r3, lsl #3]
000a7086  b       #0xa701a
000a7088  movs    r1, #1
000a708a  mov     r0, r6
000a708c  bl      #0x57dd0 ; -> tsound_func
000a7090  ldr     r3, [pc, #0x50]
000a7092  mov     r0, r6
000a7094  str     r3, [r6, #0x48]
000a7096  bl      #0x581e0 ; -> shake_a11
000a709a  movs    r3, #4
000a709c  str     r3, [r6, #0x1c]
000a709e  ldr.w   r3, [r4, #0xa4]
000a70a2  movs    r2, #0x79
000a70a4  adds    r3, #1
000a70a6  str.w   r2, [r4, r3, lsl #3]
000a70aa  ldr.w   r3, [r4, #0xa4]
000a70ae  adds    r2, r3, #1
000a70b0  ldr.w   r3, [pc, #0x34]
000a70b4  str.w   r2, [r4, #0xa4]
000a70b8  add     r3, pc ; -> 0x000f37cc  t_mframew
000a70ba  ldr     r1, [r3]
000a70bc  b       #0xa7074
000a70be  mov     r0, r6
000a70c0  movs    r1, #0x66
000a70c2  bl      #0x57dd0 ; -> tsound_func
000a70c6  ldr.w   r3, [r4, #0xa4]
000a70ca  movs    r2, #0x7b
000a70cc  movs    r0, #0x20
000a70ce  adds    r3, #1
000a70d0  str.w   r2, [r4, r3, lsl #3]
000a70d4  str.w   r0, [r4, #0xfc]
000a70d8  b       #0xa701a
000a70da  nop     
000a70dc  stm     r7!, {r4, r5, r6}
000a70de  movs    r4, r0
000a70e0  ldmdb   fp, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr, pc}
000a70e4  movs    r0, r1
000a70e6  movs    r7, r0
000a70e8  stm     r7!, {r4}
000a70ea  movs    r4, r0
