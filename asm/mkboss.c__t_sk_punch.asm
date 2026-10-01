========================================================================
t_sk_punch  0x000aacf8  208 bytes   mkboss.c
========================================================================

000aacf8  push    {r4, r5, r6, r7, lr}
000aacfa  add     r7, sp, #0xc
000aacfc  str     r8, [sp, #-0x4]!
000aad00  ldr.w   r2, [r0, #0xa4]
000aad04  movw    r8, #0x31a
000aad08  mov     r4, r0
000aad0a  adds    r3, r2, #1
000aad0c  ldr.w   r5, [r0, #0x108]
000aad10  ldr.w   r6, [r0, r3, lsl #3]
000aad14  cmp     r6, r8
000aad16  beq     #0xaad90
000aad18  movw    r3, #0x31d
000aad1c  cmp     r6, r3
000aad1e  beq     #0xaad78
000aad20  cbz     r6, #0xaad2c
000aad22  mvn     r0, #2
000aad26  ldr     r8, [sp], #4
000aad2a  pop     {r4, r5, r6, r7, pc}
000aad2c  mov     r0, r5
000aad2e  bl      #0x587c8 ; -> init_special
000aad32  mov     r0, r5
000aad34  str     r6, [r5, #0x1c]
000aad36  bl      #0x580a4 ; -> group_sound
000aad3a  movs    r3, #0xe
000aad3c  str     r3, [r5, #0x40]
000aad3e  subs    r3, #0xb
000aad40  str     r6, [r5, #0x48]
000aad42  str     r3, [r5, #0x1c]
000aad44  str     r6, [r5, #0x20]
000aad46  subs    r3, #2
000aad48  str     r3, [r5, #0x44]
000aad4a  ldr.w   r3, [r4, #0xa4]
000aad4e  mov     r0, r6
000aad50  adds    r3, #1
000aad52  str.w   r8, [r4, r3, lsl #3]
000aad56  ldr.w   r3, [r4, #0xa4]
000aad5a  adds    r2, r3, #1
000aad5c  ldr     r3, [pc, #0x5c]
000aad5e  str.w   r2, [r4, #0xa4]
000aad62  add     r3, pc ; -> 0x000f3880  t_striker
000aad64  ldr     r1, [r3]
000aad66  lsls    r3, r2, #3
000aad68  adds    r3, r3, r4
000aad6a  str     r1, [r3, #4]
000aad6c  ldr.w   r3, [r4, #0xa4]
000aad70  adds    r3, #1
000aad72  str.w   r6, [r4, r3, lsl #3]
000aad76  b       #0xaad26
000aad78  ldr     r1, [pc, #0x44]
000aad7a  lsls    r3, r2, #3
000aad7c  adds    r3, r3, r0
000aad7e  add     r1, pc ; -> 0x000a8929  t_boss_post_hit
000aad80  str     r1, [r3, #4]
000aad82  ldr.w   r3, [r0, #0xa4]
000aad86  movs    r0, #0
000aad88  adds    r3, #1
000aad8a  str.w   r0, [r4, r3, lsl #3]
000aad8e  b       #0xaad26
000aad90  ldr     r0, [r5, #0x5c]
000aad92  cbz     r0, #0xaada4
000aad94  movs    r0, #0xe
000aad96  movw    r2, #0x31d
000aad9a  str.w   r2, [r4, r3, lsl #3]
000aad9e  str.w   r0, [r4, #0xfc]
000aada2  b       #0xaad26
000aada4  ldr     r1, [pc, #0x1c]
000aada6  lsls    r3, r2, #3
000aada8  adds    r3, r3, r4
000aadaa  add     r1, pc ; -> 0x000a895d  t_boss_close_miss
000aadac  str     r1, [r3, #4]
000aadae  ldr.w   r3, [r4, #0xa4]
000aadb2  adds    r3, #1
000aadb4  str.w   r0, [r4, r3, lsl #3]
000aadb8  b       #0xaad26
000aadba  nop     
000aadbc  ldrh    r2, [r3, #0x18]
000aadbe  movs    r4, r0
000aadc0  blt     #0xaad12
000aadc2  vtbl.8  d29, {d31, fpinst2, mvfr0, mvfr1}, d31
