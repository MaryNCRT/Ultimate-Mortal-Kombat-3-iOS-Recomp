========================================================================
t_kano_upball  0x00069e38  192 bytes   mkdrone.c
========================================================================

00069e38  push    {lr}
00069e3a  ldr.w   ip, [r0, #0xa4]
00069e3e  movw    lr, #0xd52
00069e42  ldr.w   r1, [r0, #0x108]
00069e46  add.w   r3, ip, #1
00069e4a  ldr.w   r2, [r0, r3, lsl #3]
00069e4e  cmp     r2, lr
00069e50  beq     #0x69eba
00069e52  movw    r3, #0xd55
00069e56  cmp     r2, r3
00069e58  beq     #0x69e9a
00069e5a  cbz     r2, #0x69e62
00069e5c  mvn     r0, #2
00069e60  pop     {pc}
00069e62  movs    r3, #0x40
00069e64  str     r3, [r1, #0x44]
00069e66  ldr     r3, [pc, #0x80]
00069e68  add     r3, pc ; -> 0x0006e365  q_is_he_bike_close
00069e6a  str     r3, [r1, #0x48]
00069e6c  ldr.w   r3, [r0, #0xa4]
00069e70  ldr.w   r1, [pc, #0x78]
00069e74  adds    r3, #1
00069e76  add     r1, pc ; -> 0x00072a2d  t_stalk_wait_yes
00069e78  str.w   lr, [r0, r3, lsl #3]
00069e7c  ldr.w   r3, [r0, #0xa4]
00069e80  adds    r3, #1
00069e82  str.w   r3, [r0, #0xa4]
00069e86  lsls    r3, r3, #3
00069e88  adds    r3, r3, r0
00069e8a  str     r1, [r3, #4]
00069e8c  ldr.w   r3, [r0, #0xa4]
00069e90  adds    r3, #1
00069e92  str.w   r2, [r0, r3, lsl #3]
00069e96  mov     r0, r2
00069e98  b       #0x69e60
00069e9a  ldr.w   r3, [pc, #0x54]
00069e9e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00069ea0  ldr     r2, [r3]
00069ea2  lsl.w   r3, ip, #3
00069ea6  adds    r3, r3, r0
00069ea8  str     r2, [r3, #4]
00069eaa  ldr.w   r3, [r0, #0xa4]
00069eae  movs    r2, #0
00069eb0  adds    r3, #1
00069eb2  str.w   r2, [r0, r3, lsl #3]
00069eb6  mov     r0, r2
00069eb8  b       #0x69e60
00069eba  movs    r3, #0x1c
00069ebc  str     r3, [r1, #0x1c]
00069ebe  ldr.w   r3, [r0, #0xa4]
00069ec2  movw    r2, #0xd55
00069ec6  adds    r3, #1
00069ec8  str.w   r2, [r0, r3, lsl #3]
00069ecc  ldr.w   r3, [r0, #0xa4]
00069ed0  adds    r2, r3, #1
00069ed2  ldr.w   r3, [pc, #0x20]
00069ed6  str.w   r2, [r0, #0xa4]
00069eda  add     r3, pc ; -> 0x000f31a0  t_do_body_propell
00069edc  ldr     r1, [r3]
00069ede  lsls    r3, r2, #3
00069ee0  adds    r3, r3, r0
00069ee2  str     r1, [r3, #4]
00069ee4  b       #0x69eaa
00069ee6  nop     
00069ee8  add     sb, pc
00069eea  movs    r0, r0
00069eec  ldrh    r3, [r6, #0x1c]
00069eee  movs    r0, r0
00069ef0  ldr     r0, [sp, #0x198]
00069ef2  movs    r0, r1
00069ef4  str     r2, [sp, #0x308]
00069ef6  movs    r0, r1
