========================================================================
ZN6Mayhem21GetLeaderboardRequestD2Ev  0x00098064  1164 bytes   Mayhem.mm
========================================================================

00098064  push    {r4, r5, r6, r7, lr}
00098066  add     r7, sp, #0xc
00098068  push.w  {r8, sl, fp}
0009806c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00098070  sub     sp, #0xbc
00098072  ldr.w   r3, [pc, #0x45c]
00098076  str     r0, [sp, #4]
00098078  add     r0, sp, #0x7c
0009807a  add     r3, pc ; -> 0x000f3438  0x0
0009807c  str     r7, [sp, #0x9c]
0009807e  ldr     r3, [r3]
00098080  str.w   sp, [sp, #0xa4]
00098084  str     r3, [sp, #0x94]
00098086  ldr.w   r3, [pc, #0x44c]
0009808a  add     r3, pc ; -> 0x000ee564  GCC_except_table99
0009808c  str     r3, [sp, #0x98]
0009808e  ldr.w   r3, [pc, #0x448]
00098092  add     r3, pc ; -> 0x0009829c  
00098094  orr     r3, r3, #1
00098098  str     r3, [sp, #0xa0]
0009809a  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009809e  ldr.w   r3, [pc, #0x43c]
000980a2  ldr     r2, [sp, #4]
000980a4  add     r3, pc ; -> 0x0017da2c  ZTVN6Mayhem21GetLeaderboardRequestE
000980a6  adds    r3, #8
000980a8  str     r3, [r2]
000980aa  ldr     r0, [sp, #4]
000980ac  movs    r3, #5
000980ae  str     r3, [sp, #0x80]
000980b0  bl      #0x8b6a8 ; -> ZN6Mayhem12MayhemThread4waitEv
000980b4  ldr     r3, [sp, #4]
000980b6  ldr     r4, [sp, #4]
000980b8  ldr     r3, [r3, #0x74]
000980ba  str     r3, [sp, #0x6c]
000980bc  ldr     r2, [sp, #0x6c]
000980be  ldr     r3, [r4, #0x70]
000980c0  cmp     r2, r3
000980c2  str     r3, [sp, #0xb0]
000980c4  str     r3, [sp, #0x68]
000980c6  beq     #0x980dc
000980c8  ldr     r3, [sp, #0x68]
000980ca  ldr     r0, [r3], #4
000980ce  str     r3, [sp, #0x68]
000980d0  blx     #0xdd5a8 ; -> ZdlPv
000980d4  ldr     r4, [sp, #0x6c]
000980d6  ldr     r2, [sp, #0x68]
000980d8  cmp     r4, r2
000980da  bne     #0x980c8
000980dc  ldr     r4, [sp, #4]
000980de  ldr     r3, [r4, #0x70]
000980e0  ldr.w   r2, [r4, #0x9c]
000980e4  str     r3, [r4, #0x74]
000980e6  ldr     r3, [pc, #0x3f8]
000980e8  sub.w   r0, r2, #0xc
000980ec  add     r3, pc ; -> 0x000f3370  0x0
000980ee  ldr     r3, [r3]
000980f0  cmp     r0, r3
000980f2  str     r3, [sp, #0x24]
000980f4  bne.w   #0x98226
000980f8  ldr     r3, [sp, #4]
000980fa  ldr     r2, [sp, #4]
000980fc  ldr     r4, [sp, #4]
000980fe  adds    r2, #0x88
00098100  str     r2, [sp, #0x34]
00098102  ldr.w   r3, [r3, #0x88]
00098106  str     r3, [sp, #0x3c]
00098108  ldr.w   r4, [r4, #0x8c]
0009810c  cmp     r3, r4
0009810e  str     r4, [sp, #0x38]
00098110  beq     #0x9812a
00098112  ldr     r4, [sp, #0x3c]
00098114  ldr     r3, [r4]
00098116  mov     r0, r4
00098118  ldr     r2, [r3]
0009811a  movs    r3, #3
0009811c  str     r3, [sp, #0x80]
0009811e  blx     r2
00098120  ldr     r2, [sp, #0x38]
00098122  adds    r4, #8
00098124  str     r4, [sp, #0x3c]
00098126  cmp     r2, r4
00098128  bne     #0x98112
0009812a  ldr     r3, [sp, #0x34]
0009812c  ldr     r0, [r3]
0009812e  cbz     r0, #0x98134
00098130  blx     #0xdd5a8 ; -> ZdlPv
00098134  ldr     r2, [sp, #4]
00098136  ldr     r4, [sp, #4]
00098138  ldr     r3, [sp, #4]
0009813a  adds    r4, #0x7c
0009813c  str     r4, [sp, #0x4c]
0009813e  ldr     r2, [r2, #0x7c]
00098140  str     r2, [sp, #0x54]
00098142  ldr.w   r3, [r3, #0x80]
00098146  cmp     r2, r3
00098148  str     r3, [sp, #0x50]
0009814a  beq     #0x98164
0009814c  ldr     r4, [sp, #0x54]
0009814e  ldr     r3, [r4]
00098150  mov     r0, r4
00098152  ldr     r2, [r3]
00098154  movs    r3, #1
00098156  str     r3, [sp, #0x80]
00098158  blx     r2
0009815a  ldr     r2, [sp, #0x50]
0009815c  adds    r4, #8
0009815e  str     r4, [sp, #0x54]
00098160  cmp     r2, r4
00098162  bne     #0x9814c
00098164  ldr     r2, [sp, #0x4c]
00098166  ldr     r0, [r2]
00098168  cbz     r0, #0x9816e
0009816a  blx     #0xdd5a8 ; -> ZdlPv
0009816e  ldr     r3, [sp, #4]
00098170  ldr     r0, [r3, #0x70]
00098172  cbz     r0, #0x98178
00098174  blx     #0xdd5a8 ; -> ZdlPv
00098178  ldr     r4, [sp, #4]
0009817a  ldr     r0, [r4, #0x64]
0009817c  cbz     r0, #0x98182
0009817e  blx     #0xdd5a8 ; -> ZdlPv
00098182  ldr     r2, [sp, #4]
00098184  ldr     r4, [sp, #4]
00098186  adds    r4, #0x58
00098188  str     r4, [sp, #0x60]
0009818a  ldr     r3, [r2, #0x58]
0009818c  ldr     r4, [r2, #0x5c]
0009818e  cmp     r3, r4
00098190  str     r4, [sp, #0x64]
00098192  it      ne
00098194  strne   r3, [sp, #0x78]
00098196  beq     #0x981b2
00098198  ldr     r2, [sp, #0x78]
0009819a  ldr     r4, [sp, #0x24]
0009819c  ldr     r3, [r2]
0009819e  sub.w   r0, r3, #0xc
000981a2  cmp     r4, r0
000981a4  bne     #0x981ee
000981a6  ldr     r2, [sp, #0x78]
000981a8  ldr     r3, [sp, #0x64]
000981aa  adds    r2, #4
000981ac  cmp     r3, r2
000981ae  str     r2, [sp, #0x78]
000981b0  bne     #0x98198
000981b2  ldr     r4, [sp, #0x60]
000981b4  ldr     r0, [r4]
000981b6  cbz     r0, #0x981bc
000981b8  blx     #0xdd5a8 ; -> ZdlPv
000981bc  ldr     r2, [sp, #4]
000981be  ldr     r4, [sp, #0x24]
000981c0  ldr     r3, [r2, #0x50]
000981c2  sub.w   r0, r3, #0xc
000981c6  cmp     r4, r0
000981c8  bne     #0x98254
000981ca  ldr     r0, [sp, #4]
000981cc  mov.w   r3, #-1
000981d0  str     r3, [sp, #0x80]
000981d2  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
000981d6  add     r0, sp, #0x7c
000981d8  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000981dc  sub.w   sp, r7, #0x58
000981e0  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000981e4  sub.w   sp, r7, #0x18
000981e8  pop.w   {r8, sl, fp}
000981ec  pop     {r4, r5, r6, r7, pc}
000981ee  subs    r2, r3, #4
000981f0  ldr     r3, [r3, #-0x4]
000981f4  subs    r1, r3, #1
000981f6  dmb     ish
000981fa  mov     ip, r3
000981fc  ldrex   lr, [r2]
00098200  cmp     lr, r3
00098202  beq     #0x98218
00098204  cmp     lr, ip
00098206  mov     r3, lr
00098208  bne     #0x981f4
0009820a  cmp.w   lr, #0
0009820e  bgt     #0x981a6
00098210  add     r1, sp, #0xb8
00098212  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098216  b       #0x981a6
00098218  strex   r4, r1, [r2]
0009821c  cmp     r4, #0
0009821e  bne     #0x981fc
00098220  dmb     ish
00098224  b       #0x98204
00098226  ldr     r3, [r2, #-0x4]
0009822a  subs    r1, r2, #4
0009822c  subs    r2, r3, #1
0009822e  dmb     ish
00098232  mov     ip, r3
00098234  ldrex   lr, [r1]
00098238  cmp     lr, r3
0009823a  beq     #0x9828e
0009823c  cmp     lr, ip
0009823e  mov     r3, lr
00098240  bne     #0x9822c
00098242  cmp.w   lr, #0
00098246  bgt.w   #0x980f8
0009824a  add.w   r1, sp, #0xbb
0009824e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098252  b       #0x980f8
00098254  subs    r2, r3, #4
00098256  ldr     r3, [r3, #-0x4]
0009825a  subs    r1, r3, #1
0009825c  dmb     ish
00098260  mov     ip, r3
00098262  ldrex   r4, [r2]
00098266  cmp     r4, r3
00098268  beq     #0x9827e
0009826a  cmp     r4, ip
0009826c  mov     r3, r4
0009826e  bne     #0x9825a
00098270  cmp     r4, #0
00098272  bgt     #0x981ca
00098274  add.w   r1, sp, #0xb6
00098278  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009827c  b       #0x981ca
0009827e  strex   lr, r1, [r2]
00098282  cmp.w   lr, #0
00098286  bne     #0x98262
00098288  dmb     ish
0009828c  b       #0x9826a
0009828e  strex   r4, r2, [r1]
00098292  cmp     r4, #0
00098294  bne     #0x98234
00098296  dmb     ish
0009829a  b       #0x9823c
0009829c  ldr     r3, [sp, #0x80]
0009829e  ldr     r4, [sp, #0x84]
000982a0  cmp     r3, #1
000982a2  str     r4, [sp]
000982a4  beq.w   #0x9844a
000982a8  cmp     r3, #2
000982aa  beq.w   #0x98440
000982ae  cmp     r3, #3
000982b0  beq.w   #0x983b8
000982b4  cmp     r3, #4
000982b6  beq     #0x9835a
000982b8  ldr     r4, [sp, #0x4c]
000982ba  ldr     r0, [r4]
000982bc  cbz     r0, #0x982c2
000982be  blx     #0xdd5a8 ; -> ZdlPv
000982c2  ldr     r2, [sp]
000982c4  ldr     r3, [sp, #4]
000982c6  str     r2, [sp, #0x14]
000982c8  ldr     r0, [r3, #0x70]
000982ca  cbz     r0, #0x982d0
000982cc  blx     #0xdd5a8 ; -> ZdlPv
000982d0  ldr     r2, [sp, #0x14]
000982d2  ldr     r3, [sp, #4]
000982d4  str     r2, [sp, #0x18]
000982d6  ldr     r0, [r3, #0x64]
000982d8  cbz     r0, #0x982de
000982da  blx     #0xdd5a8 ; -> ZdlPv
000982de  ldr     r2, [sp, #0x18]
000982e0  ldr     r4, [sp, #4]
000982e2  ldr     r3, [sp, #4]
000982e4  str     r2, [sp, #0x1c]
000982e6  adds    r3, #0x58
000982e8  str     r3, [sp, #0x58]
000982ea  ldr     r2, [r4, #0x58]
000982ec  ldr.w   lr, [r4, #0x5c]
000982f0  cmp     r2, lr
000982f2  str.w   lr, [sp, #0x5c]
000982f6  beq     #0x9831e
000982f8  ldr     r3, [pc, #0x1e8]
000982fa  str     r2, [sp, #0x74]
000982fc  add     r3, pc ; -> 0x000f3370  0x0
000982fe  ldr     r3, [r3]
00098300  str     r3, [sp, #0x70]
00098302  ldr     r4, [sp, #0x74]
00098304  ldr     r2, [sp, #0x70]
00098306  ldr     r3, [r4]
00098308  sub.w   r0, r3, #0xc
0009830c  cmp     r0, r2
0009830e  bne.w   #0x98456
00098312  ldr     r2, [sp, #0x74]
00098314  ldr     r3, [sp, #0x5c]
00098316  adds    r2, #4
00098318  cmp     r3, r2
0009831a  str     r2, [sp, #0x74]
0009831c  bne     #0x98302
0009831e  ldr     r4, [sp, #0x58]
00098320  ldr     r0, [r4]
00098322  cbz     r0, #0x98328
00098324  blx     #0xdd5a8 ; -> ZdlPv
00098328  ldr     r3, [sp, #4]
0009832a  ldr     r2, [sp, #0x1c]
0009832c  str     r2, [sp, #0x20]
0009832e  ldr     r1, [r3, #0x50]
00098330  ldr     r3, [pc, #0x1b4]
00098332  sub.w   r0, r1, #0xc
00098336  add     r3, pc ; -> 0x000f3370  0x0
00098338  ldr     r3, [r3]
0009833a  cmp     r0, r3
0009833c  bne.w   #0x98492
00098340  ldr     r2, [sp, #0x20]
00098342  ldr     r0, [sp, #4]
00098344  movs    r3, #0
00098346  str     r3, [sp, #0x80]
00098348  str     r2, [sp]
0009834a  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0009834e  ldr     r0, [sp]
00098350  mov.w   r3, #-1
00098354  str     r3, [sp, #0x80]
00098356  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009835a  ldr     r3, [sp, #4]
0009835c  ldr     r2, [sp]
0009835e  str     r2, [sp, #8]
00098360  ldr.w   r1, [r3, #0x9c]
00098364  ldr     r3, [pc, #0x184]
00098366  sub.w   r0, r1, #0xc
0009836a  add     r3, pc ; -> 0x000f3370  0x0
0009836c  ldr     r3, [r3]
0009836e  cmp     r0, r3
00098370  bne     #0x98406
00098372  ldr     r2, [sp, #8]
00098374  ldr     r4, [sp, #4]
00098376  ldr     r3, [sp, #4]
00098378  str     r2, [sp, #0xc]
0009837a  adds    r3, #0x88
0009837c  ldr     r2, [sp, #4]
0009837e  str     r3, [sp, #0x28]
00098380  ldr.w   r4, [r4, #0x88]
00098384  str     r4, [sp, #0x30]
00098386  ldr.w   r2, [r2, #0x8c]
0009838a  cmp     r4, r2
0009838c  str     r2, [sp, #0x2c]
0009838e  beq     #0x983a8
00098390  ldr     r4, [sp, #0x30]
00098392  ldr     r3, [r4]
00098394  mov     r0, r4
00098396  ldr     r2, [r3]
00098398  movs    r3, #4
0009839a  str     r3, [sp, #0x80]
0009839c  blx     r2
0009839e  ldr     r2, [sp, #0x2c]
000983a0  adds    r4, #8
000983a2  str     r4, [sp, #0x30]
000983a4  cmp     r2, r4
000983a6  bne     #0x98390
000983a8  ldr     r3, [sp, #0x28]
000983aa  ldr     r0, [r3]
000983ac  cbz     r0, #0x983b2
000983ae  blx     #0xdd5a8 ; -> ZdlPv
000983b2  ldr     r4, [sp, #0xc]
000983b4  str     r4, [sp]
000983b6  b       #0x983c2
000983b8  ldr     r2, [sp, #0x28]
000983ba  ldr     r0, [r2]
000983bc  cbz     r0, #0x983c2
000983be  blx     #0xdd5a8 ; -> ZdlPv
000983c2  ldr     r2, [sp]
000983c4  ldr     r4, [sp, #4]
000983c6  ldr     r3, [sp, #4]
000983c8  str     r2, [sp, #0x10]
000983ca  adds    r3, #0x7c
000983cc  ldr     r2, [sp, #4]
000983ce  str     r3, [sp, #0x40]
000983d0  ldr     r4, [r4, #0x7c]
000983d2  str     r4, [sp, #0x48]
000983d4  ldr.w   r2, [r2, #0x80]
000983d8  cmp     r4, r2
000983da  str     r2, [sp, #0x44]
000983dc  beq     #0x983f6
000983de  ldr     r4, [sp, #0x48]
000983e0  ldr     r3, [r4]
000983e2  mov     r0, r4
000983e4  ldr     r2, [r3]
000983e6  movs    r3, #2
000983e8  str     r3, [sp, #0x80]
000983ea  blx     r2
000983ec  ldr     r2, [sp, #0x44]
000983ee  adds    r4, #8
000983f0  str     r4, [sp, #0x48]
000983f2  cmp     r2, r4
000983f4  bne     #0x983de
000983f6  ldr     r3, [sp, #0x40]
000983f8  ldr     r0, [r3]
000983fa  cbz     r0, #0x98400
000983fc  blx     #0xdd5a8 ; -> ZdlPv
00098400  ldr     r4, [sp, #0x10]
00098402  str     r4, [sp]
00098404  b       #0x982c2
00098406  ldr     r3, [r1, #-0x4]
0009840a  subs    r2, r1, #4
0009840c  subs    r1, r3, #1
0009840e  dmb     ish
00098412  mov     ip, r3
00098414  ldrex   r4, [r2]
00098418  cmp     r4, r3
0009841a  beq     #0x98430
0009841c  cmp     r4, ip
0009841e  mov     r3, r4
00098420  bne     #0x9840c
00098422  cmp     r4, #0
00098424  bgt     #0x98372
00098426  add.w   r1, sp, #0xba
0009842a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009842e  b       #0x98372
00098430  strex   lr, r1, [r2]
00098434  cmp.w   lr, #0
00098438  bne     #0x98414
0009843a  dmb     ish
0009843e  b       #0x9841c
00098440  ldr     r4, [sp, #0x34]
00098442  ldr     r0, [r4]
00098444  cmp     r0, #0
00098446  bne     #0x983be
00098448  b       #0x983c2
0009844a  ldr     r2, [sp, #0x40]
0009844c  ldr     r0, [r2]
0009844e  cmp     r0, #0
00098450  bne.w   #0x982be
00098454  b       #0x982c2
00098456  subs    r2, r3, #4
00098458  ldr     r3, [r3, #-0x4]
0009845c  subs    r1, r3, #1
0009845e  dmb     ish
00098462  mov     ip, r3
00098464  ldrex   r4, [r2]
00098468  cmp     r4, r3
0009846a  beq     #0x98482
0009846c  cmp     r4, ip
0009846e  mov     r3, r4
00098470  bne     #0x9845c
00098472  cmp     r4, #0
00098474  bgt.w   #0x98312
00098478  add.w   r1, sp, #0xb9
0009847c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00098480  b       #0x98312
00098482  strex   lr, r1, [r2]
00098486  cmp.w   lr, #0
0009848a  bne     #0x98464
0009848c  dmb     ish
00098490  b       #0x9846c
00098492  ldr     r3, [r1, #-0x4]
00098496  subs    r2, r1, #4
00098498  subs    r1, r3, #1
0009849a  dmb     ish
0009849e  mov     ip, r3
000984a0  ldrex   r4, [r2]
000984a4  cmp     r4, r3
000984a6  beq     #0x984be
000984a8  cmp     r4, ip
000984aa  mov     r3, r4
000984ac  bne     #0x98498
000984ae  cmp     r4, #0
000984b0  bgt.w   #0x98340
000984b4  add.w   r1, sp, #0xb7
000984b8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000984bc  b       #0x98340
000984be  strex   lr, r1, [r2]
000984c2  cmp.w   lr, #0
000984c6  bne     #0x984a0
000984c8  dmb     ish
000984cc  b       #0x984a8
000984ce  nop     
000984d0  cbz     r2, #0x98542
000984d2  movs    r5, r0
000984d4  str     r6, [r2, #0x4c]
000984d6  movs    r5, r0
000984d8  lsls    r6, r0, #8
000984da  movs    r0, r0
000984dc  ldr     r4, [r0, r6]
000984de  movs    r6, r1
000984e0  uxth    r0, r0
000984e2  movs    r5, r0
000984e4  add     sp, #0x1c0
000984e6  movs    r5, r0
000984e8  add     sp, #0xd8
000984ea  movs    r5, r0
000984ec  add     sp, #8
000984ee  movs    r5, r0
