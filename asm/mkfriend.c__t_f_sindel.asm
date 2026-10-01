========================================================================
t_f_sindel  0x000a67cc  300 bytes   mkfriend.c
========================================================================

000a67cc  push    {r4, r5, r7, lr}
000a67ce  add     r7, sp, #8
000a67d0  ldr.w   r2, [r0, #0xa4]
000a67d4  mov     r4, r0
000a67d6  ldr.w   r5, [r0, #0x108]
000a67da  adds    r3, r2, #1
000a67dc  ldr.w   r0, [r0, r3, lsl #3]
000a67e0  cmp.w   r0, #0x3c8
000a67e4  beq     #0xa689a
000a67e6  ble     #0xa67fc
000a67e8  movw    r3, #0x3ca
000a67ec  cmp     r0, r3
000a67ee  beq     #0xa68c4
000a67f0  adds    r3, #3
000a67f2  cmp     r0, r3
000a67f4  beq     #0xa6882
000a67f6  mvn     r0, #2
000a67fa  pop     {r4, r5, r7, pc}
000a67fc  cbz     r0, #0xa684e
000a67fe  cmp.w   r0, #0x3bc
000a6802  bne     #0xa67f6
000a6804  movs    r1, #5
000a6806  mov     r0, r5
000a6808  bl      #0x57dbc ; -> rsnd_func
000a680c  mov     r0, r5
000a680e  mov.w   r3, #0x30003
000a6812  str     r3, [r5, #0x48]
000a6814  bl      #0x581e0 ; -> shake_a11
000a6818  ldr     r3, [r5]
000a681a  ldr     r1, [pc, #0xc8]
000a681c  ldr     r0, [r3, #0x68]
000a681e  add     r1, pc ; -> 0x000a68f9  t_football_proc
000a6820  bl      #0x56cdc ; -> StartGrObjAt
000a6824  ldr     r3, [r5]
000a6826  movs    r2, #0
000a6828  str     r2, [r5, #0x20]
000a682a  mov     r0, r5
000a682c  str     r2, [r3, #0x68]
000a682e  ldr     r2, [r5]
000a6830  ldr     r3, [r5, #0x20]
000a6832  str     r3, [r2, #0x64]
000a6834  bl      #0x59e24 ; -> do_next_a9_frame
000a6838  ldr.w   r3, [r4, #0xa4]
000a683c  movs    r0, #0x10
000a683e  mov.w   r2, #0x3c8
000a6842  adds    r3, #1
000a6844  str.w   r2, [r4, r3, lsl #3]
000a6848  str.w   r0, [r4, #0xfc]
000a684c  b       #0xa67fa
000a684e  ldr     r3, [pc, #0x98]
000a6850  mov.w   r2, #0x3bc
000a6854  add     r3, pc ; -> 0x00177bdc  a_lia_friend
000a6856  str     r3, [r5, #0x40]
000a6858  ldr.w   r3, [r4, #0xa4]
000a685c  adds    r3, #1
000a685e  str.w   r2, [r4, r3, lsl #3]
000a6862  ldr.w   r3, [r4, #0xa4]
000a6866  ldr     r2, [pc, #0x84]
000a6868  adds    r3, #1
000a686a  str.w   r3, [r4, #0xa4]
000a686e  lsls    r3, r3, #3
000a6870  adds    r3, r3, r4
000a6872  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a6874  str     r2, [r3, #4]
000a6876  ldr.w   r3, [r4, #0xa4]
000a687a  adds    r3, #1
000a687c  str.w   r0, [r4, r3, lsl #3]
000a6880  b       #0xa67fa
000a6882  ldr     r1, [pc, #0x6c]
000a6884  lsls    r3, r2, #3
000a6886  adds    r3, r3, r4
000a6888  add     r1, pc ; -> 0x000a5991  t_friendship_complete
000a688a  str     r1, [r3, #4]
000a688c  ldr.w   r3, [r4, #0xa4]
000a6890  movs    r0, #0
000a6892  adds    r3, #1
000a6894  str.w   r0, [r4, r3, lsl #3]
000a6898  b       #0xa67fa
000a689a  movw    r2, #0x3ca
000a689e  str.w   r2, [r4, r3, lsl #3]
000a68a2  ldr.w   r3, [r4, #0xa4]
000a68a6  ldr     r2, [pc, #0x4c]
000a68a8  movs    r0, #0
000a68aa  adds    r3, #1
000a68ac  str.w   r3, [r4, #0xa4]
000a68b0  lsls    r3, r3, #3
000a68b2  adds    r3, r3, r4
000a68b4  add     r2, pc ; -> 0x000a56a1  t_mframew_5
000a68b6  str     r2, [r3, #4]
000a68b8  ldr.w   r3, [r4, #0xa4]
000a68bc  adds    r3, #1
000a68be  str.w   r0, [r4, r3, lsl #3]
000a68c2  b       #0xa67fa
000a68c4  mov     r0, r5
000a68c6  movs    r3, #9
000a68c8  str     r3, [r5, #0x1c]
000a68ca  bl      #0x57be4 ; -> ochar_sound
000a68ce  ldr.w   r3, [r4, #0xa4]
000a68d2  movs    r0, #0x40
000a68d4  movw    r2, #0x3cd
000a68d8  adds    r3, #1
000a68da  str.w   r2, [r4, r3, lsl #3]
000a68de  str.w   r0, [r4, #0xfc]
000a68e2  b       #0xa67fa
000a68e4  lsls    r7, r2, #3
000a68e6  movs    r0, r0
000a68e8  asrs    r4, r0, #0xe
000a68ea  movs    r5, r1
000a68ec  mcr     p15, #1, pc, c11, c15, #7
000a68f0  bl      #0x1ac8f2
000a68f4  stcl    p15, c15, [sb, #0x3fc]!
