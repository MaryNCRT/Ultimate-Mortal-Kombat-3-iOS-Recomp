========================================================================
t_swat_crossing_people  0x000a6a88  268 bytes   mkfriend.c
========================================================================

000a6a88  push    {r4, r5, r6, r7, lr}
000a6a8a  add     r7, sp, #0xc
000a6a8c  ldr.w   r3, [r0, #0xa4]
000a6a90  movw    r6, #0x311
000a6a94  mov     r5, r0
000a6a96  adds    r3, #1
000a6a98  ldr.w   r4, [r0, #0x108]
000a6a9c  ldr.w   r3, [r0, r3, lsl #3]
000a6aa0  cmp     r3, r6
000a6aa2  beq     #0xa6b68
000a6aa4  ble     #0xa6aba
000a6aa6  movw    r2, #0x317
000a6aaa  cmp     r3, r2
000a6aac  beq     #0xa6b08
000a6aae  adds    r2, #0x2c
000a6ab0  cmp     r3, r2
000a6ab2  beq     #0xa6ae4
000a6ab4  mvn     r0, #2
000a6ab8  pop     {r4, r5, r6, r7, pc}
000a6aba  cmp     r3, #0
000a6abc  bne     #0xa6ab4
000a6abe  ldr     r2, [r4, #8]
000a6ac0  movs    r3, #1
000a6ac2  mov     r0, r4
000a6ac4  str     r3, [r2, #0x48]
000a6ac6  adds    r3, #0x1f
000a6ac8  str     r3, [r4, #0x1c]
000a6aca  str     r3, [r4, #0x20]
000a6acc  bl      #0x58764 ; -> randu_minimum
000a6ad0  ldr.w   r3, [r5, #0xa4]
000a6ad4  adds    r3, #1
000a6ad6  str.w   r6, [r5, r3, lsl #3]
000a6ada  ldr     r3, [r4, #0x1c]
000a6adc  str.w   r3, [r5, #0xfc]
000a6ae0  ldr     r0, [r4, #0x1c]
000a6ae2  b       #0xa6ab8
000a6ae4  mov     r0, r4
000a6ae6  bl      #0x5a680 ; -> next_anirate
000a6aea  ldr     r3, [r4, #0x44]
000a6aec  subs    r3, #1
000a6aee  str     r3, [r4, #0x44]
000a6af0  cbnz    r3, #0xa6b52
000a6af2  ldr.w   r3, [r5, #0xa4]
000a6af6  ldr     r0, [pc, #0x90]
000a6af8  mov.w   r2, #0x348
000a6afc  adds    r3, #1
000a6afe  str.w   r2, [r5, r3, lsl #3]
000a6b02  str.w   r0, [r5, #0xfc]
000a6b06  b       #0xa6ab8
000a6b08  ldr     r3, [r4, #0x48]
000a6b0a  ldr.w   r2, [pc, #0x80]
000a6b0e  ldr     r1, [r4, #8]
000a6b10  mov     r0, r4
000a6b12  add     r2, pc ; -> 0x00177b68  swat_people
000a6b14  lsls    r3, r3, #2
000a6b16  adds    r3, r3, r2
000a6b18  mov.w   r2, #0x80000
000a6b1c  ldr     r3, [r3, #-0x4]
000a6b20  str     r3, [r1, #0x24]
000a6b22  ldr     r3, [r4, #8]
000a6b24  str     r2, [r4, #0x38]
000a6b26  str     r2, [r3, #0x18]
000a6b28  ldr.w   r3, [pc, #0x64]
000a6b2c  ldr     r2, [r4, #8]
000a6b2e  add     r3, pc ; -> 0x000f357c  G
000a6b30  ldr     r3, [r3]
000a6b32  ldr.w   r3, [r3, #0x468]
000a6b36  subs    r3, #0x50
000a6b38  str     r3, [r4, #0x1c]
000a6b3a  strh    r3, [r2, #0xe]
000a6b3c  movs    r3, #0x46
000a6b3e  str     r3, [r4, #0x40]
000a6b40  bl      #0x5520c ; -> get_char_ani
000a6b44  mov     r0, r4
000a6b46  movs    r3, #3
000a6b48  str     r3, [r4, #0x1c]
000a6b4a  bl      #0x553a0 ; -> init_anirate
000a6b4e  movs    r3, #0xa0
000a6b50  str     r3, [r4, #0x44]
000a6b52  ldr.w   r3, [r5, #0xa4]
000a6b56  movs    r0, #1
000a6b58  movw    r2, #0x343
000a6b5c  adds    r3, #1
000a6b5e  str.w   r2, [r5, r3, lsl #3]
000a6b62  str.w   r0, [r5, #0xfc]
000a6b66  b       #0xa6ab8
000a6b68  ldr     r3, [r4, #0x48]
000a6b6a  movw    r2, #0x317
000a6b6e  lsls    r3, r3, #5
000a6b70  str     r3, [r4, #0x1c]
000a6b72  ldr.w   r3, [r0, #0xa4]
000a6b76  adds    r3, #1
000a6b78  str.w   r2, [r0, r3, lsl #3]
000a6b7c  ldr     r3, [r4, #0x1c]
000a6b7e  str.w   r3, [r0, #0xfc]
000a6b82  ldr     r0, [r4, #0x1c]
000a6b84  b       #0xa6ab8
000a6b86  nop     
000a6b88  str     r2, [r4, #0x44]
000a6b8a  movs    r1, r0
000a6b8c  asrs    r2, r2, #1
000a6b8e  movs    r5, r1
000a6b90  ldm     r2!, {r1, r3, r6}
000a6b92  movs    r4, r0
