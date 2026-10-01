========================================================================
tl_do_ind_zap  0x00079a9c  288 bytes   mkzap.c
========================================================================

00079a9c  push    {r4, r5, r6, r7, lr}
00079a9e  add     r7, sp, #0xc
00079aa0  str     r8, [sp, #-0x4]!
00079aa4  ldr.w   r3, [r0, #0xa4]
00079aa8  movw    r8, #0x1189
00079aac  mov     r5, r0
00079aae  adds    r3, #1
00079ab0  ldr.w   r4, [r0, #0x108]
00079ab4  ldr.w   r6, [r0, r3, lsl #3]
00079ab8  cmp     r6, r8
00079aba  beq     #0x79b42
00079abc  movw    r3, #0x1196
00079ac0  cmp     r6, r3
00079ac2  beq     #0x79b22
00079ac4  cbz     r6, #0x79ad0
00079ac6  mvn     r0, #2
00079aca  ldr     r8, [sp], #4
00079ace  pop     {r4, r5, r6, r7, pc}
00079ad0  movs    r3, #5
00079ad2  mov     r0, r4
00079ad4  str     r3, [r4, #0x20]
00079ad6  str     r6, [r4, #0x44]
00079ad8  bl      #0x79590 ; -> zap_init_special_act
00079adc  mov     r0, r4
00079ade  str     r6, [r4, #0x1c]
00079ae0  bl      #0x57be4 ; -> ochar_sound
00079ae4  ldr     r3, [pc, #0xbc]
00079ae6  mov     r0, r4
00079ae8  str     r3, [r4, #0x40]
00079aea  bl      #0x7582c ; -> q_his_react_flag_set
00079aee  ldr     r3, [r4, #0x5c]
00079af0  cmp     r3, #0
00079af2  bne     #0x79b9e
00079af4  ldr.w   r3, [r5, #0xa4]
00079af8  mov     r0, r6
00079afa  adds    r3, #1
00079afc  str.w   r8, [r5, r3, lsl #3]
00079b00  ldr.w   r3, [r5, #0xa4]
00079b04  adds    r2, r3, #1
00079b06  ldr     r3, [pc, #0xa0]
00079b08  str.w   r2, [r5, #0xa4]
00079b0c  add     r3, pc ; -> 0x000f36d0  t_animate_a9
00079b0e  ldr     r1, [r3]
00079b10  lsls    r3, r2, #3
00079b12  adds    r3, r3, r5
00079b14  str     r1, [r3, #4]
00079b16  ldr.w   r3, [r5, #0xa4]
00079b1a  adds    r3, #1
00079b1c  str.w   r6, [r5, r3, lsl #3]
00079b20  b       #0x79aca
00079b22  movs    r3, #1
00079b24  str     r3, [r4, #0x20]
00079b26  ldr.w   r3, [r0, #0xa4]
00079b2a  ldr     r2, [pc, #0x80]
00079b2c  lsls    r3, r3, #3
00079b2e  adds    r3, r3, r0
00079b30  add     r2, pc ; -> 0x00075699  tl_do_proj_sitting_duck
00079b32  str     r2, [r3, #4]
00079b34  ldr.w   r3, [r0, #0xa4]
00079b38  movs    r0, #0
00079b3a  adds    r3, #1
00079b3c  str.w   r0, [r5, r3, lsl #3]
00079b40  b       #0x79aca
00079b42  ldr     r3, [r4]
00079b44  mov.w   r8, #0
00079b48  mov     r0, r4
00079b4a  ldr     r6, [r3, #0x64]
00079b4c  str.w   r8, [r3, #0x64]
00079b50  ldr.w   r3, [pc, #0x5c]
00079b54  add     r3, pc ; -> 0x00076d79  tl_ind_zap_proc
00079b56  str     r3, [r4, #0x38]
00079b58  bl      #0x75964 ; -> create_proj_proc
00079b5c  ldr     r3, [r4]
00079b5e  mov     r0, r4
00079b60  str     r6, [r3, #0x64]
00079b62  bl      #0x758b0 ; -> i_am_a_sitting_duck
00079b66  movs    r3, #3
00079b68  str     r3, [r4, #0x1c]
00079b6a  ldr.w   r3, [r5, #0xa4]
00079b6e  movw    r2, #0x1196
00079b72  mov     r0, r8
00079b74  adds    r3, #1
00079b76  str.w   r2, [r5, r3, lsl #3]
00079b7a  ldr.w   r3, [r5, #0xa4]
00079b7e  adds    r2, r3, #1
00079b80  ldr.w   r3, [pc, #0x30]
00079b84  str.w   r2, [r5, #0xa4]
00079b88  add     r3, pc ; -> 0x000f37cc  t_mframew
00079b8a  ldr     r1, [r3]
00079b8c  lsls    r3, r2, #3
00079b8e  adds    r3, r3, r5
00079b90  str     r1, [r3, #4]
00079b92  ldr.w   r3, [r5, #0xa4]
00079b96  adds    r3, #1
00079b98  str.w   r8, [r5, r3, lsl #3]
00079b9c  b       #0x79aca
00079b9e  ldr     r3, [pc, #0x18]
00079ba0  str     r3, [r4, #0x40]
00079ba2  b       #0x79af4
00079ba4  movs    r4, r4
00079ba6  movs    r3, r0
00079ba8  ldr     r3, [sp, #0x300]
00079baa  movs    r7, r0
00079bac  cbnz    r5, #0x79c08
