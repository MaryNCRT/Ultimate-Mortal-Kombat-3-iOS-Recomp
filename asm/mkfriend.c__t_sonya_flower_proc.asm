========================================================================
t_sonya_flower_proc  0x000a6c88  228 bytes   mkfriend.c
========================================================================

000a6c88  push    {r4, r5, r6, r7, lr}
000a6c8a  add     r7, sp, #0xc
000a6c8c  ldr.w   r2, [r0, #0xa4]
000a6c90  mov     r5, r0
000a6c92  ldr.w   r4, [r0, #0x108]
000a6c96  adds    r3, r2, #1
000a6c98  ldr.w   r3, [r0, r3, lsl #3]
000a6c9c  cmp.w   r3, #0x1f6
000a6ca0  beq     #0xa6cf2
000a6ca2  cmp.w   r3, #0x210
000a6ca6  beq     #0xa6cd8
000a6ca8  cbz     r3, #0xa6cb0
000a6caa  mvn     r0, #2
000a6cae  pop     {r4, r5, r6, r7, pc}
000a6cb0  mov     r0, r4
000a6cb2  movs    r3, #0xa
000a6cb4  str     r3, [r4, #0x1c]
000a6cb6  bl      #0x58714 ; -> randu
000a6cba  ldr     r3, [r4, #0x1c]
000a6cbc  mov.w   r2, #0x1f6
000a6cc0  adds    r3, #0x14
000a6cc2  str     r3, [r4, #0x1c]
000a6cc4  ldr.w   r3, [r5, #0xa4]
000a6cc8  adds    r3, #1
000a6cca  str.w   r2, [r5, r3, lsl #3]
000a6cce  ldr     r3, [r4, #0x1c]
000a6cd0  str.w   r3, [r5, #0xfc]
000a6cd4  ldr     r0, [r4, #0x1c]
000a6cd6  b       #0xa6cae
000a6cd8  ldr     r3, [pc, #0x80]
000a6cda  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a6cdc  ldr     r1, [r3]
000a6cde  lsls    r3, r2, #3
000a6ce0  adds    r3, r3, r5
000a6ce2  movs    r0, #0
000a6ce4  str     r1, [r3, #4]
000a6ce6  ldr.w   r3, [r5, #0xa4]
000a6cea  adds    r3, #1
000a6cec  str.w   r0, [r5, r3, lsl #3]
000a6cf0  b       #0xa6cae
000a6cf2  ldr     r2, [r4, #8]
000a6cf4  movs    r3, #0xe6
000a6cf6  mov     r0, r4
000a6cf8  str     r3, [r2, #0x2c]
000a6cfa  adds    r3, #0xa9
000a6cfc  str     r3, [r4, #0x1c]
000a6cfe  bl      #0x58714 ; -> randu
000a6d02  ldr     r3, [r4, #0x1c]
000a6d04  subs    r3, #0xc7
000a6d06  str     r3, [r4, #0x1c]
000a6d08  ldr     r3, [pc, #0x54]
000a6d0a  add     r3, pc ; -> 0x000f357c  G
000a6d0c  ldr     r3, [r3]
000a6d0e  ldr.w   r6, [r3, #0xac]
000a6d12  ldr     r3, [r4, #8]
000a6d14  ldr     r0, [r3, #0x2c]
000a6d16  bl      #0x58468 ; -> GetFrameHeight
000a6d1a  ldr     r2, [r4, #8]
000a6d1c  rsb     r3, r0, r6
000a6d20  mov     r0, r4
000a6d22  strh    r3, [r2, #0x12]
000a6d24  movs    r3, #6
000a6d26  str     r3, [r4, #0x1c]
000a6d28  bl      #0x58714 ; -> randu
000a6d2c  ldr     r3, [r4, #0x1c]
000a6d2e  mov.w   r2, #0x210
000a6d32  adds    r3, #3
000a6d34  str     r3, [r4, #0x1c]
000a6d36  ldr.w   r3, [pc, #0x2c]
000a6d3a  add     r3, pc ; -> 0x001779ec  a_flower
000a6d3c  str     r3, [r4, #0x40]
000a6d3e  ldr.w   r3, [r5, #0xa4]
000a6d42  adds    r3, #1
000a6d44  str.w   r2, [r5, r3, lsl #3]
000a6d48  ldr.w   r3, [r5, #0xa4]
000a6d4c  adds    r2, r3, #1
000a6d4e  ldr.w   r3, [pc, #0x18]
000a6d52  str.w   r2, [r5, #0xa4]
000a6d56  add     r3, pc ; -> 0x000f37cc  t_mframew
000a6d58  b       #0xa6cdc
000a6d5a  nop     
000a6d5c  ldm     r2, {r1, r2, r6}
000a6d5e  movs    r4, r0
000a6d60  ldm     r0!, {r1, r2, r3, r5, r6}
000a6d62  movs    r4, r0
000a6d64  lsrs    r6, r5, #0x12
000a6d66  movs    r5, r1
000a6d68  ldm     r2!, {r1, r4, r5, r6}
000a6d6a  movs    r4, r0
