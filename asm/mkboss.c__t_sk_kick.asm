========================================================================
t_sk_kick  0x000aadc8  208 bytes   mkboss.c
========================================================================

000aadc8  push    {r4, r5, r6, r7, lr}
000aadca  add     r7, sp, #0xc
000aadcc  str     r8, [sp, #-0x4]!
000aadd0  ldr.w   r2, [r0, #0xa4]
000aadd4  movw    r8, #0x306
000aadd8  mov     r4, r0
000aadda  adds    r3, r2, #1
000aaddc  ldr.w   r5, [r0, #0x108]
000aade0  ldr.w   r6, [r0, r3, lsl #3]
000aade4  cmp     r6, r8
000aade6  beq     #0xaae60
000aade8  movw    r3, #0x309
000aadec  cmp     r6, r3
000aadee  beq     #0xaae48
000aadf0  cbz     r6, #0xaadfc
000aadf2  mvn     r0, #2
000aadf6  ldr     r8, [sp], #4
000aadfa  pop     {r4, r5, r6, r7, pc}
000aadfc  mov     r0, r5
000aadfe  bl      #0x587c8 ; -> init_special
000aae02  mov     r0, r5
000aae04  str     r6, [r5, #0x1c]
000aae06  bl      #0x580a4 ; -> group_sound
000aae0a  movs    r3, #0x11
000aae0c  str     r3, [r5, #0x40]
000aae0e  subs    r3, #0x10
000aae10  str     r6, [r5, #0x20]
000aae12  str     r3, [r5, #0x48]
000aae14  adds    r3, #1
000aae16  str     r3, [r5, #0x1c]
000aae18  str     r3, [r5, #0x44]
000aae1a  ldr.w   r3, [r4, #0xa4]
000aae1e  mov     r0, r6
000aae20  adds    r3, #1
000aae22  str.w   r8, [r4, r3, lsl #3]
000aae26  ldr.w   r3, [r4, #0xa4]
000aae2a  adds    r2, r3, #1
000aae2c  ldr     r3, [pc, #0x5c]
000aae2e  str.w   r2, [r4, #0xa4]
000aae32  add     r3, pc ; -> 0x000f3880  t_striker
000aae34  ldr     r1, [r3]
000aae36  lsls    r3, r2, #3
000aae38  adds    r3, r3, r4
000aae3a  str     r1, [r3, #4]
000aae3c  ldr.w   r3, [r4, #0xa4]
000aae40  adds    r3, #1
000aae42  str.w   r6, [r4, r3, lsl #3]
000aae46  b       #0xaadf6
000aae48  ldr     r1, [pc, #0x44]
000aae4a  lsls    r3, r2, #3
000aae4c  adds    r3, r3, r0
000aae4e  add     r1, pc ; -> 0x000a8929  t_boss_post_hit
000aae50  str     r1, [r3, #4]
000aae52  ldr.w   r3, [r0, #0xa4]
000aae56  movs    r0, #0
000aae58  adds    r3, #1
000aae5a  str.w   r0, [r4, r3, lsl #3]
000aae5e  b       #0xaadf6
000aae60  ldr     r0, [r5, #0x5c]
000aae62  cbz     r0, #0xaae74
000aae64  movs    r0, #0xe
000aae66  movw    r2, #0x309
000aae6a  str.w   r2, [r4, r3, lsl #3]
000aae6e  str.w   r0, [r4, #0xfc]
000aae72  b       #0xaadf6
000aae74  ldr     r1, [pc, #0x1c]
000aae76  lsls    r3, r2, #3
000aae78  adds    r3, r3, r4
000aae7a  add     r1, pc ; -> 0x000a895d  t_boss_close_miss
000aae7c  str     r1, [r3, #4]
000aae7e  ldr.w   r3, [r4, #0xa4]
000aae82  adds    r3, #1
000aae84  str.w   r0, [r4, r3, lsl #3]
000aae88  b       #0xaadf6
000aae8a  nop     
000aae8c  ldrh    r2, [r1, #0x12]
000aae8e  movs    r4, r0
000aae90  bge     #0xaae42
