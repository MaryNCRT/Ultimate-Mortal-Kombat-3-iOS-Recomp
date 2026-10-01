========================================================================
t_r_combo1  0x00045ab0  156 bytes   mkreact.c
========================================================================

00045ab0  push    {r4, r5, r6, r7, lr}
00045ab2  add     r7, sp, #0xc
00045ab4  ldr.w   r3, [r0, #0xa4]
00045ab8  mov     r4, r0
00045aba  ldr.w   r5, [r0, #0x108]
00045abe  adds    r3, #1
00045ac0  ldr.w   r6, [r0, r3, lsl #3]
00045ac4  cbnz    r6, #0x45b08
00045ac6  mov     r0, r5
00045ac8  bl      #0x424e0 ; -> combo_setup
00045acc  ldr     r3, [pc, #0x70]
00045ace  str     r6, [r5, #0x38]
00045ad0  movw    r2, #0xc66
00045ad4  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
00045ad6  str     r3, [r5, #0x30]
00045ad8  movs    r3, #5
00045ada  str     r3, [r5, #0x34]
00045adc  ldr.w   r3, [r4, #0xa4]
00045ae0  mov     r0, r6
00045ae2  adds    r3, #1
00045ae4  str.w   r2, [r4, r3, lsl #3]
00045ae8  ldr.w   r3, [r4, #0xa4]
00045aec  ldr     r2, [pc, #0x54]
00045aee  adds    r3, #1
00045af0  str.w   r3, [r4, #0xa4]
00045af4  lsls    r3, r3, #3
00045af6  adds    r3, r3, r4
00045af8  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045afa  str     r2, [r3, #4]
00045afc  ldr.w   r3, [r4, #0xa4]
00045b00  adds    r3, #1
00045b02  str.w   r6, [r4, r3, lsl #3]
00045b06  pop     {r4, r5, r6, r7, pc}
00045b08  movw    r3, #0xc66
00045b0c  cmp     r6, r3
00045b0e  it      ne
00045b10  mvnne   r0, #2
00045b14  bne     #0x45b06
00045b16  mov     r0, r5
00045b18  bl      #0x54f20 ; -> set_no_block
00045b1c  mov     r0, r5
00045b1e  movs    r1, #0xa
00045b20  bl      #0x57dbc ; -> rsnd_func
00045b24  ldr.w   r3, [r4, #0xa4]
00045b28  ldr     r2, [pc, #0x1c]
00045b2a  movs    r0, #0
00045b2c  lsls    r3, r3, #3
00045b2e  adds    r3, r3, r4
00045b30  add     r2, pc ; -> 0x00045281  t_combo1
00045b32  str     r2, [r3, #4]
00045b34  ldr.w   r3, [r4, #0xa4]
00045b38  adds    r3, #1
00045b3a  str.w   r0, [r4, r3, lsl #3]
00045b3e  b       #0x45b06
00045b40  ldm     r5!, {r0, r2, r6, r7}
