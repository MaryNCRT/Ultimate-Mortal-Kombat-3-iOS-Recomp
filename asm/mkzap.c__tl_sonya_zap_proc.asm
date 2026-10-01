========================================================================
tl_sonya_zap_proc  0x000767b4  304 bytes   mkzap.c
========================================================================

000767b4  push    {r4, r5, r6, r7, lr}
000767b6  add     r7, sp, #0xc
000767b8  push.w  {r8, sl}
000767bc  ldr.w   r2, [r0, #0xa4]
000767c0  movw    sl, #0x12b7
000767c4  mov     r6, r0
000767c6  adds    r3, r2, #1
000767c8  ldr.w   r4, [r0, #0x108]
000767cc  ldr.w   r5, [r0, r3, lsl #3]
000767d0  cmp     r5, sl
000767d2  beq     #0x7681e
000767d4  movw    r3, #0x12ce
000767d8  cmp     r5, r3
000767da  beq     #0x76806
000767dc  cbz     r5, #0x767e8
000767de  mvn     r0, #2
000767e2  pop.w   {r8, sl}
000767e6  pop     {r4, r5, r6, r7, pc}
000767e8  movs    r3, #0x13
000767ea  mov     r0, r4
000767ec  str     r3, [r4, #0x1c]
000767ee  bl      #0x75f5c ; -> proj_strike_check
000767f2  ldr.w   r8, [r4, #0x5c]
000767f6  cmp.w   r8, #0
000767fa  beq     #0x76888
000767fc  mvn     r3, #0xf
00076800  str     r5, [r4, #0x20]
00076802  str     r3, [r4, #0x1c]
00076804  b       #0x7682c
00076806  ldr     r1, [pc, #0xcc]
00076808  lsls    r3, r2, #3
0007680a  adds    r3, r3, r0
0007680c  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
0007680e  str     r1, [r3, #4]
00076810  ldr.w   r3, [r0, #0xa4]
00076814  movs    r0, #0
00076816  adds    r3, #1
00076818  str.w   r0, [r6, r3, lsl #3]
0007681c  b       #0x767e2
0007681e  ldr     r0, [r4, #8]
00076820  bl      #0x55a60 ; -> stop_a8
00076824  movs    r3, #0xd
00076826  str     r3, [r4, #0x1c]
00076828  subs    r3, #0xd
0007682a  str     r3, [r4, #0x20]
0007682c  mov     r0, r4
0007682e  bl      #0x570ac ; -> multi_adjust_xy
00076832  mov     r0, r4
00076834  movs    r5, #0
00076836  str     r5, [r4, #0x1c]
00076838  bl      #0x58d70 ; -> create_fx
0007683c  ldr     r3, [pc, #0x98]
0007683e  mov     r0, r4
00076840  str     r3, [r4, #0x1c]
00076842  bl      #0x57c18 ; -> hob_ochar_sound
00076846  mov     r0, r4
00076848  movs    r3, #0x3f
0007684a  str     r3, [r4, #0x40]
0007684c  bl      #0x55474 ; -> find_ani_part2
00076850  movs    r3, #4
00076852  str     r3, [r4, #0x1c]
00076854  ldr.w   r3, [r6, #0xa4]
00076858  movw    r2, #0x12ce
0007685c  mov     r0, r5
0007685e  adds    r3, #1
00076860  str.w   r2, [r6, r3, lsl #3]
00076864  ldr.w   r3, [r6, #0xa4]
00076868  adds    r2, r3, #1
0007686a  ldr.w   r3, [pc, #0x70]
0007686e  str.w   r2, [r6, #0xa4]
00076872  add     r3, pc ; -> 0x000f37cc  t_mframew
00076874  ldr     r1, [r3]
00076876  lsls    r3, r2, #3
00076878  adds    r3, r3, r6
0007687a  str     r1, [r3, #4]
0007687c  ldr.w   r3, [r6, #0xa4]
00076880  adds    r3, #1
00076882  str.w   r5, [r6, r3, lsl #3]
00076886  b       #0x767e2
00076888  mov     r0, r4
0007688a  movs    r3, #0x3f
0007688c  str     r3, [r4, #0x40]
0007688e  bl      #0x5520c ; -> get_char_ani
00076892  mov.w   r3, #0x80000
00076896  mov     r0, r4
00076898  str     r3, [r4, #0x1c]
0007689a  movs    r3, #3
0007689c  str     r3, [r4, #0x24]
0007689e  str     r3, [r4, #0x20]
000768a0  bl      #0x75d6c ; -> set_proj_vel
000768a4  movs    r3, #0x12
000768a6  str     r3, [r4, #0x48]
000768a8  ldr.w   r3, [r6, #0xa4]
000768ac  ldr     r2, [pc, #0x30]
000768ae  mov     r0, r8
000768b0  adds    r3, #1
000768b2  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
000768b4  str.w   sl, [r6, r3, lsl #3]
000768b8  ldr.w   r3, [r6, #0xa4]
000768bc  adds    r3, #1
000768be  str.w   r3, [r6, #0xa4]
000768c2  lsls    r3, r3, #3
000768c4  adds    r3, r3, r6
000768c6  str     r2, [r3, #4]
000768c8  ldr.w   r3, [r6, #0xa4]
000768cc  adds    r3, #1
000768ce  str.w   r8, [r6, r3, lsl #3]
000768d2  b       #0x767e2
000768d4  mrc     p15, #2, apsr_nzcv, c5, c15, #7
000768d8  movs    r2, r0
000768da  movs    r1, r0
000768dc  ldm     r7!, {r1, r2, r4, r6}
000768de  movs    r7, r0
000768e0  ldcl    p15, c15, [r7, #-0x3fc]!
