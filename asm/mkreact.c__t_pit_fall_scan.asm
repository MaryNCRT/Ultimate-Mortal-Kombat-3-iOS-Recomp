========================================================================
t_pit_fall_scan  0x00047ee4  260 bytes   mkreact.c
========================================================================

00047ee4  push    {r4, r5, r7, lr}
00047ee6  add     r7, sp, #8
00047ee8  ldr.w   r3, [r0, #0xa4]
00047eec  mov     r5, r0
00047eee  ldr.w   r4, [r0, #0x108]
00047ef2  adds    r2, r3, #1
00047ef4  ldr.w   r2, [r0, r2, lsl #3]
00047ef8  cbz     r2, #0x47f00
00047efa  mvn     r0, #2
00047efe  pop     {r4, r5, r7, pc}
00047f00  ldr     r3, [pc, #0xd0]
00047f02  ldr.w   ip, [r4]
00047f06  add     r3, pc ; -> 0x000f357c  G
00047f08  ldr     r1, [r3]
00047f0a  ldr     r3, [pc, #0xcc]
00047f0c  add     r3, pc ; -> 0x000f37a0  ochar_ground_offsets
00047f0e  ldr.w   r1, [r1, #0xac]
00047f12  ldr     r0, [r3]
00047f14  ldr     r3, [r4, #8]
00047f16  ldr     r3, [r3, #0x24]
00047f18  ldr.w   r3, [r0, r3, lsl #2]
00047f1c  rsb     r3, r3, r1
00047f20  str.w   r3, [ip, #0x40]
00047f24  ldr     r1, [r4, #8]
00047f26  ldr     r3, [r1, #0x1c]
00047f28  cmp.w   r3, #0x130000
00047f2c  ble     #0x47f3c
00047f2e  str     r2, [r1, #0x20]
00047f30  ldr     r1, [r4, #8]
00047f32  mov.w   r3, #0x130000
00047f36  str     r3, [r1, #0x1c]
00047f38  ldr     r1, [r4, #8]
00047f3a  ldr     r3, [r1, #0x1c]
00047f3c  ldr.w   ip, [r4]
00047f40  lsls    r0, r3, #1
00047f42  ldr     r3, [r1, #0x10]
00047f44  ldr.w   r1, [ip, #0x40]
00047f48  add     r3, r0
00047f4a  cmp.w   r1, r3, asr #16
00047f4e  ble     #0x47f62
00047f50  ldr.w   r3, [r5, #0xa4]
00047f54  cmp     r3, #0
00047f56  ble     #0x47fb8
00047f58  subs    r3, #1
00047f5a  movs    r0, #0
00047f5c  str.w   r3, [r5, #0xa4]
00047f60  b       #0x47efe
00047f62  ldr     r3, [pc, #0x78]
00047f64  add     r3, pc ; -> 0x000f3534  RoundParam
00047f66  ldr     r1, [r3]
00047f68  ldr     r3, [r1, #0x28]
00047f6a  cmp     r3, #0
00047f6c  beq     #0x47f50
00047f6e  movs    r0, #4
00047f70  subs    r3, #1
00047f72  str     r3, [r1, #0x28]
00047f74  movs    r1, #0x3e
00047f76  ldr.w   r3, [ip, #8]
00047f7a  bl      #0x31a28 ; -> MKEvent_Add
00047f7e  ldr     r1, [r4, #8]
00047f80  ldr     r3, [pc, #0x5c]
00047f82  ldr     r2, [r1, #0x1c]
00047f84  smull   r0, r3, r2, r3
00047f88  mov     r0, r4
00047f8a  sub.w   r3, r3, r2, asr #31
00047f8e  rsb     r3, r3, r2
00047f92  str     r3, [r1, #0x1c]
00047f94  mov.w   r3, #0x50005
00047f98  str     r3, [r4, #0x48]
00047f9a  bl      #0x581e0 ; -> shake_a11
00047f9e  movs    r1, #1
00047fa0  mov     r0, r4
00047fa2  bl      #0x57dd0 ; -> tsound_func
00047fa6  mov     r0, r4
00047fa8  movs    r3, #2
00047faa  str     r3, [r4, #0x1c]
00047fac  bl      #0x580a4 ; -> group_sound
00047fb0  ldr.w   r3, [r5, #0xa4]
00047fb4  cmp     r3, #0
00047fb6  bgt     #0x47f58
00047fb8  ldr     r2, [pc, #0x28]
00047fba  lsls    r3, r3, #3
00047fbc  adds    r3, r3, r5
00047fbe  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00047fc0  movs    r0, #0
00047fc2  ldr     r2, [r2]
00047fc4  str     r2, [r3, #4]
00047fc6  ldr.w   r3, [r5, #0xa4]
00047fca  adds    r3, #1
00047fcc  str.w   r0, [r5, r3, lsl #3]
00047fd0  b       #0x47efe
00047fd2  nop     
00047fd4  cpsid   i
00047fd6  movs    r2, r1
