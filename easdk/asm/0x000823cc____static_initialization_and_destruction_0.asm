========================================================================
__static_initialization_and_destruction_0  0x000823cc  220 bytes   EASDK_Handler.mm
========================================================================

000823cc  push    {r4, r5, r7, lr}
000823ce  add     r7, sp, #8
000823d0  cmp     r0, #1
000823d2  beq     #0x823d6
000823d4  pop     {r4, r5, r7, pc}
000823d6  movw    r3, #0xffff
000823da  cmp     r1, r3
000823dc  bne     #0x823d4
000823de  ldr     r2, [pc, #0x90]
000823e0  ldr     r3, [pc, #0x90]
000823e2  ldr     r0, [pc, #0x94]
000823e4  add     r2, pc ; -> 0x000f3378  0x1000
000823e6  movs    r4, #0
000823e8  ldr     r5, [r2]
000823ea  add     r3, pc ; -> 0x00379b34  m_leaderboards
000823ec  mov     r1, r4
000823ee  add     r0, pc ; -> 0x0008000d  tcf_0
000823f0  mov     r2, r5
000823f2  str     r4, [r3]
000823f4  str     r4, [r3, #4]
000823f6  str     r4, [r3, #8]
000823f8  blx     #0xdd5d8 ; -> cxa_atexit
000823fc  ldr     r3, [pc, #0x7c]
000823fe  ldr     r0, [pc, #0x80]
00082400  mov     r1, r4
00082402  add     r3, pc ; -> 0x000f3370  0x0
00082404  add     r0, pc ; -> 0x0007fc81  tcf_1
00082406  ldr     r2, [r3]
00082408  ldr     r3, [pc, #0x78]
0008240a  adds    r2, #0xc
0008240c  add     r3, pc ; -> 0x00379b40  m_mayhemID
0008240e  str     r2, [r3]
00082410  mov     r2, r5
00082412  blx     #0xdd5d8 ; -> cxa_atexit
00082416  ldr     r0, [pc, #0x70]
00082418  mov     r1, r4
0008241a  mov     r2, r5
0008241c  add     r0, pc ; -> 0x0007ffe1  tcf_2
0008241e  blx     #0xdd5d8 ; -> cxa_atexit
00082422  ldr     r0, [pc, #0x68]
00082424  mov     r1, r4
00082426  mov     r2, r5
00082428  add     r0, pc ; -> 0x0007fd65  tcf_3
0008242a  blx     #0xdd5d8 ; -> cxa_atexit
0008242e  ldr     r3, [pc, #0x60]
00082430  ldr     r0, [pc, #0x60]
00082432  mov     r1, r4
00082434  add     r3, pc ; -> 0x00379b4c  m_mayhemToken
00082436  mov     r2, r5
00082438  add     r0, pc ; -> 0x0007fd11  tcf_4
0008243a  str     r4, [r3]
0008243c  blx     #0xdd5d8 ; -> cxa_atexit
00082440  ldr     r0, [pc, #0x54]
00082442  mov     r1, r4
00082444  mov     r2, r5
00082446  add     r0, pc ; -> 0x0007fce5  tcf_5
00082448  blx     #0xdd5d8 ; -> cxa_atexit
0008244c  ldr     r0, [pc, #0x4c]
0008244e  mov     r1, r4
00082450  mov     r2, r5
00082452  add     r0, pc ; -> 0x0007fd39  tcf_6
00082454  blx     #0xdd5d8 ; -> cxa_atexit
00082458  ldr     r3, [pc, #0x44]
0008245a  ldr     r0, [pc, #0x48]
0008245c  mov     r1, r4
0008245e  add     r3, pc ; -> 0x00379bbc  friendsList
00082460  mov     r2, r5
00082462  add     r0, pc ; -> 0x0007ec21  tcf_7
00082464  str     r4, [r3]
00082466  str     r4, [r3, #4]
00082468  str     r4, [r3, #8]
0008246a  blx     #0xdd5d8 ; -> cxa_atexit
0008246e  b       #0x823d4
00082470  lsrs    r0, r2, #0x1e
00082472  movs    r7, r0
00082474  strb    r6, [r0, #0x1d]
00082476  movs    r7, r5
00082478  bgt     #0x824b2
