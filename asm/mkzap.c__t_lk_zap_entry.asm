========================================================================
t_lk_zap_entry  0x000759dc  268 bytes   mkzap.c
========================================================================

000759dc  push    {r4, r7, lr}
000759de  add     r7, sp, #4
000759e0  mov     r4, r0
000759e2  ldr.w   r3, [r4, #0xa4]
000759e6  movw    r1, #0xa4f
000759ea  ldr.w   r0, [r0, #0x108]
000759ee  adds    r3, #1
000759f0  ldr.w   r3, [r4, r3, lsl #3]
000759f4  cmp     r3, r1
000759f6  beq     #0x75a70
000759f8  ble     #0x75a0e
000759fa  movw    r2, #0xa52
000759fe  cmp     r3, r2
00075a00  beq     #0x75a96
00075a02  adds    r2, #3
00075a04  cmp     r3, r2
00075a06  beq     #0x75a4a
00075a08  mvn     r0, #2
00075a0c  pop     {r4, r7, pc}
00075a0e  cmp     r3, #0
00075a10  bne     #0x75a08
00075a12  movs    r2, #0x11
00075a14  str     r2, [r0, #0x1c]
00075a16  ldr     r2, [pc, #0xa8]
00075a18  str     r2, [r0, #0x20]
00075a1a  ldr     r2, [pc, #0xa8]
00075a1c  str     r2, [r0, #0x24]
00075a1e  ldr.w   r2, [r4, #0xa4]
00075a22  mov     r0, r3
00075a24  adds    r2, #1
00075a26  str.w   r1, [r4, r2, lsl #3]
00075a2a  ldr.w   r2, [r4, #0xa4]
00075a2e  ldr     r1, [pc, #0x98]
00075a30  adds    r2, #1
00075a32  str.w   r2, [r4, #0xa4]
00075a36  lsls    r2, r2, #3
00075a38  adds    r2, r2, r4
00075a3a  add     r1, pc ; -> 0x000770bd  t_lk_prezap
00075a3c  str     r1, [r2, #4]
00075a3e  ldr.w   r2, [r4, #0xa4]
00075a42  adds    r2, #1
00075a44  str.w   r3, [r4, r2, lsl #3]
00075a48  b       #0x75a0c
00075a4a  ldr     r3, [pc, #0x80]
00075a4c  add     r3, pc ; -> 0x00077815  t_lk_zap_proc
00075a4e  str     r3, [r0, #0x38]
00075a50  bl      #0x75964 ; -> create_proj_proc
00075a54  ldr     r2, [pc, #0x78]
00075a56  ldr.w   r3, [r4, #0xa4]
00075a5a  add     r2, pc ; -> 0x0007919d  t_lkzap5
00075a5c  lsls    r3, r3, #3
00075a5e  adds    r3, r3, r4
00075a60  movs    r0, #0
00075a62  str     r2, [r3, #4]
00075a64  ldr.w   r3, [r4, #0xa4]
00075a68  adds    r2, r3, #1
00075a6a  str.w   r0, [r4, r2, lsl #3]
00075a6e  b       #0x75a0c
00075a70  ldr     r3, [pc, #0x60]
00075a72  movw    r2, #0xa52
00075a76  str     r3, [r0, #0x20]
00075a78  ldr     r3, [pc, #0x5c]
00075a7a  str     r3, [r0, #0x24]
00075a7c  ldr.w   r3, [r4, #0xa4]
00075a80  adds    r3, #1
00075a82  str.w   r2, [r4, r3, lsl #3]
00075a86  ldr     r2, [pc, #0x54]
00075a88  ldr.w   r3, [r4, #0xa4]
00075a8c  add     r2, pc ; -> 0x000770bd  t_lk_prezap
00075a8e  adds    r3, #1
00075a90  str.w   r3, [r4, #0xa4]
00075a94  b       #0x75a5c
00075a96  ldr.w   r3, [pc, #0x48]
00075a9a  movw    r2, #0xa55
00075a9e  str     r3, [r0, #0x20]
00075aa0  ldr     r3, [pc, #0x20]
00075aa2  str     r3, [r0, #0x24]
00075aa4  ldr.w   r3, [r4, #0xa4]
00075aa8  adds    r3, #1
00075aaa  str.w   r2, [r4, r3, lsl #3]
00075aae  ldr     r2, [pc, #0x34]
00075ab0  ldr.w   r3, [r4, #0xa4]
00075ab4  add     r2, pc ; -> 0x000770bd  t_lk_prezap
00075ab6  adds    r3, #1
00075ab8  str.w   r3, [r4, #0xa4]
00075abc  b       #0x75a5c
00075abe  nop     
00075ac0  lsls    r0, r0, #2
00075ac2  movs    r6, r1
00075ac4  lsls    r1, r6, #1
00075ac6  movs    r3, r2
00075ac8  asrs    r7, r7, #0x19
00075aca  movs    r0, r0
00075acc  adds    r5, r0, #7
00075ace  movs    r0, r0
00075ad0  adds    r7, #0x3f
00075ad2  movs    r0, r0
00075ad4  lsls    r4, r4, #2
00075ad6  movs    r0, r2
00075ad8  lsls    r7, r3, #1
00075ada  movs    r3, r2
00075adc  asrs    r5, r5, #0x18
00075ade  movs    r0, r0
00075ae0  lsls    r0, r2, #3
00075ae2  movs    r0, r2
00075ae4  asrs    r5, r0, #0x18
00075ae6  movs    r0, r0
