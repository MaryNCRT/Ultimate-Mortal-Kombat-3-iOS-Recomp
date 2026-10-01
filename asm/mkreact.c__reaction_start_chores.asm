========================================================================
reaction_start_chores  0x00044b0c  120 bytes   mkreact.c
========================================================================

00044b0c  push    {r4, r5, r7, lr}
00044b0e  add     r7, sp, #8
00044b10  mov     r4, r0
00044b12  bl      #0x41ab4 ; -> inc_p_hit
00044b16  ldr     r3, [r4, #8]
00044b18  movs    r5, #0
00044b1a  str     r5, [r4, #0x38]
00044b1c  str     r5, [r3, #0x20]
00044b1e  ldr     r2, [r4]
00044b20  ldr     r3, [r2, #0x10]
00044b22  tst.w   r3, #8
00044b26  str     r3, [r4, #0x2c]
00044b28  beq     #0x44b3a
00044b2a  ldr     r3, [pc, #0x54]
00044b2c  movs    r2, #1
00044b2e  str     r2, [r4, #0x1c]
00044b30  add     r3, pc ; -> 0x000f357c  G
00044b32  ldr     r3, [r3]
00044b34  strh.w  r2, [r3, #0x452]
00044b38  ldr     r2, [r4]
00044b3a  ldr     r3, [r4, #0x2c]
00044b3c  mov     r0, r4
00044b3e  orr     r3, r3, #4
00044b42  str     r3, [r4, #0x2c]
00044b44  str     r3, [r2, #0x10]
00044b46  bl      #0x56d3c ; -> delete_slave_notproj
00044b4a  ldr     r2, [r4, #8]
00044b4c  mov     r0, r4
00044b4e  ldr     r3, [r2, #0x30]
00044b50  bic     r3, r3, #0x1a4
00044b54  orr     r3, r3, #0x10
00044b58  str     r3, [r4, #0x2c]
00044b5a  str     r3, [r2, #0x30]
00044b5c  ldr     r3, [r4]
00044b5e  str     r5, [r4, #0x1c]
00044b60  str     r5, [r3, #0x50]
00044b62  ldr     r2, [r4]
00044b64  ldr     r3, [r4, #0x1c]
00044b66  str     r3, [r2, #0x58]
00044b68  bl      #0x57488 ; -> player_normpal
00044b6c  mov     r0, r4
00044b6e  bl      #0x55388 ; -> face_opponent
00044b72  mov     r0, r4
00044b74  bl      #0x55c04 ; -> stop_me_player
00044b78  mov     r0, r4
00044b7a  bl      #0x41ae0 ; -> uhq_entry
00044b7e  pop     {r4, r5, r7, pc}
00044b80  orr.w   r0, r8, sl
