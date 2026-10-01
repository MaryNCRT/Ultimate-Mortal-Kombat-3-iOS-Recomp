========================================================================
t_mc_stationary  0x000ab828  104 bytes   mkboss.c
========================================================================

000ab828  push    {r4, r5, r6, r7, lr}
000ab82a  add     r7, sp, #0xc
000ab82c  ldr.w   r3, [r0, #0xa4]
000ab830  mov     r4, r0
000ab832  ldr.w   r5, [r0, #0x108]
000ab836  adds    r3, #1
000ab838  ldr.w   r6, [r0, r3, lsl #3]
000ab83c  cbnz    r6, #0xab866
000ab83e  mov     r0, r5
000ab840  bl      #0xab804 ; -> motaro_randper
000ab844  ldr     r3, [r5, #0x5c]
000ab846  cbnz    r3, #0xab86c
000ab848  ldr     r3, [pc, #0x38]
000ab84a  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000ab84c  ldr     r2, [r3]
000ab84e  ldr.w   r3, [r4, #0xa4]
000ab852  mov     r0, r6
000ab854  lsls    r3, r3, #3
000ab856  adds    r3, r3, r4
000ab858  str     r2, [r3, #4]
000ab85a  ldr.w   r3, [r4, #0xa4]
000ab85e  adds    r3, #1
000ab860  str.w   r6, [r4, r3, lsl #3]
000ab864  b       #0xab86a
000ab866  mvn     r0, #2
000ab86a  pop     {r4, r5, r6, r7, pc}
000ab86c  mov     r0, r5
000ab86e  bl      #0x2f3a0 ; -> get_x_dist
000ab872  ldr     r0, [r5, #0x28]
000ab874  cmp     r0, #0x8a
000ab876  ble     #0xab87e
000ab878  ldr     r2, [pc, #0xc]
000ab87a  add     r2, pc ; -> 0x000a858d  t_b_return_to_beware_4get
000ab87c  b       #0xab84e
000ab87e  ldr     r2, [pc, #0xc]
000ab880  add     r2, pc ; -> 0x000a9cfd  t_b_block
000ab882  b       #0xab84e
000ab884  ldrb    r2, [r3, #0xf]
000ab886  movs    r4, r0
000ab888  ldm     r5!, {r0, r1, r2, r3}
