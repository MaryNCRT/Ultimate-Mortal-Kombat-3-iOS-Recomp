========================================================================
t_ice_collision_check  0x0007bea8  344 bytes   mkzap.c
========================================================================

0007bea8  push    {r4, r5, r6, r7, lr}
0007beaa  add     r7, sp, #0xc
0007beac  ldr.w   r2, [r0, #0xa4]
0007beb0  mov     r4, r0
0007beb2  ldr.w   r5, [r0, #0x108]
0007beb6  adds    r3, r2, #1
0007beb8  ldr.w   r6, [r0, r3, lsl #3]
0007bebc  cmp     r6, #0
0007bebe  bne     #0x7bf3e
0007bec0  ldr.w   r1, [r0, #0xf8]
0007bec4  ldr     r2, [r5, #0x20]
0007bec6  lsls    r3, r1, #2
0007bec8  adds    r3, r3, r0
0007beca  str.w   r2, [r3, #0xa8]
0007bece  adds    r3, r1, #1
0007bed0  str.w   r3, [r0, #0xf8]
0007bed4  ldr     r1, [r5, #0x24]
0007bed6  lsls    r2, r3, #2
0007bed8  adds    r2, r2, r0
0007beda  adds    r3, #1
0007bedc  str.w   r1, [r2, #0xa8]
0007bee0  str.w   r3, [r0, #0xf8]
0007bee4  ldr     r3, [r5]
0007bee6  mov     r1, r5
0007bee8  mov     r0, r5
0007beea  ldr     r2, [r3, #0x68]
0007beec  bl      #0x59c74 ; -> do_next_a9_frame_pxob
0007bef0  ldr.w   r3, [r4, #0xf8]
0007bef4  mov     r0, r5
0007bef6  subs    r3, #1
0007bef8  str.w   r3, [r4, #0xf8]
0007befc  lsls    r3, r3, #2
0007befe  adds    r3, r3, r4
0007bf00  ldr.w   r3, [r3, #0xa8]
0007bf04  str     r3, [r5, #0x24]
0007bf06  ldr.w   r3, [r4, #0xf8]
0007bf0a  subs    r3, #1
0007bf0c  str.w   r3, [r4, #0xf8]
0007bf10  lsls    r3, r3, #2
0007bf12  adds    r3, r3, r4
0007bf14  ldr.w   r3, [r3, #0xa8]
0007bf18  str     r3, [r5, #0x20]
0007bf1a  movs    r3, #0x13
0007bf1c  str     r3, [r5, #0x1c]
0007bf1e  bl      #0x75f1c ; -> local_strike_check_box
0007bf22  ldr     r3, [r5, #0x5c]
0007bf24  cmp     r3, #0
0007bf26  bne     #0x7bf74
0007bf28  ldr.w   r3, [r4, #0xa4]
0007bf2c  movw    r2, #0x83c
0007bf30  movs    r0, #3
0007bf32  adds    r3, #1
0007bf34  str.w   r2, [r4, r3, lsl #3]
0007bf38  str.w   r0, [r4, #0xfc]
0007bf3c  pop     {r4, r5, r6, r7, pc}
0007bf3e  movw    r3, #0x83c
0007bf42  cmp     r6, r3
0007bf44  it      ne
0007bf46  mvnne   r0, #2
0007bf4a  bne     #0x7bf3c
0007bf4c  cmp     r2, #0
0007bf4e  ble     #0x7bf5a
0007bf50  subs    r3, r2, #1
0007bf52  movs    r0, #0
0007bf54  str.w   r3, [r4, #0xa4]
0007bf58  b       #0x7bf3c
0007bf5a  ldr     r3, [pc, #0x90]
0007bf5c  movs    r0, #0
0007bf5e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007bf60  ldr     r1, [r3]
0007bf62  lsls    r3, r2, #3
0007bf64  adds    r3, r3, r4
0007bf66  str     r1, [r3, #4]
0007bf68  ldr.w   r3, [r4, #0xa4]
0007bf6c  adds    r3, #1
0007bf6e  str.w   r0, [r4, r3, lsl #3]
0007bf72  b       #0x7bf3c
0007bf74  ldr.w   r3, [r4, #0xa4]
0007bf78  cmp     r3, #0
0007bf7a  ble     #0x7bfd0
0007bf7c  subs    r3, #1
0007bf7e  str.w   r3, [r4, #0xa4]
0007bf82  ldr.w   r1, [r4, #0xa4]
0007bf86  adds    r3, r1, #1
0007bf88  lsls    r2, r3, #3
0007bf8a  adds    r2, r2, r4
0007bf8c  ldr     r0, [r2, #4]
0007bf8e  adds    r2, r3, #1
0007bf90  ldr.w   r2, [r4, r2, lsl #3]
0007bf94  str.w   r2, [r4, r3, lsl #3]
0007bf98  lsls    r3, r1, #3
0007bf9a  adds    r3, r3, r4
0007bf9c  str     r0, [r3, #4]
0007bf9e  ldr     r3, [pc, #0x50]
0007bfa0  mov     r0, r5
0007bfa2  str     r3, [r5, #0x1c]
0007bfa4  bl      #0x57c18 ; -> hob_ochar_sound
0007bfa8  ldr     r3, [pc, #0x48]
0007bfaa  mov     r0, r5
0007bfac  add     r3, pc ; -> 0x0007c001  t_sz_zap_hit
0007bfae  str     r3, [r5, #0x38]
0007bfb0  bl      #0x75964 ; -> create_proj_proc
0007bfb4  ldr.w   r3, [r4, #0xa4]
0007bfb8  ldr     r2, [pc, #0x3c]
0007bfba  movs    r0, #0
0007bfbc  lsls    r3, r3, #3
0007bfbe  adds    r3, r3, r4
0007bfc0  add     r2, pc ; -> 0x0007b991  t_sz_post_zap
0007bfc2  str     r2, [r3, #4]
0007bfc4  ldr.w   r3, [r4, #0xa4]
0007bfc8  adds    r3, #1
0007bfca  str.w   r0, [r4, r3, lsl #3]
0007bfce  b       #0x7bf3c
0007bfd0  ldr.w   r2, [pc, #0x28]
0007bfd4  lsls    r3, r3, #3
0007bfd6  adds    r3, r3, r4
0007bfd8  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007bfda  ldr     r2, [r2]
0007bfdc  str     r2, [r3, #4]
0007bfde  ldr.w   r3, [r4, #0xa4]
0007bfe2  adds    r3, #1
0007bfe4  str.w   r6, [r4, r3, lsl #3]
0007bfe8  b       #0x7bf82
0007bfea  nop     
0007bfec  strb    r6, [r4, #0x1e]
0007bfee  movs    r7, r0
0007bff0  movs    r3, r0
0007bff2  movs    r4, r0
0007bff4  lsls    r1, r2, #1
0007bff6  movs    r0, r0
