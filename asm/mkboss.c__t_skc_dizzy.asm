========================================================================
t_skc_dizzy  0x000abe00  292 bytes   mkboss.c
========================================================================

000abe00  push    {r4, r5, r6, r7, lr}
000abe02  add     r7, sp, #0xc
000abe04  push.w  {r8, sl}
000abe08  ldr.w   r2, [r0, #0xa4]
000abe0c  movw    sl, #0x5f6
000abe10  mov     r4, r0
000abe12  adds    r3, r2, #1
000abe14  ldr.w   r6, [r0, #0x108]
000abe18  ldr.w   r5, [r0, r3, lsl #3]
000abe1c  cmp     r5, sl
000abe1e  beq     #0xabe82
000abe20  cmp.w   r5, #0x5f8
000abe24  beq     #0xabe66
000abe26  cbz     r5, #0xabe32
000abe28  mvn     r0, #2
000abe2c  pop.w   {r8, sl}
000abe30  pop     {r4, r5, r6, r7, pc}
000abe32  mov.w   r3, #0x1f4
000abe36  mov     r0, r6
000abe38  str     r3, [r6, #0x1c]
000abe3a  bl      #0xab6bc ; -> bossrandper
000abe3e  ldr.w   r8, [r6, #0x5c]
000abe42  cmp.w   r8, #0
000abe46  beq     #0xabea4
000abe48  ldr     r3, [pc, #0xc0]
000abe4a  mov     r0, r5
000abe4c  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abe4e  ldr     r2, [r3]
000abe50  ldr.w   r3, [r4, #0xa4]
000abe54  lsls    r3, r3, #3
000abe56  adds    r3, r3, r4
000abe58  str     r2, [r3, #4]
000abe5a  ldr.w   r3, [r4, #0xa4]
000abe5e  adds    r3, #1
000abe60  str.w   r5, [r4, r3, lsl #3]
000abe64  b       #0xabe2c
000abe66  ldr.w   r3, [pc, #0xa8]
000abe6a  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000abe6c  ldr     r1, [r3]
000abe6e  lsls    r3, r2, #3
000abe70  adds    r3, r3, r4
000abe72  movs    r0, #0
000abe74  str     r1, [r3, #4]
000abe76  ldr.w   r3, [r4, #0xa4]
000abe7a  adds    r3, #1
000abe7c  str.w   r0, [r4, r3, lsl #3]
000abe80  b       #0xabe2c
000abe82  movs    r3, #0x40
000abe84  str     r3, [r6, #0x44]
000abe86  ldr.w   r3, [r0, #0xa4]
000abe8a  mov.w   r2, #0x5f8
000abe8e  adds    r3, #1
000abe90  str.w   r2, [r0, r3, lsl #3]
000abe94  ldr.w   r3, [r0, #0xa4]
000abe98  adds    r2, r3, #1
000abe9a  ldr     r3, [pc, #0x78]
000abe9c  str.w   r2, [r0, #0xa4]
000abea0  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000abea2  b       #0xabe6c
000abea4  mov.w   r3, #0x190
000abea8  mov     r0, r6
000abeaa  str     r3, [r6, #0x1c]
000abeac  bl      #0xab5f0 ; -> bossrandper_org
000abeb0  ldr     r0, [r6, #0x5c]
000abeb2  cbz     r0, #0xabed2
000abeb4  ldr.w   r3, [r4, #0xa4]
000abeb8  ldr.w   r2, [pc, #0x5c]
000abebc  mov     r0, r8
000abebe  lsls    r3, r3, #3
000abec0  adds    r3, r3, r4
000abec2  add     r2, pc ; -> 0x000aaf69  t_sk_laugh
000abec4  str     r2, [r3, #4]
000abec6  ldr.w   r3, [r4, #0xa4]
000abeca  adds    r3, #1
000abecc  str.w   r8, [r4, r3, lsl #3]
000abed0  b       #0xabe2c
000abed2  movs    r3, #0xc0
000abed4  str     r3, [r6, #0x44]
000abed6  ldr     r3, [pc, #0x44]
000abed8  add     r3, pc ; -> 0x000aa02d  q_is_he_dizzy_boss
000abeda  str     r3, [r6, #0x48]
000abedc  ldr.w   r3, [r4, #0xa4]
000abee0  adds    r3, #1
000abee2  str.w   sl, [r4, r3, lsl #3]
000abee6  ldr.w   r3, [r4, #0xa4]
000abeea  adds    r2, r3, #1
000abeec  ldr.w   r3, [pc, #0x30]
000abef0  str.w   r2, [r4, #0xa4]
000abef4  add     r3, pc ; -> 0x000f3408  t_stance_wait_no
000abef6  ldr     r1, [r3]
000abef8  lsls    r3, r2, #3
000abefa  adds    r3, r3, r4
000abefc  str     r1, [r3, #4]
000abefe  ldr.w   r3, [r4, #0xa4]
000abf02  adds    r3, #1
000abf04  str.w   r0, [r4, r3, lsl #3]
000abf08  b       #0xabe2c
000abf0a  nop     
000abf0c  strb    r0, [r3, #0x17]
000abf0e  movs    r4, r0
000abf10  ldrb    r2, [r3, #2]
000abf12  movs    r4, r0
000abf14  strb    r0, [r3, #0x15]
000abf16  movs    r4, r0
000abf18  bl      #0x14ff1a
000abf1c  b       #0xac1c2
000abf1e  vsli.32 d23, d0, #0x1f
000abf22  movs    r4, r0
