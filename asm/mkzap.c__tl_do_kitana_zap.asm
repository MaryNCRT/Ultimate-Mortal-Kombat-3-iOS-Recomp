========================================================================
tl_do_kitana_zap  0x0007a97c  384 bytes   mkzap.c
========================================================================

0007a97c  push    {r4, r5, r6, r7, lr}
0007a97e  add     r7, sp, #0xc
0007a980  str     r8, [sp, #-0x4]!
0007a984  ldr.w   r2, [r0, #0xa4]
0007a988  movw    r8, #0x665
0007a98c  mov     r4, r0
0007a98e  adds    r3, r2, #1
0007a990  ldr.w   r6, [r0, #0x108]
0007a994  ldr.w   r5, [r0, r3, lsl #3]
0007a998  cmp     r5, r8
0007a99a  beq     #0x7aa50
0007a99c  ble     #0x7a9b6
0007a99e  cmp.w   r5, #0x668
0007a9a2  beq     #0x7aa6e
0007a9a4  movw    r3, #0x66a
0007a9a8  cmp     r5, r3
0007a9aa  beq     #0x7aa42
0007a9ac  mvn     r0, #2
0007a9b0  ldr     r8, [sp], #4
0007a9b4  pop     {r4, r5, r6, r7, pc}
0007a9b6  cbz     r5, #0x7aa00
0007a9b8  movw    r3, #0x656
0007a9bc  cmp     r5, r3
0007a9be  bne     #0x7a9ac
0007a9c0  ldr     r3, [pc, #0x118]
0007a9c2  mov     r0, r6
0007a9c4  add     r3, pc ; -> 0x00078c65  tl_fan_proc
0007a9c6  str     r3, [r6, #0x38]
0007a9c8  bl      #0x75964 ; -> create_proj_proc
0007a9cc  movs    r3, #3
0007a9ce  str     r3, [r6, #0x1c]
0007a9d0  ldr.w   r3, [r4, #0xa4]
0007a9d4  adds    r3, #1
0007a9d6  str.w   r8, [r4, r3, lsl #3]
0007a9da  ldr.w   r3, [r4, #0xa4]
0007a9de  adds    r2, r3, #1
0007a9e0  ldr.w   r3, [pc, #0xfc]
0007a9e4  str.w   r2, [r4, #0xa4]
0007a9e8  add     r3, pc ; -> 0x000f37cc  t_mframew
0007a9ea  ldr     r1, [r3]
0007a9ec  lsls    r3, r2, #3
0007a9ee  adds    r3, r3, r4
0007a9f0  movs    r0, #0
0007a9f2  str     r1, [r3, #4]
0007a9f4  ldr.w   r3, [r4, #0xa4]
0007a9f8  adds    r3, #1
0007a9fa  str.w   r0, [r4, r3, lsl #3]
0007a9fe  b       #0x7a9b0
0007aa00  mov     r0, r6
0007aa02  str     r5, [r6, #0x1c]
0007aa04  bl      #0x57be4 ; -> ochar_sound
0007aa08  ldr     r3, [pc, #0xd8]
0007aa0a  mov     r0, r6
0007aa0c  add     r3, pc ; -> 0x000f357c  G
0007aa0e  ldr     r3, [r3]
0007aa10  add.w   r3, r3, #0x410
0007aa14  adds    r3, #4
0007aa16  str     r3, [r6, #0x1c]
0007aa18  bl      #0x5742c ; -> update_tsl
0007aa1c  mov     r0, r6
0007aa1e  bl      #0x55070 ; -> am_i_airborn
0007aa22  mov     r8, r0
0007aa24  cbz     r0, #0x7aa92
0007aa26  ldr.w   r3, [r4, #0xa4]
0007aa2a  ldr     r2, [pc, #0xbc]
0007aa2c  mov     r0, r5
0007aa2e  lsls    r3, r3, #3
0007aa30  adds    r3, r3, r4
0007aa32  add     r2, pc ; -> 0x0007b655  tl_kit_zap_air
0007aa34  str     r2, [r3, #4]
0007aa36  ldr.w   r3, [r4, #0xa4]
0007aa3a  adds    r3, #1
0007aa3c  str.w   r5, [r4, r3, lsl #3]
0007aa40  b       #0x7a9b0
0007aa42  cmp     r2, #0
0007aa44  ble     #0x7aad6
0007aa46  subs    r3, r2, #1
0007aa48  str.w   r3, [r0, #0xa4]
0007aa4c  movs    r0, #0
0007aa4e  b       #0x7a9b0
0007aa50  ldr     r3, [r6]
0007aa52  movw    r2, #0x604
0007aa56  str     r2, [r6, #0x1c]
0007aa58  str     r2, [r3, #0x18]
0007aa5a  ldr.w   r3, [r0, #0xa4]
0007aa5e  adds    r2, #0x64
0007aa60  adds    r3, #1
0007aa62  str.w   r2, [r0, r3, lsl #3]
0007aa66  movs    r0, #0x20
0007aa68  str.w   r0, [r4, #0xfc]
0007aa6c  b       #0x7a9b0
0007aa6e  movs    r3, #3
0007aa70  str     r3, [r6, #0x1c]
0007aa72  ldr.w   r3, [r0, #0xa4]
0007aa76  movw    r2, #0x66a
0007aa7a  adds    r3, #1
0007aa7c  str.w   r2, [r0, r3, lsl #3]
0007aa80  ldr.w   r3, [r0, #0xa4]
0007aa84  adds    r2, r3, #1
0007aa86  ldr.w   r3, [pc, #0x64]
0007aa8a  str.w   r2, [r0, #0xa4]
0007aa8e  add     r3, pc ; -> 0x000f37cc  t_mframew
0007aa90  b       #0x7a9ea
0007aa92  movs    r3, #0x1e
0007aa94  str     r0, [r6, #0x44]
0007aa96  str     r3, [r6, #0x20]
0007aa98  mov     r0, r6
0007aa9a  bl      #0x79590 ; -> zap_init_special_act
0007aa9e  ldr     r3, [pc, #0x50]
0007aaa0  movw    r2, #0x656
0007aaa4  mov     r0, r8
0007aaa6  str     r3, [r6, #0x40]
0007aaa8  ldr.w   r3, [r4, #0xa4]
0007aaac  adds    r3, #1
0007aaae  str.w   r2, [r4, r3, lsl #3]
0007aab2  ldr.w   r3, [r4, #0xa4]
0007aab6  adds    r2, r3, #1
0007aab8  ldr.w   r3, [pc, #0x38]
0007aabc  str.w   r2, [r4, #0xa4]
0007aac0  add     r3, pc ; -> 0x000f36d0  t_animate_a9
0007aac2  ldr     r1, [r3]
0007aac4  lsls    r3, r2, #3
0007aac6  adds    r3, r3, r4
0007aac8  str     r1, [r3, #4]
0007aaca  ldr.w   r3, [r4, #0xa4]
0007aace  adds    r3, #1
0007aad0  str.w   r8, [r4, r3, lsl #3]
0007aad4  b       #0x7a9b0
0007aad6  ldr     r3, [pc, #0x20]
0007aad8  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007aada  b       #0x7a9ea
0007aadc  b       #0x7b01a
