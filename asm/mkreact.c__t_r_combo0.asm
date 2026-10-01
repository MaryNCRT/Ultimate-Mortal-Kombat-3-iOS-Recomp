========================================================================
t_r_combo0  0x00045c84  344 bytes   mkreact.c
========================================================================

00045c84  push    {r4, r5, r6, r7, lr}
00045c86  add     r7, sp, #0xc
00045c88  str     r8, [sp, #-0x4]!
00045c8c  ldr.w   r2, [r0, #0xa4]
00045c90  movw    r8, #0xc27
00045c94  mov     r6, r0
00045c96  adds    r3, r2, #1
00045c98  ldr.w   r4, [r0, #0x108]
00045c9c  ldr.w   r5, [r0, r3, lsl #3]
00045ca0  cmp     r5, r8
00045ca2  beq     #0x45d24
00045ca4  ble     #0x45cbe
00045ca6  movw    r3, #0xc3a
00045caa  cmp     r5, r3
00045cac  beq     #0x45d68
00045cae  adds    r3, #3
00045cb0  cmp     r5, r3
00045cb2  beq     #0x45d0a
00045cb4  mvn     r0, #2
00045cb8  ldr     r8, [sp], #4
00045cbc  pop     {r4, r5, r6, r7, pc}
00045cbe  cmp     r5, #0
00045cc0  bne     #0x45cb4
00045cc2  mov     r0, r4
00045cc4  movs    r3, #4
00045cc6  str     r3, [r4, #0x1c]
00045cc8  bl      #0x5877c ; -> create_blood_proc
00045ccc  mov     r0, r4
00045cce  bl      #0x424e0 ; -> combo_setup
00045cd2  ldr     r3, [pc, #0xf4]
00045cd4  str     r5, [r4, #0x38]
00045cd6  ldr     r2, [pc, #0xf4]
00045cd8  add     r3, pc ; -> 0x0004289d  t_combo_airborn_hit
00045cda  str     r3, [r4, #0x30]
00045cdc  movs    r3, #5
00045cde  str     r3, [r4, #0x34]
00045ce0  ldr.w   r3, [r6, #0xa4]
00045ce4  add     r2, pc ; -> 0x00044b85  t_reaction_start
00045ce6  mov     r0, r5
00045ce8  adds    r3, #1
00045cea  str.w   r8, [r6, r3, lsl #3]
00045cee  ldr.w   r3, [r6, #0xa4]
00045cf2  adds    r3, #1
00045cf4  str.w   r3, [r6, #0xa4]
00045cf8  lsls    r3, r3, #3
00045cfa  adds    r3, r3, r6
00045cfc  str     r2, [r3, #4]
00045cfe  ldr.w   r3, [r6, #0xa4]
00045d02  adds    r3, #1
00045d04  str.w   r5, [r6, r3, lsl #3]
00045d08  b       #0x45cb8
00045d0a  ldr     r3, [pc, #0xc4]
00045d0c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00045d0e  ldr     r1, [r3]
00045d10  lsls    r3, r2, #3
00045d12  adds    r3, r3, r6
00045d14  movs    r0, #0
00045d16  str     r1, [r3, #4]
00045d18  ldr.w   r3, [r6, #0xa4]
00045d1c  adds    r3, #1
00045d1e  str.w   r0, [r6, r3, lsl #3]
00045d22  b       #0x45cb8
00045d24  ldr     r2, [r4]
00045d26  ldr     r3, [r2, #0x44]
00045d28  cmp     r3, #5
00045d2a  bgt     #0x45d8e
00045d2c  mov     r0, r4
00045d2e  bl      #0x54f20 ; -> set_no_block
00045d32  movs    r1, #0xa
00045d34  mov     r0, r4
00045d36  bl      #0x57dbc ; -> rsnd_func
00045d3a  mov     r0, r4
00045d3c  movs    r3, #0x1c
00045d3e  str     r3, [r4, #0x40]
00045d40  bl      #0x5520c ; -> get_char_ani
00045d44  ldr     r3, [r4, #0x40]
00045d46  mov     r0, r4
00045d48  str     r3, [r4, #0x44]
00045d4a  adds    r3, #0xc
00045d4c  str     r3, [r4, #0x40]
00045d4e  bl      #0x59e24 ; -> do_next_a9_frame
00045d52  ldr.w   r3, [r6, #0xa4]
00045d56  movs    r0, #3
00045d58  movw    r2, #0xc3a
00045d5c  adds    r3, #1
00045d5e  str.w   r2, [r6, r3, lsl #3]
00045d62  str.w   r0, [r6, #0xfc]
00045d66  b       #0x45cb8
00045d68  ldr     r3, [r4, #0x44]
00045d6a  movw    r2, #0xc3d
00045d6e  str     r3, [r4, #0x40]
00045d70  movs    r3, #4
00045d72  str     r3, [r4, #0x1c]
00045d74  ldr.w   r3, [r0, #0xa4]
00045d78  adds    r3, #1
00045d7a  str.w   r2, [r0, r3, lsl #3]
00045d7e  ldr.w   r3, [r0, #0xa4]
00045d82  adds    r2, r3, #1
00045d84  ldr     r3, [pc, #0x4c]
00045d86  str.w   r2, [r0, #0xa4]
00045d8a  add     r3, pc ; -> 0x000f37cc  t_mframew
00045d8c  b       #0x45d0e
00045d8e  ldr     r3, [r2, #4]
00045d90  ldr     r3, [r3, #0x24]
00045d92  cmp     r3, #4
00045d94  bne     #0x45d2c
00045d96  ldr     r2, [r4, #8]
00045d98  ldr     r3, [r2, #0x30]
00045d9a  bic     r3, r3, #4
00045d9e  str     r3, [r2, #0x30]
00045da0  ldr     r3, [r4]
00045da2  ldr     r3, [r3, #0x10]
00045da4  ands    r0, r3, #1
00045da8  bne     #0x45d32
00045daa  ldr.w   r3, [r6, #0xa4]
00045dae  ldr.w   r2, [pc, #0x28]
00045db2  lsls    r3, r3, #3
00045db4  adds    r3, r3, r6
00045db6  add     r2, pc ; -> 0x00043251  t_separate_us
00045db8  str     r2, [r3, #4]
00045dba  ldr.w   r3, [r6, #0xa4]
00045dbe  adds    r3, #1
00045dc0  str.w   r0, [r6, r3, lsl #3]
00045dc4  b       #0x45cb8
00045dc6  nop     
00045dc8  ldm     r3!, {r0, r6, r7}
