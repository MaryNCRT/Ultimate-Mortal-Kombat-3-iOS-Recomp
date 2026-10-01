========================================================================
t_mframew_4  0x000a5614  140 bytes   mkfriend.c
========================================================================

000a5614  ldr.w   r2, [r0, #0xa4]
000a5618  ldr.w   ip, [r0, #0x108]
000a561c  adds    r3, r2, #1
000a561e  ldr.w   r1, [r0, r3, lsl #3]
000a5622  cbnz    r1, #0xa5660
000a5624  movs    r3, #4
000a5626  str.w   r3, [ip, #0x1c]
000a562a  ldr.w   r3, [r0, #0xa4]
000a562e  mov.w   r2, #0x7d0
000a5632  adds    r3, #1
000a5634  str.w   r2, [r0, r3, lsl #3]
000a5638  ldr.w   r3, [r0, #0xa4]
000a563c  adds    r2, r3, #1
000a563e  ldr     r3, [pc, #0x58]
000a5640  str.w   r2, [r0, #0xa4]
000a5644  add     r3, pc ; -> 0x000f37cc  t_mframew
000a5646  ldr.w   ip, [r3]
000a564a  lsls    r3, r2, #3
000a564c  adds    r3, r3, r0
000a564e  str.w   ip, [r3, #4]
000a5652  ldr.w   r3, [r0, #0xa4]
000a5656  adds    r3, #1
000a5658  str.w   r1, [r0, r3, lsl #3]
000a565c  mov     r0, r1
000a565e  bx      lr
000a5660  cmp.w   r1, #0x7d0
000a5664  it      ne
000a5666  mvnne   r0, #2
000a566a  bne     #0xa565e
000a566c  cmp     r2, #0
000a566e  ble     #0xa567a
000a5670  subs    r3, r2, #1
000a5672  str.w   r3, [r0, #0xa4]
000a5676  movs    r0, #0
000a5678  b       #0xa565e
000a567a  ldr.w   r3, [pc, #0x20]
000a567e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a5680  ldr     r1, [r3]
000a5682  lsls    r3, r2, #3
000a5684  adds    r3, r3, r0
000a5686  str     r1, [r3, #4]
000a5688  ldr.w   r3, [r0, #0xa4]
000a568c  movs    r1, #0
000a568e  adds    r3, #1
000a5690  str.w   r1, [r0, r3, lsl #3]
000a5694  mov     r0, r1
000a5696  b       #0xa565e
000a5698  b       #0xa59a4
000a569a  movs    r4, r0
000a569c  b       #0xa57ac
000a569e  movs    r4, r0
