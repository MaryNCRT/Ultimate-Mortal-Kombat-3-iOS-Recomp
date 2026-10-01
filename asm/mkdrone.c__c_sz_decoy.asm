========================================================================
c_sz_decoy  0x0006ccac  144 bytes   mkdrone.c
========================================================================

0006ccac  push    {r4, r5, r7, lr}
0006ccae  add     r7, sp, #8
0006ccb0  ldr.w   r3, [r0, #0xa4]
0006ccb4  mov     r4, r0
0006ccb6  ldr.w   r5, [r0, #0x108]
0006ccba  adds    r3, #1
0006ccbc  ldr.w   r3, [r0, r3, lsl #3]
0006ccc0  cbz     r3, #0x6ccc8
0006ccc2  mvn     r0, #2
0006ccc6  pop     {r4, r5, r7, pc}
0006ccc8  ldr     r3, [pc, #0x60]
0006ccca  add     r3, pc ; -> 0x000f357c  G
0006cccc  ldr     r3, [r3]
0006ccce  ldrsh.w r3, [r3, #0x44c]
0006ccd2  cmp     r3, #2
0006ccd4  str     r3, [r5, #0x1c]
0006ccd6  ble     #0x6ccfe
0006ccd8  ldr     r3, [r5, #8]
0006ccda  ldr     r2, [pc, #0x54]
0006ccdc  movs    r0, #0
0006ccde  ldr     r3, [r3, #0x24]
0006cce0  add     r2, pc ; -> 0x00171f30  tab_counter_decoy
0006cce2  ldr.w   r2, [r2, r3, lsl #2]
0006cce6  str     r2, [r5, #0x1c]
0006cce8  ldr.w   r3, [r4, #0xa4]
0006ccec  lsls    r3, r3, #3
0006ccee  adds    r3, r3, r4
0006ccf0  str     r2, [r3, #4]
0006ccf2  ldr.w   r3, [r4, #0xa4]
0006ccf6  adds    r3, #1
0006ccf8  str.w   r0, [r4, r3, lsl #3]
0006ccfc  b       #0x6ccc6
0006ccfe  ldr     r3, [pc, #0x34]
0006cd00  mov     r0, r5
0006cd02  add     r3, pc ; -> 0x00171fa8  rpt_counter
0006cd04  str     r3, [r5, #0x1c]
0006cd06  bl      #0x6c9c8 ; -> ask_mr_diff
0006cd0a  ldr     r0, [r5, #0x5c]
0006cd0c  cmp     r0, #0
0006cd0e  bne     #0x6ccd8
0006cd10  ldr.w   r3, [r4, #0xa4]
0006cd14  ldr     r2, [pc, #0x20]
0006cd16  lsls    r3, r3, #3
0006cd18  adds    r3, r3, r4
0006cd1a  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006cd1c  str     r2, [r3, #4]
0006cd1e  ldr.w   r3, [r4, #0xa4]
0006cd22  adds    r3, #1
0006cd24  str.w   r0, [r4, r3, lsl #3]
0006cd28  b       #0x6ccc6
0006cd2a  nop     
0006cd2c  ldr     r6, [r5, #8]
0006cd2e  movs    r0, r1
0006cd30  strh    r4, [r1, r1]
0006cd32  movs    r0, r2
0006cd34  strh    r2, [r4, r2]
0006cd36  movs    r0, r2
0006cd38  bl      #0xffcd4d3a
