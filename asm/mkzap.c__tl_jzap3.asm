========================================================================
tl_jzap3  0x0007aafc  348 bytes   mkzap.c
========================================================================

0007aafc  push    {r4, r5, r6, r7, lr}
0007aafe  add     r7, sp, #0xc
0007ab00  ldr.w   r2, [r0, #0xa4]
0007ab04  movw    r1, #0x5af
0007ab08  mov     r5, r0
0007ab0a  adds    r3, r2, #1
0007ab0c  ldr.w   r4, [r0, #0x108]
0007ab10  ldr.w   r3, [r0, r3, lsl #3]
0007ab14  cmp     r3, r1
0007ab16  beq     #0x7abe0
0007ab18  ble     #0x7ab2e
0007ab1a  movw    r1, #0x5ca
0007ab1e  cmp     r3, r1
0007ab20  beq     #0x7ac16
0007ab22  adds    r1, #2
0007ab24  cmp     r3, r1
0007ab26  beq     #0x7abd2
0007ab28  mvn     r0, #2
0007ab2c  pop     {r4, r5, r6, r7, pc}
0007ab2e  cmp     r3, #0
0007ab30  bne     #0x7ab98
0007ab32  ldr     r3, [r4, #8]
0007ab34  ldr     r2, [r3, #0x28]
0007ab36  tst.w   r2, #0x10
0007ab3a  beq     #0x7ac3a
0007ab3c  ldrh    r2, [r3, #0xe]
0007ab3e  adds    r2, #0xa
0007ab40  strh    r2, [r3, #0xe]
0007ab42  ldr     r2, [r4]
0007ab44  ldr     r3, [r4, #0x1c]
0007ab46  movs    r6, #0
0007ab48  mov     r0, r4
0007ab4a  str     r3, [r2, #0x3c]
0007ab4c  movs    r3, #0x20
0007ab4e  str     r6, [r4, #0x44]
0007ab50  str     r3, [r4, #0x20]
0007ab52  bl      #0x79590 ; -> zap_init_special_act
0007ab56  mov     r0, r4
0007ab58  str     r6, [r4, #0x1c]
0007ab5a  bl      #0x57be4 ; -> ochar_sound
0007ab5e  mov     r0, r4
0007ab60  movs    r3, #3
0007ab62  str     r3, [r4, #0x1c]
0007ab64  bl      #0x57be4 ; -> ochar_sound
0007ab68  mov     r0, r4
0007ab6a  movs    r3, #4
0007ab6c  str     r3, [r4, #0x1c]
0007ab6e  bl      #0x57be4 ; -> ochar_sound
0007ab72  mov     r0, r4
0007ab74  movs    r3, #2
0007ab76  str     r3, [r4, #0x40]
0007ab78  bl      #0x55228 ; -> get_char_ani2
0007ab7c  mov     r0, r4
0007ab7e  bl      #0x59e24 ; -> do_next_a9_frame
0007ab82  ldr.w   r3, [r5, #0xa4]
0007ab86  movs    r0, #6
0007ab88  movw    r2, #0x5ad
0007ab8c  adds    r3, #1
0007ab8e  str.w   r2, [r5, r3, lsl #3]
0007ab92  str.w   r0, [r5, #0xfc]
0007ab96  b       #0x7ab2c
0007ab98  movw    r2, #0x5ad
0007ab9c  cmp     r3, r2
0007ab9e  bne     #0x7ab28
0007aba0  movs    r3, #4
0007aba2  str     r3, [r4, #0x1c]
0007aba4  ldr.w   r3, [r0, #0xa4]
0007aba8  adds    r3, #1
0007abaa  str.w   r1, [r0, r3, lsl #3]
0007abae  ldr.w   r3, [r0, #0xa4]
0007abb2  adds    r2, r3, #1
0007abb4  ldr     r3, [pc, #0x90]
0007abb6  str.w   r2, [r0, #0xa4]
0007abba  add     r3, pc ; -> 0x000f37cc  t_mframew
0007abbc  ldr     r1, [r3]
0007abbe  lsls    r3, r2, #3
0007abc0  adds    r3, r3, r5
0007abc2  movs    r0, #0
0007abc4  str     r1, [r3, #4]
0007abc6  ldr.w   r3, [r5, #0xa4]
0007abca  adds    r3, #1
0007abcc  str.w   r0, [r5, r3, lsl #3]
0007abd0  b       #0x7ab2c
0007abd2  cmp     r2, #0
0007abd4  ble     #0x7ac42
0007abd6  subs    r3, r2, #1
0007abd8  str.w   r3, [r0, #0xa4]
0007abdc  movs    r0, #0
0007abde  b       #0x7ab2c
0007abe0  ldr     r3, [pc, #0x68]
0007abe2  mov     r0, r4
0007abe4  add     r3, pc ; -> 0x000780e9  t_boomerang_proc
0007abe6  str     r3, [r4, #0x38]
0007abe8  bl      #0x75964 ; -> create_proj_proc
0007abec  cbz     r0, #0x7abf6
0007abee  ldr     r3, [r4]
0007abf0  ldr     r0, [r0]
0007abf2  ldr     r3, [r3, #0x3c]
0007abf4  str     r3, [r0, #0x3c]
0007abf6  ldr     r0, [r4]
0007abf8  movw    r3, #0x604
0007abfc  str     r3, [r4, #0x1c]
0007abfe  movw    r2, #0x5ca
0007ac02  str     r3, [r0, #0x18]
0007ac04  ldr.w   r3, [r5, #0xa4]
0007ac08  movs    r0, #0x20
0007ac0a  adds    r3, #1
0007ac0c  str.w   r2, [r5, r3, lsl #3]
0007ac10  str.w   r0, [r5, #0xfc]
0007ac14  b       #0x7ab2c
0007ac16  movs    r3, #3
0007ac18  str     r3, [r4, #0x1c]
0007ac1a  ldr.w   r3, [r0, #0xa4]
0007ac1e  movw    r2, #0x5cc
0007ac22  adds    r3, #1
0007ac24  str.w   r2, [r0, r3, lsl #3]
0007ac28  ldr.w   r3, [r0, #0xa4]
0007ac2c  adds    r2, r3, #1
0007ac2e  ldr.w   r3, [pc, #0x20]
0007ac32  str.w   r2, [r0, #0xa4]
0007ac36  add     r3, pc ; -> 0x000f37cc  t_mframew
0007ac38  b       #0x7abbc
0007ac3a  ldrh    r2, [r3, #0xe]
0007ac3c  subs    r2, #0xa
0007ac3e  strh    r2, [r3, #0xe]
0007ac40  b       #0x7ab42
0007ac42  ldr     r3, [pc, #0x10]
0007ac44  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007ac46  b       #0x7abbc
0007ac48  ldrh    r6, [r1, #0x20]
0007ac4a  movs    r7, r0
0007ac4c  bpl     #0x7ac52
