========================================================================
t_skc_zap  0x000abf7c  132 bytes   mkboss.c
========================================================================

000abf7c  push    {r4, r5, r6, r7, lr}
000abf7e  add     r7, sp, #0xc
000abf80  ldr.w   r3, [r0, #0xa4]
000abf84  mov     r5, r0
000abf86  ldr.w   r4, [r0, #0x108]
000abf8a  adds    r3, #1
000abf8c  ldr.w   r6, [r0, r3, lsl #3]
000abf90  cbnz    r6, #0xabfc0
000abf92  mov.w   r3, #0x320
000abf96  mov     r0, r4
000abf98  str     r3, [r4, #0x1c]
000abf9a  bl      #0xab6bc ; -> bossrandper
000abf9e  ldr     r3, [r4, #0x5c]
000abfa0  cbnz    r3, #0xabfc6
000abfa2  ldr     r3, [pc, #0x4c]
000abfa4  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abfa6  ldr     r2, [r3]
000abfa8  ldr.w   r3, [r5, #0xa4]
000abfac  mov     r0, r6
000abfae  lsls    r3, r3, #3
000abfb0  adds    r3, r3, r5
000abfb2  str     r2, [r3, #4]
000abfb4  ldr.w   r3, [r5, #0xa4]
000abfb8  adds    r3, #1
000abfba  str.w   r6, [r5, r3, lsl #3]
000abfbe  b       #0xabfc4
000abfc0  mvn     r0, #2
000abfc4  pop     {r4, r5, r6, r7, pc}
000abfc6  mov     r0, r4
000abfc8  bl      #0xabcc4 ; -> sk_counter_randper
000abfcc  ldr     r3, [r4, #0x5c]
000abfce  cbnz    r3, #0xabfd6
000abfd0  ldr     r2, [pc, #0x20]
000abfd2  add     r2, pc ; -> 0x000a9ddd  t_sk_block_zap
000abfd4  b       #0xabfa8
000abfd6  mov     r0, r4
000abfd8  bl      #0x2f3a0 ; -> get_x_dist
000abfdc  ldr     r0, [r4, #0x28]
000abfde  cmp     r0, #0x6f
000abfe0  bgt     #0xabfe8
000abfe2  ldr     r2, [pc, #0x14]
000abfe4  add     r2, pc ; -> 0x000ab211  t_sk_charge
000abfe6  b       #0xabfa8
000abfe8  ldr     r2, [pc, #0x10]
000abfea  add     r2, pc ; -> 0x000a9019  t_sk_zap
000abfec  b       #0xabfa8
000abfee  nop     
000abff0  strb    r0, [r0, #0x12]
000abff2  movs    r4, r0
000abff4  udf     #7
