========================================================================
t_spit_proc  0x0007bbcc  304 bytes   mkzap.c
========================================================================

0007bbcc  push    {r4, r5, r6, r7, lr}
0007bbce  add     r7, sp, #0xc
0007bbd0  ldr.w   r2, [r0, #0xa4]
0007bbd4  mov     r4, r0
0007bbd6  ldr.w   r5, [r0, #0x108]
0007bbda  adds    r3, r2, #1
0007bbdc  ldr.w   r6, [r0, r3, lsl #3]
0007bbe0  cmp.w   r6, #0x488
0007bbe4  beq     #0x7bc60
0007bbe6  ble     #0x7bbfc
0007bbe8  movw    r3, #0x48c
0007bbec  cmp     r6, r3
0007bbee  beq     #0x7bc9a
0007bbf0  adds    r3, #7
0007bbf2  cmp     r6, r3
0007bbf4  beq     #0x7bc48
0007bbf6  mvn     r0, #2
0007bbfa  pop     {r4, r5, r6, r7, pc}
0007bbfc  cmp     r6, #0
0007bbfe  bne     #0x7bbf6
0007bc00  movs    r3, #6
0007bc02  mov     r0, r5
0007bc04  str     r3, [r5, #0x40]
0007bc06  subs    r3, #3
0007bc08  str     r3, [r5, #0x54]
0007bc0a  bl      #0x554c0 ; -> find_ani2_part_a14
0007bc0e  ldr     r3, [pc, #0xd0]
0007bc10  mov.w   r2, #0x488
0007bc14  mov     r0, r6
0007bc16  str     r3, [r5, #0x20]
0007bc18  ldr.w   r3, [pc, #0xc8]
0007bc1c  str     r3, [r5, #0x24]
0007bc1e  ldr.w   r3, [r4, #0xa4]
0007bc22  adds    r3, #1
0007bc24  str.w   r2, [r4, r3, lsl #3]
0007bc28  ldr.w   r3, [r4, #0xa4]
0007bc2c  ldr     r2, [pc, #0xb8]
0007bc2e  adds    r3, #1
0007bc30  str.w   r3, [r4, #0xa4]
0007bc34  lsls    r3, r3, #3
0007bc36  adds    r3, r3, r4
0007bc38  add     r2, pc ; -> 0x00077211  t_spit_prezap
0007bc3a  str     r2, [r3, #4]
0007bc3c  ldr.w   r3, [r4, #0xa4]
0007bc40  adds    r3, #1
0007bc42  str.w   r6, [r4, r3, lsl #3]
0007bc46  b       #0x7bbfa
0007bc48  ldr     r1, [pc, #0xa0]
0007bc4a  lsls    r3, r2, #3
0007bc4c  adds    r3, r3, r0
0007bc4e  add     r1, pc ; -> 0x0007bb09  spit_prezap_hit
0007bc50  str     r1, [r3, #4]
0007bc52  ldr.w   r3, [r0, #0xa4]
0007bc56  movs    r0, #0
0007bc58  adds    r3, #1
0007bc5a  str.w   r0, [r4, r3, lsl #3]
0007bc5e  b       #0x7bbfa
0007bc60  ldr     r3, [pc, #0x8c]
0007bc62  movw    r2, #0x48c
0007bc66  str     r3, [r5, #0x20]
0007bc68  ldr.w   r3, [pc, #0x78]
0007bc6c  str     r3, [r5, #0x24]
0007bc6e  ldr.w   r3, [r0, #0xa4]
0007bc72  adds    r3, #1
0007bc74  str.w   r2, [r0, r3, lsl #3]
0007bc78  ldr.w   r3, [r0, #0xa4]
0007bc7c  ldr     r2, [pc, #0x74]
0007bc7e  adds    r3, #1
0007bc80  str.w   r3, [r0, #0xa4]
0007bc84  lsls    r3, r3, #3
0007bc86  adds    r3, r3, r0
0007bc88  add     r2, pc ; -> 0x00077211  t_spit_prezap
0007bc8a  str     r2, [r3, #4]
0007bc8c  ldr.w   r3, [r0, #0xa4]
0007bc90  movs    r0, #0
0007bc92  adds    r3, #1
0007bc94  str.w   r0, [r4, r3, lsl #3]
0007bc98  b       #0x7bbfa
0007bc9a  movs    r3, #3
0007bc9c  mov     r0, r5
0007bc9e  str     r3, [r5, #0x20]
0007bca0  mov.w   r3, #0x80000
0007bca4  str     r3, [r5, #0x1c]
0007bca6  bl      #0x75d6c ; -> set_proj_vel
0007bcaa  movs    r3, #0x12
0007bcac  movs    r0, #0
0007bcae  str     r3, [r5, #0x48]
0007bcb0  str     r0, [r5, #0x34]
0007bcb2  ldr.w   r3, [r4, #0xa4]
0007bcb6  movw    r2, #0x493
0007bcba  adds    r3, #1
0007bcbc  str.w   r2, [r4, r3, lsl #3]
0007bcc0  ldr.w   r3, [r4, #0xa4]
0007bcc4  ldr     r2, [pc, #0x30]
0007bcc6  adds    r3, #1
0007bcc8  str.w   r3, [r4, #0xa4]
0007bccc  lsls    r3, r3, #3
0007bcce  adds    r3, r3, r4
0007bcd0  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
0007bcd2  str     r2, [r3, #4]
0007bcd4  ldr.w   r3, [r4, #0xa4]
0007bcd8  adds    r3, #1
0007bcda  str.w   r0, [r4, r3, lsl #3]
0007bcde  b       #0x7bbfa
0007bce0  lsls    r6, r3, #1
0007bce2  movs    r4, r3
0007bce4  movs    r4, r6
0007bce6  movs    r4, r1
0007bce8  push    {r0, r2, r4, r6, r7, lr}
