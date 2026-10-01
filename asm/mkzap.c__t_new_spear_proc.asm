========================================================================
t_new_spear_proc  0x0007c830  484 bytes   mkzap.c
========================================================================

0007c830  push    {r4, r5, r6, r7, lr}
0007c832  add     r7, sp, #0xc
0007c834  ldr.w   r3, [r0, #0xa4]
0007c838  mov     r6, r0
0007c83a  ldr.w   r4, [r0, #0x108]
0007c83e  adds    r3, #1
0007c840  ldr.w   r5, [r0, r3, lsl #3]
0007c844  cmp.w   r5, #0x240
0007c848  beq     #0x7c946
0007c84a  ble     #0x7c860
0007c84c  movw    r3, #0x242
0007c850  cmp     r5, r3
0007c852  beq     #0x7c920
0007c854  adds    r3, #0x14
0007c856  cmp     r5, r3
0007c858  beq     #0x7c900
0007c85a  mvn     r0, #2
0007c85e  pop     {r4, r5, r6, r7, pc}
0007c860  cbz     r5, #0x7c896
0007c862  cmp.w   r5, #0x22c
0007c866  bne     #0x7c85a
0007c868  ldr     r5, [r4, #0x18]
0007c86a  cmp     r5, #0
0007c86c  beq     #0x7c962
0007c86e  movs    r3, #3
0007c870  str     r3, [r4, #0x48]
0007c872  ldr     r2, [r4, #8]
0007c874  mov     r0, r4
0007c876  movs    r1, #2
0007c878  movs    r3, #0
0007c87a  str     r3, [r2, #0x18]
0007c87c  bl      #0x57480 ; -> player_swpal
0007c880  ldr.w   r3, [r6, #0xa4]
0007c884  movs    r0, #3
0007c886  mov.w   r2, #0x240
0007c88a  adds    r3, #1
0007c88c  str.w   r2, [r6, r3, lsl #3]
0007c890  str.w   r0, [r6, #0xfc]
0007c894  b       #0x7c85e
0007c896  ldr     r3, [r4, #0x20]
0007c898  mov     r0, r4
0007c89a  adds    r3, #0x18
0007c89c  str     r3, [r4, #0x20]
0007c89e  bl      #0x570ac ; -> multi_adjust_xy
0007c8a2  movs    r3, #9
0007c8a4  mov     r0, r4
0007c8a6  str     r3, [r4, #0x40]
0007c8a8  subs    r3, #6
0007c8aa  str     r3, [r4, #0x54]
0007c8ac  bl      #0x554c0 ; -> find_ani2_part_a14
0007c8b0  ldr     r3, [r4, #0x40]
0007c8b2  ldr     r2, [r4, #8]
0007c8b4  mov     r0, r4
0007c8b6  ldr     r3, [r3]
0007c8b8  str     r3, [r2, #0x2c]
0007c8ba  movw    r3, #0xfff
0007c8be  str     r3, [r4, #0x20]
0007c8c0  mov.w   r3, #0xa0000
0007c8c4  str     r3, [r4, #0x1c]
0007c8c6  bl      #0x75d6c ; -> set_proj_vel
0007c8ca  str     r5, [r4, #0x34]
0007c8cc  movs    r3, #0x14
0007c8ce  str     r3, [r4, #0x48]
0007c8d0  ldr.w   r3, [r6, #0xa4]
0007c8d4  mov.w   r2, #0x22c
0007c8d8  mov     r0, r5
0007c8da  adds    r3, #1
0007c8dc  str.w   r2, [r6, r3, lsl #3]
0007c8e0  ldr.w   r3, [r6, #0xa4]
0007c8e4  ldr     r2, [pc, #0x110]
0007c8e6  adds    r3, #1
0007c8e8  str.w   r3, [r6, #0xa4]
0007c8ec  lsls    r3, r3, #3
0007c8ee  adds    r3, r3, r6
0007c8f0  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
0007c8f2  str     r2, [r3, #4]
0007c8f4  ldr.w   r3, [r6, #0xa4]
0007c8f8  adds    r3, #1
0007c8fa  str.w   r5, [r6, r3, lsl #3]
0007c8fe  b       #0x7c85e
0007c900  ldr     r0, [r4]
0007c902  ldr     r3, [r4, #8]
0007c904  ldr     r0, [r0, #4]
0007c906  ldrh    r0, [r0, #0xe]
0007c908  strh    r0, [r3, #0xe]
0007c90a  ldr.w   r3, [r6, #0xa4]
0007c90e  movs    r0, #1
0007c910  movw    r2, #0x256
0007c914  adds    r3, #1
0007c916  str.w   r2, [r6, r3, lsl #3]
0007c91a  str.w   r0, [r6, #0xfc]
0007c91e  b       #0x7c85e
0007c920  ldr     r3, [r4, #0x48]
0007c922  subs    r3, #1
0007c924  str     r3, [r4, #0x48]
0007c926  cmp     r3, #0
0007c928  bne     #0x7c872
0007c92a  ldr.w   r3, [r0, #0xa4]
0007c92e  ldr     r2, [pc, #0xcc]
0007c930  lsls    r3, r3, #3
0007c932  adds    r3, r3, r0
0007c934  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
0007c936  str     r2, [r3, #4]
0007c938  ldr.w   r3, [r0, #0xa4]
0007c93c  movs    r0, #0
0007c93e  adds    r3, #1
0007c940  str.w   r0, [r6, r3, lsl #3]
0007c944  b       #0x7c85e
0007c946  mov     r0, r4
0007c948  bl      #0x57488 ; -> player_normpal
0007c94c  ldr.w   r3, [r6, #0xa4]
0007c950  movs    r0, #3
0007c952  movw    r2, #0x242
0007c956  adds    r3, #1
0007c958  str.w   r2, [r6, r3, lsl #3]
0007c95c  str.w   r0, [r6, #0xfc]
0007c960  b       #0x7c85e
0007c962  ldr     r3, [r4]
0007c964  ldr     r0, [r3, #8]
0007c966  lsls    r3, r0, #2
0007c968  lsls    r0, r0, #4
0007c96a  subs    r0, r0, r3
0007c96c  lsls    r3, r0, #3
0007c96e  adds    r0, r0, r3
0007c970  ldr.w   r3, [pc, #0x8c]
0007c974  add     r3, pc ; -> 0x000f321c  Plyr
0007c976  ldr     r3, [r3]
0007c978  adds    r0, r0, r3
0007c97a  bl      #0x575cc ; -> GetProcFunc
0007c97e  ldr.w   r3, [pc, #0x84]
0007c982  add     r3, pc ; -> 0x00074e39  t_scorp_waiting_sleep
0007c984  cmp     r0, r3
0007c986  beq     #0x7c9c8
0007c988  ldr     r3, [r4, #0x18]
0007c98a  cmp     r3, #0
0007c98c  bne.w   #0x7c86e
0007c990  ldr.w   r1, [r6, #0xf8]
0007c994  ldr     r2, [r4, #0x44]
0007c996  mov     r0, r4
0007c998  lsls    r3, r1, #2
0007c99a  adds    r3, r3, r6
0007c99c  str.w   r2, [r3, #0xa8]
0007c9a0  adds    r3, r1, #1
0007c9a2  str.w   r3, [r6, #0xf8]
0007c9a6  ldr     r3, [pc, #0x60]
0007c9a8  add     r3, pc ; -> 0x000f33c8  t_r_null_speared
0007c9aa  ldr     r3, [r3]
0007c9ac  str     r3, [r4, #0x38]
0007c9ae  bl      #0x58954 ; -> takeover_him
0007c9b2  ldr.w   r3, [r6, #0xf8]
0007c9b6  subs    r3, #1
0007c9b8  str.w   r3, [r6, #0xf8]
0007c9bc  lsls    r3, r3, #2
0007c9be  adds    r3, r3, r6
0007c9c0  ldr.w   r3, [r3, #0xa8]
0007c9c4  str     r3, [r4, #0x44]
0007c9c6  b       #0x7c86e
0007c9c8  ldr     r1, [r4]
0007c9ca  ldr     r3, [pc, #0x40]
0007c9cc  mov     r0, r4
0007c9ce  add     r3, pc ; -> 0x0007c5fd  t_scorp_rope_pull
0007c9d0  str     r3, [r4, #0x38]
0007c9d2  ldr     r3, [r1, #8]
0007c9d4  lsls    r2, r3, #6
0007c9d6  lsls    r1, r3, #2
0007c9d8  adds    r1, r1, r2
0007c9da  subs    r1, r1, r3
0007c9dc  ldr.w   r3, [pc, #0x30]
0007c9e0  lsls    r1, r1, #2
0007c9e2  add     r3, pc ; -> 0x000f3140  mytc
0007c9e4  ldr     r3, [r3]
0007c9e6  adds    r1, r1, r3
0007c9e8  bl      #0x55118 ; -> fastxfer_thread
0007c9ec  mov     r0, r4
0007c9ee  bl      #0x57630 ; -> ReallyKillHisProjectile
0007c9f2  ldr     r0, [r4, #8]
0007c9f4  str     r5, [r0, #0x18]
0007c9f6  b       #0x7c90a
0007c9f8  str     r0, [sp, #0x94]
