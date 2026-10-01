========================================================================
t_scorp_rope_pull  0x0007c5fc  564 bytes   mkzap.c
========================================================================

0007c5fc  push    {r4, r5, r6, r7, lr}
0007c5fe  add     r7, sp, #0xc
0007c600  ldr.w   r3, [r0, #0xa4]
0007c604  mov     r5, r0
0007c606  ldr.w   r4, [r0, #0x108]
0007c60a  adds    r3, #1
0007c60c  ldr.w   r3, [r0, r3, lsl #3]
0007c610  cmp.w   r3, #0x390
0007c614  beq.w   #0x7c766
0007c618  ble     #0x7c63c
0007c61a  movw    r6, #0x39e
0007c61e  cmp     r3, r6
0007c620  beq.w   #0x7c79c
0007c624  movw    r2, #0x3a9
0007c628  cmp     r3, r2
0007c62a  beq.w   #0x7c740
0007c62e  subs    r2, #0x10
0007c630  cmp     r3, r2
0007c632  beq.w   #0x7c7be
0007c636  mvn     r0, #2
0007c63a  pop     {r4, r5, r6, r7, pc}
0007c63c  cbz     r3, #0x7c67c
0007c63e  movw    r2, #0x38e
0007c642  cmp     r3, r2
0007c644  bne     #0x7c636
0007c646  movs    r3, #2
0007c648  str     r3, [r4, #0x20]
0007c64a  ldr.w   r3, [r0, #0xa4]
0007c64e  mov.w   r2, #0x390
0007c652  adds    r3, #1
0007c654  str.w   r2, [r0, r3, lsl #3]
0007c658  ldr.w   r2, [pc, #0x1c0]
0007c65c  ldr.w   r3, [r0, #0xa4]
0007c660  add     r2, pc ; -> 0x00074ee5  t_double_shaker
0007c662  adds    r3, #1
0007c664  str.w   r3, [r0, #0xa4]
0007c668  lsls    r3, r3, #3
0007c66a  adds    r3, r3, r5
0007c66c  movs    r0, #0
0007c66e  str     r2, [r3, #4]
0007c670  ldr.w   r3, [r5, #0xa4]
0007c674  adds    r3, #1
0007c676  str.w   r0, [r5, r3, lsl #3]
0007c67a  b       #0x7c63a
0007c67c  ldr     r3, [r4]
0007c67e  mov.w   r2, #0x11a
0007c682  str     r2, [r4, #0x20]
0007c684  str     r2, [r3, #0x18]
0007c686  ldr.w   r1, [r0, #0xf8]
0007c68a  ldr     r2, [r4, #0x40]
0007c68c  lsls    r3, r1, #2
0007c68e  adds    r3, r3, r0
0007c690  str.w   r2, [r3, #0xa8]
0007c694  adds    r3, r1, #1
0007c696  str.w   r3, [r0, #0xf8]
0007c69a  movs    r3, #9
0007c69c  mov     r0, r4
0007c69e  str     r3, [r4, #0x40]
0007c6a0  subs    r3, #6
0007c6a2  str     r3, [r4, #0x54]
0007c6a4  bl      #0x554c0 ; -> find_ani2_part_a14
0007c6a8  ldr     r3, [r4]
0007c6aa  mov     r0, r4
0007c6ac  ldr.w   r3, [r3, #0x88]
0007c6b0  ldr     r2, [r3, #8]
0007c6b2  ldr     r3, [r4, #0x40]
0007c6b4  ldr     r3, [r3, #8]
0007c6b6  str     r3, [r2, #0x2c]
0007c6b8  ldr.w   r3, [r5, #0xf8]
0007c6bc  subs    r3, #1
0007c6be  str.w   r3, [r5, #0xf8]
0007c6c2  lsls    r3, r3, #2
0007c6c4  adds    r3, r3, r5
0007c6c6  ldr.w   r3, [r3, #0xa8]
0007c6ca  str     r3, [r4, #0x40]
0007c6cc  movs    r3, #0x1e
0007c6ce  str     r3, [r4, #0x1c]
0007c6d0  bl      #0x59e34 ; -> pose_him_a0
0007c6d4  ldr.w   r1, [r5, #0xf8]
0007c6d8  ldr     r2, [r4, #0x44]
0007c6da  mov     r0, r4
0007c6dc  lsls    r3, r1, #2
0007c6de  adds    r3, r3, r5
0007c6e0  str.w   r2, [r3, #0xa8]
0007c6e4  adds    r3, r1, #1
0007c6e6  str.w   r3, [r5, #0xf8]
0007c6ea  bl      #0x55c20 ; -> stop_him
0007c6ee  mov     r0, r4
0007c6f0  bl      #0x55348 ; -> ground_him
0007c6f4  ldr.w   r3, [r5, #0xf8]
0007c6f8  movw    r2, #0x623
0007c6fc  subs    r3, #1
0007c6fe  str.w   r3, [r5, #0xf8]
0007c702  lsls    r3, r3, #2
0007c704  adds    r3, r3, r5
0007c706  ldr.w   r3, [r3, #0xa8]
0007c70a  str     r2, [r4, #0x20]
0007c70c  str     r3, [r4, #0x44]
0007c70e  ldr     r3, [r4]
0007c710  ldr     r3, [r3]
0007c712  ldr     r3, [r3]
0007c714  str     r2, [r3, #0x18]
0007c716  movs    r3, #6
0007c718  str     r3, [r4, #0x40]
0007c71a  mvn     r3, #1
0007c71e  str     r3, [r4, #0x20]
0007c720  ldr.w   r3, [r5, #0xa4]
0007c724  movw    r2, #0x38e
0007c728  adds    r3, #1
0007c72a  str.w   r2, [r5, r3, lsl #3]
0007c72e  ldr.w   r2, [pc, #0xf0]
0007c732  ldr.w   r3, [r5, #0xa4]
0007c736  add     r2, pc ; -> 0x00074ee5  t_double_shaker
0007c738  adds    r3, #1
0007c73a  str.w   r3, [r5, #0xa4]
0007c73e  b       #0x7c668
0007c740  mov     r0, r4
0007c742  bl      #0x5a680 ; -> next_anirate
0007c746  ldr     r2, [r4]
0007c748  ldr     r3, [r2, #4]
0007c74a  ldr     r6, [r3, #0x18]
0007c74c  cmp     r6, #0
0007c74e  beq     #0x7c7de
0007c750  ldr.w   r3, [r5, #0xa4]
0007c754  movs    r0, #1
0007c756  movw    r2, #0x3a9
0007c75a  adds    r3, #1
0007c75c  str.w   r2, [r5, r3, lsl #3]
0007c760  str.w   r0, [r5, #0xfc]
0007c764  b       #0x7c63a
0007c766  ldr     r3, [r4, #0x40]
0007c768  subs    r3, #1
0007c76a  str     r3, [r4, #0x40]
0007c76c  cmp     r3, #0
0007c76e  bne     #0x7c71a
0007c770  mov     r0, r4
0007c772  adds    r3, #9
0007c774  str     r3, [r4, #0x40]
0007c776  bl      #0x55228 ; -> get_char_ani2
0007c77a  mov     r0, r4
0007c77c  bl      #0x55450 ; -> find_part2
0007c780  mov     r0, r4
0007c782  bl      #0x59e24 ; -> do_next_a9_frame
0007c786  ldr.w   r3, [r5, #0xa4]
0007c78a  movs    r0, #4
0007c78c  movw    r2, #0x399
0007c790  adds    r3, #1
0007c792  str.w   r2, [r5, r3, lsl #3]
0007c796  str.w   r0, [r5, #0xfc]
0007c79a  b       #0x7c63a
0007c79c  mov     r0, r4
0007c79e  movs    r3, #2
0007c7a0  str     r3, [r4, #0x1c]
0007c7a2  bl      #0x58714 ; -> randu
0007c7a6  ldr     r3, [r4, #0x1c]
0007c7a8  mov     r0, r4
0007c7aa  subs    r3, #1
0007c7ac  str     r3, [r4, #0x1c]
0007c7ae  bl      #0x57be4 ; -> ochar_sound
0007c7b2  mov     r0, r4
0007c7b4  movs    r3, #3
0007c7b6  str     r3, [r4, #0x1c]
0007c7b8  bl      #0x553a0 ; -> init_anirate
0007c7bc  b       #0x7c750
0007c7be  ldr.w   r3, [pc, #0x64]
0007c7c2  mov     r0, r4
0007c7c4  add     r3, pc ; -> 0x0007c505  t_tugged_in_by_spear
0007c7c6  str     r3, [r4, #0x38]
0007c7c8  bl      #0x55130 ; -> xfer_otherguy
0007c7cc  ldr.w   r3, [r5, #0xa4]
0007c7d0  movs    r0, #3
0007c7d2  adds    r3, #1
0007c7d4  str.w   r6, [r5, r3, lsl #3]
0007c7d8  str.w   r0, [r5, #0xfc]
0007c7dc  b       #0x7c63a
0007c7de  ldr.w   r0, [r2, #0x88]
0007c7e2  bl      #0x56d14 ; -> KillProc
0007c7e6  ldr     r3, [r4]
0007c7e8  mov     r0, r4
0007c7ea  str.w   r6, [r3, #0x88]
0007c7ee  ldr     r3, [pc, #0x38]
0007c7f0  add     r3, pc ; -> 0x000f357c  G
0007c7f2  ldr     r3, [r3]
0007c7f4  add.w   r3, r3, #0x420
0007c7f8  str     r3, [r4, #0x1c]
0007c7fa  bl      #0x5742c ; -> update_tsl
0007c7fe  ldr     r3, [pc, #0x2c]
0007c800  mov     r0, r6
0007c802  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007c804  ldr     r2, [r3]
0007c806  ldr.w   r3, [r5, #0xa4]
0007c80a  lsls    r3, r3, #3
0007c80c  adds    r3, r3, r5
0007c80e  str     r2, [r3, #4]
0007c810  ldr.w   r3, [r5, #0xa4]
0007c814  adds    r3, #1
0007c816  str.w   r6, [r5, r3, lsl #3]
0007c81a  b       #0x7c63a
0007c81c  ldrh    r1, [r0, #4]
