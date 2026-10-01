========================================================================
t_rhat_wake  0x00044bf0  112 bytes   mkreact.c
========================================================================

00044bf0  push    {r4, r5, r6, r7, lr}
00044bf2  add     r7, sp, #0xc
00044bf4  ldr.w   r3, [r0, #0xa4]
00044bf8  mov     r5, r0
00044bfa  ldr.w   r4, [r0, #0x108]
00044bfe  adds    r3, #1
00044c00  ldr.w   r6, [r0, r3, lsl #3]
00044c04  cbz     r6, #0x44c0c
00044c06  mvn     r0, #2
00044c0a  pop     {r4, r5, r6, r7, pc}
00044c0c  ldr     r3, [r4]
00044c0e  ldr     r3, [r3, #0x20]
00044c10  cmp     r3, #1
00044c12  str     r3, [r4, #0x1c]
00044c14  beq     #0x44c4a
00044c16  mov     r0, r4
00044c18  bl      #0x5a680 ; -> next_anirate
00044c1c  ldr     r3, [r4, #0x44]
00044c1e  subs    r3, #1
00044c20  cmp     r3, #0
00044c22  str     r3, [r4, #0x44]
00044c24  ble     #0x44c42
00044c26  ldr     r2, [pc, #0x30]
00044c28  add     r2, pc ; -> 0x00041a2d  t_rhat_sleep
00044c2a  ldr.w   r3, [r5, #0xa4]
00044c2e  mov     r0, r6
00044c30  lsls    r3, r3, #3
00044c32  adds    r3, r3, r5
00044c34  str     r2, [r3, #4]
00044c36  ldr.w   r3, [r5, #0xa4]
00044c3a  adds    r3, #1
00044c3c  str.w   r6, [r5, r3, lsl #3]
00044c40  b       #0x44c0a
00044c42  ldr     r3, [pc, #0x18]
00044c44  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00044c46  ldr     r2, [r3]
00044c48  b       #0x44c2a
00044c4a  mov     r0, r4
00044c4c  adds    r3, #4
00044c4e  str     r3, [r4, #0x1c]
00044c50  bl      #0x5877c ; -> create_blood_proc
00044c54  b       #0x44c16
00044c56  nop     
00044c58  ldm     r6!, {r0}
00044c5a  vtbx.8  d30, {d31, fpinst2, mvfr0}, d0
00044c5e  movs    r2, r1
