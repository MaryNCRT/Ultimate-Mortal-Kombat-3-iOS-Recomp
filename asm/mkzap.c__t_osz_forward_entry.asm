========================================================================
t_osz_forward_entry  0x00075ae8  400 bytes   mkzap.c
========================================================================

00075ae8  push    {r4, r7, lr}
00075aea  add     r7, sp, #4
00075aec  ldr.w   r3, [r0, #0xa4]
00075af0  mov     r4, r0
00075af2  ldr.w   r2, [r0, #0x108]
00075af6  adds    r3, #1
00075af8  movw    r1, #0x86b
00075afc  ldr.w   r0, [r0, r3, lsl #3]
00075b00  cmp     r0, r1
00075b02  beq     #0x75bc2
00075b04  ble     #0x75b22
00075b06  movw    r1, #0x871
00075b0a  cmp     r0, r1
00075b0c  beq     #0x75bea
00075b0e  movw    r3, #0x874
00075b12  cmp     r0, r3
00075b14  beq     #0x75b9a
00075b16  subs    r3, #6
00075b18  cmp     r0, r3
00075b1a  beq     #0x75c12
00075b1c  mvn     r0, #2
00075b20  pop     {r4, r7, pc}
00075b22  cbz     r0, #0x75b60
00075b24  movw    r3, #0x868
00075b28  cmp     r0, r3
00075b2a  bne     #0x75b1c
00075b2c  ldr     r3, [pc, #0x108]
00075b2e  str     r3, [r2, #0x20]
00075b30  ldr     r3, [pc, #0x108]
00075b32  str     r3, [r2, #0x24]
00075b34  ldr.w   r3, [r4, #0xa4]
00075b38  ldr     r2, [pc, #0x104]
00075b3a  adds    r3, #1
00075b3c  add     r2, pc ; -> 0x0007bea9  t_ice_collision_check
00075b3e  str.w   r1, [r4, r3, lsl #3]
00075b42  ldr.w   r3, [r4, #0xa4]
00075b46  adds    r3, #1
00075b48  str.w   r3, [r4, #0xa4]
00075b4c  lsls    r3, r3, #3
00075b4e  adds    r3, r3, r4
00075b50  movs    r0, #0
00075b52  str     r2, [r3, #4]
00075b54  ldr.w   r3, [r4, #0xa4]
00075b58  adds    r3, #1
00075b5a  str.w   r0, [r4, r3, lsl #3]
00075b5e  b       #0x75b20
00075b60  ldr.w   r3, [pc, #0xd4]
00075b64  str     r3, [r2, #0x20]
00075b66  ldr.w   r3, [pc, #0xd4]
00075b6a  str     r3, [r2, #0x24]
00075b6c  ldr.w   r3, [r4, #0xa4]
00075b70  movw    r2, #0x868
00075b74  adds    r3, #1
00075b76  str.w   r2, [r4, r3, lsl #3]
00075b7a  ldr.w   r3, [r4, #0xa4]
00075b7e  ldr     r2, [pc, #0xc4]
00075b80  adds    r3, #1
00075b82  str.w   r3, [r4, #0xa4]
00075b86  lsls    r3, r3, #3
00075b88  adds    r3, r3, r4
00075b8a  add     r2, pc ; -> 0x0007bea9  t_ice_collision_check
00075b8c  str     r2, [r3, #4]
00075b8e  ldr.w   r3, [r4, #0xa4]
00075b92  adds    r3, #1
00075b94  str.w   r0, [r4, r3, lsl #3]
00075b98  b       #0x75b20
00075b9a  ldr     r3, [pc, #0xac]
00075b9c  ldr     r1, [r2]
00075b9e  mov     r0, r2
00075ba0  add     r3, pc ; -> 0x000f33d8  sz_ani_data
00075ba2  ldr     r1, [r1, #0x64]
00075ba4  ldr     r3, [r3]
00075ba6  add.w   r3, r3, #0x1200
00075baa  adds    r3, #0x34
00075bac  str     r3, [r1, #0x40]
00075bae  ldr     r3, [pc, #0x9c]
00075bb0  add     r3, pc ; -> 0x00075e09  t_sz_zap_proc
00075bb2  str     r3, [r2, #0x38]
00075bb4  bl      #0x75964 ; -> create_proj_proc
00075bb8  ldr     r2, [pc, #0x94]
00075bba  ldr.w   r3, [r4, #0xa4]
00075bbe  add     r2, pc ; -> 0x0007b991  t_sz_post_zap
00075bc0  b       #0x75b4c
00075bc2  ldr     r3, [pc, #0x90]
00075bc4  str     r3, [r2, #0x20]
00075bc6  ldr.w   r3, [pc, #0x90]
00075bca  str     r3, [r2, #0x24]
00075bcc  ldr.w   r3, [r4, #0xa4]
00075bd0  movw    r2, #0x86e
00075bd4  adds    r3, #1
00075bd6  str.w   r2, [r4, r3, lsl #3]
00075bda  ldr     r2, [pc, #0x80]
00075bdc  ldr.w   r3, [r4, #0xa4]
00075be0  add     r2, pc ; -> 0x0007bea9  t_ice_collision_check
00075be2  adds    r3, #1
00075be4  str.w   r3, [r4, #0xa4]
00075be8  b       #0x75b4c
00075bea  ldr.w   r3, [pc, #0x74]
00075bee  str     r3, [r2, #0x20]
00075bf0  ldr     r3, [pc, #0x70]
00075bf2  str     r3, [r2, #0x24]
00075bf4  ldr.w   r3, [r4, #0xa4]
00075bf8  movw    r2, #0x874
00075bfc  adds    r3, #1
00075bfe  str.w   r2, [r4, r3, lsl #3]
00075c02  ldr     r2, [pc, #0x64]
00075c04  ldr.w   r3, [r4, #0xa4]
00075c08  add     r2, pc ; -> 0x0007bea9  t_ice_collision_check
00075c0a  adds    r3, #1
00075c0c  str.w   r3, [r4, #0xa4]
00075c10  b       #0x75b4c
00075c12  ldr.w   r3, [pc, #0x58]
00075c16  str     r3, [r2, #0x20]
00075c18  ldr     r3, [pc, #0x54]
00075c1a  str     r3, [r2, #0x24]
00075c1c  ldr.w   r3, [r4, #0xa4]
00075c20  ldr     r2, [pc, #0x50]
00075c22  adds    r3, #1
00075c24  add     r2, pc ; -> 0x0007bea9  t_ice_collision_check
00075c26  str.w   r1, [r4, r3, lsl #3]
00075c2a  ldr.w   r3, [r4, #0xa4]
00075c2e  adds    r3, #1
00075c30  str.w   r3, [r4, #0xa4]
00075c34  b       #0x75b4c
00075c36  nop     
00075c38  lsls    r0, r4, #1
00075c3a  movs    r5, r5
00075c3c  movs    r0, r5
00075c3e  movs    r0, r2
00075c40  str     r1, [r5, #0x34]
00075c42  movs    r0, r0
00075c44  str     r3, [r3, #0x30]
00075c46  movs    r0, r0
00075c48  bhi     #0x75cb4
00075c4a  movs    r7, r0
00075c4c  lsls    r5, r2, #9
00075c4e  movs    r0, r0
00075c50  ldrb    r7, [r1, r7]
00075c52  movs    r0, r0
00075c54  lsls    r0, r1, #2
00075c56  movs    r5, r5
00075c58  lsls    r0, r2, #1
00075c5a  movs    r0, r2
00075c5c  str     r5, [r0, #0x2c]
00075c5e  movs    r0, r0
00075c60  lsls    r5, r6, #2
00075c62  movs    r5, r5
00075c64  lsls    r6, r4, #1
00075c66  movs    r0, r2
00075c68  str     r5, [r3, #0x28]
00075c6a  movs    r0, r0
00075c6c  lsls    r4, r4, #2
00075c6e  movs    r5, r5
00075c70  lsls    r4, r5, #1
00075c72  movs    r0, r2
00075c74  str     r1, [r0, #0x28]
00075c76  movs    r0, r0
