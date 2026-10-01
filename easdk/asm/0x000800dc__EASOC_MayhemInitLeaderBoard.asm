========================================================================
EASOC_MayhemInitLeaderBoard  0x000800dc  1032 bytes   EASDK_Handler.mm
========================================================================

000800dc  push    {r4, r5, r6, r7, lr}
000800de  add     r7, sp, #0xc
000800e0  push.w  {r8, sl, fp}
000800e4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000800e8  sub     sp, #0x18c
000800ea  str     r3, [sp, #0x18]
000800ec  ldr     r3, [pc, #0x3bc]
000800ee  str     r0, [sp, #0x24]
000800f0  add     r0, sp, #0x78
000800f2  add     r3, pc ; -> 0x000f301c  0x0
000800f4  str     r2, [sp, #0x1c]
000800f6  ldr     r3, [r3]
000800f8  str     r1, [sp, #0x20]
000800fa  str     r7, [sp, #0x98]
000800fc  str.w   sp, [sp, #0xa0]
00080100  str     r3, [sp, #0x90]
00080102  ldr     r3, [pc, #0x3ac]
00080104  add     r3, pc ; -> 0x000ee114  GCC_except_table8
00080106  str     r3, [sp, #0x94]
00080108  ldr     r3, [pc, #0x3a8]
0008010a  add     r3, pc ; -> 0x00080382  
0008010c  orr     r3, r3, #1
00080110  str     r3, [sp, #0x9c]
00080112  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00080116  add     r1, sp, #0x7c
00080118  ldr     r0, [pc, #0x39c]
0008011a  str     r1, [sp, #0x10]
0008011c  mov.w   r3, #-1
00080120  str     r3, [r1]
00080122  ldr     r1, [sp, #0x20]
00080124  add     r0, pc ; -> 0x00175800  'INIT LEADERBOARDS: p = %s\n'
00080126  blx     #0xddc38 ; -> printf
0008012a  ldr     r2, [pc, #0x390]
0008012c  movs    r1, #0x64
0008012e  ldr     r3, [sp, #0x1ec]
00080130  add     r2, pc ; -> 0x0017581c  '%s'
00080132  add     r0, sp, #0x110
00080134  blx     #0xddcf8 ; -> snprintf
00080138  ldr     r2, [pc, #0x384]
0008013a  movs    r1, #0x64
0008013c  ldr     r3, [sp, #0x20]
0008013e  add     r2, pc ; -> 0x00175820  '%s'
00080140  add     r0, sp, #0xac
00080142  blx     #0xddcf8 ; -> snprintf
00080146  movs    r3, #0
00080148  str     r3, [sp, #0x180]
0008014a  ldr     r3, [pc, #0x378]
0008014c  add     r3, pc ; -> 0x00379b34  m_leaderboards
0008014e  ldr     r2, [r3, #4]
00080150  str     r2, [sp, #0x40]
00080152  ldr     r4, [sp, #0x40]
00080154  ldr     r2, [r3]
00080156  rsb     r3, r2, r4
0008015a  asrs    r3, r3, #2
0008015c  cmp     r3, #1
0008015e  bls.w   #0x802f6
00080162  adds    r2, #4
00080164  cmp     r4, r2
00080166  str     r2, [sp, #0x48]
00080168  beq     #0x801a2
0008016a  str     r2, [sp, #0x70]
0008016c  b       #0x8017a
0008016e  ldr     r3, [sp, #0x70]
00080170  ldr     r4, [sp, #0x40]
00080172  adds    r3, #4
00080174  cmp     r4, r3
00080176  str     r3, [sp, #0x70]
00080178  beq     #0x801a2
0008017a  ldr     r1, [sp, #0x70]
0008017c  ldr     r1, [r1]
0008017e  str     r1, [sp, #0x44]
00080180  cmp     r1, #0
00080182  beq     #0x8016e
00080184  ldr     r3, [r1]
00080186  movs    r2, #1
00080188  ldr     r1, [r3, #8]
0008018a  add     r3, sp, #0x7c
0008018c  str     r2, [r3]
0008018e  ldr     r0, [sp, #0x44]
00080190  blx     r1
00080192  cmp     r0, #0
00080194  beq     #0x8016e
00080196  ldr     r2, [sp, #0x44]
00080198  ldr     r3, [r2]
0008019a  mov     r0, r2
0008019c  ldr     r3, [r3, #4]
0008019e  blx     r3
000801a0  b       #0x8016e
000801a2  ldr     r3, [pc, #0x324]
000801a4  ldr     r1, [sp, #0x48]
000801a6  add     r3, pc ; -> 0x00379b34  m_leaderboards
000801a8  str     r1, [r3, #4]
000801aa  ldr     r2, [sp, #0x180]
000801ac  str     r2, [sp, #0x50]
000801ae  cbz     r2, #0x801c6
000801b0  ldr     r3, [r2]
000801b2  mov.w   r2, #-1
000801b6  ldr     r1, [r3, #8]
000801b8  add     r3, sp, #0x7c
000801ba  str     r2, [r3]
000801bc  ldr     r0, [sp, #0x50]
000801be  blx     r1
000801c0  cmp     r0, #0
000801c2  bne.w   #0x802ea
000801c6  ldr.w   r3, [pc, #0x304]
000801ca  add.w   lr, sp, #0x7c
000801ce  add     r2, sp, #0x188
000801d0  add     r3, pc ; -> 0x00379b34  m_leaderboards
000801d2  add     r0, sp, #0x17c
000801d4  ldr     r3, [r3]
000801d6  add     r1, sp, #0x110
000801d8  adds    r2, #3
000801da  str     r3, [sp, #0x54]
000801dc  ldr.w   r3, [pc, #0x2f0]
000801e0  add     r3, pc ; -> 0x00379b4c  m_mayhemToken
000801e2  ldr     r3, [r3]
000801e4  str.w   lr, [sp, #0xc]
000801e8  str     r3, [sp, #0x28]
000801ea  movs    r3, #6
000801ec  str.w   r3, [lr]
000801f0  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000801f4  ldr     r2, [sp, #0xc]
000801f6  movs    r3, #5
000801f8  add     r0, sp, #0x178
000801fa  add     r1, sp, #0xac
000801fc  str     r3, [r2]
000801fe  add.w   r2, sp, #0x18a
00080202  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00080206  ldr     r4, [sp, #0xc]
00080208  movs    r3, #4
0008020a  movs    r0, #0xa0
0008020c  str     r3, [r4]
0008020e  blx     #0xdd5c0 ; -> Znwm
00080212  ldr     r1, [sp, #0x1c]
00080214  ldr     r2, [sp, #0x18]
00080216  str     r0, [sp, #0x5c]
00080218  str     r0, [sp, #0x2c]
0008021a  add     r3, sp, #0x178
0008021c  str     r1, [sp, #4]
0008021e  str     r3, [sp]
00080220  str     r2, [sp, #8]
00080222  movs    r3, #3
00080224  str     r3, [r4]
00080226  ldr     r0, [sp, #0x5c]
00080228  ldr     r1, [sp, #0x28]
0008022a  add     r2, sp, #0x17c
0008022c  ldr     r3, [sp, #0x24]
0008022e  bl      #0x9803c ; -> ZN6Mayhem21GetLeaderboardRequestC1EPNS_5TokenERKSsiS4_ii
00080232  ldr     r4, [sp, #0x5c]
00080234  ldr     r1, [sp, #0x2c]
00080236  add     r3, sp, #0x174
00080238  str     r3, [sp, #0x58]
0008023a  str     r4, [sp, #0x174]
0008023c  cbz     r1, #0x8024c
0008023e  ldr     r3, [r4]
00080240  movs    r2, #4
00080242  ldr     r1, [r3, #0xc]
00080244  add     r3, sp, #0x7c
00080246  str     r2, [r3]
00080248  ldr     r0, [sp, #0x5c]
0008024a  blx     r1
0008024c  ldr     r2, [sp, #0x174]
0008024e  str     r2, [sp, #0x6c]
00080250  cbz     r2, #0x80260
00080252  ldr     r3, [r2]
00080254  movs    r2, #2
00080256  ldr     r1, [r3, #0xc]
00080258  add     r3, sp, #0x7c
0008025a  str     r2, [r3]
0008025c  ldr     r0, [sp, #0x6c]
0008025e  blx     r1
00080260  ldr     r3, [sp, #0x54]
00080262  ldr     r1, [sp, #0x6c]
00080264  ldr     r4, [sp, #0x54]
00080266  ldr     r3, [r3]
00080268  str     r3, [sp, #0x74]
0008026a  str     r1, [r4]
0008026c  cbz     r3, #0x80282
0008026e  ldr     r2, [sp, #0x74]
00080270  ldr     r3, [r2]
00080272  movs    r2, #2
00080274  ldr     r1, [r3, #8]
00080276  add     r3, sp, #0x7c
00080278  str     r2, [r3]
0008027a  ldr     r0, [sp, #0x74]
0008027c  blx     r1
0008027e  cmp     r0, #0
00080280  bne     #0x802de
00080282  ldr     r1, [sp, #0x58]
00080284  ldr     r1, [r1]
00080286  str     r1, [sp, #0x64]
00080288  cbz     r1, #0x8029c
0008028a  ldr     r2, [sp, #0x64]
0008028c  ldr     r3, [r2]
0008028e  movs    r2, #4
00080290  ldr     r1, [r3, #8]
00080292  add     r3, sp, #0x7c
00080294  str     r2, [r3]
00080296  ldr     r0, [sp, #0x64]
00080298  blx     r1
0008029a  cbnz    r0, #0x802d2
0008029c  ldr     r3, [pc, #0x234]
0008029e  ldr     r2, [sp, #0x178]
000802a0  add     r3, pc ; -> 0x000f3370  0x0
000802a2  sub.w   r0, r2, #0xc
000802a6  ldr     r3, [r3]
000802a8  cmp     r0, r3
000802aa  str     r3, [sp, #0x68]
000802ac  bne     #0x80310
000802ae  ldr     r3, [sp, #0x17c]
000802b0  ldr     r1, [sp, #0x68]
000802b2  sub.w   r0, r3, #0xc
000802b6  cmp     r1, r0
000802b8  bne     #0x80338
000802ba  add     r0, sp, #0x78
000802bc  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
000802c0  sub.w   sp, r7, #0x58
000802c4  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
000802c8  sub.w   sp, r7, #0x18
000802cc  pop.w   {r8, sl, fp}
000802d0  pop     {r4, r5, r6, r7, pc}
000802d2  ldr     r4, [sp, #0x64]
000802d4  ldr     r3, [r4]
000802d6  mov     r0, r4
000802d8  ldr     r3, [r3, #4]
000802da  blx     r3
000802dc  b       #0x8029c
000802de  ldr     r4, [sp, #0x74]
000802e0  ldr     r3, [r4]
000802e2  mov     r0, r4
000802e4  ldr     r3, [r3, #4]
000802e6  blx     r3
000802e8  b       #0x80282
000802ea  ldr     r4, [sp, #0x50]
000802ec  ldr     r3, [r4]
000802ee  mov     r0, r4
000802f0  ldr     r3, [r3, #4]
000802f2  blx     r3
000802f4  b       #0x801c6
000802f6  ldr     r4, [sp, #0x10]
000802f8  ldr.w   r0, [pc, #0x1dc]
000802fc  rsb.w   r2, r3, #1
00080300  movs    r3, #7
00080302  str     r3, [r4]
00080304  add     r0, pc ; -> 0x00379b34  m_leaderboards
00080306  ldr     r1, [sp, #0x40]
00080308  add     r3, sp, #0x180
0008030a  bl      #0x81e24 ; -> ZNSt6vectorIN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEESaIS4_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS4_S6_EEmRKS4_
0008030e  b       #0x801aa
00080310  ldr     r3, [r2, #-0x4]
00080314  subs    r1, r2, #4
00080316  subs    r2, r3, #1
00080318  dmb     ish
0008031c  mov     ip, r3
0008031e  ldrex   r4, [r1]
00080322  cmp     r4, r3
00080324  beq     #0x80372
00080326  cmp     r4, ip
00080328  mov     r3, r4
0008032a  bne     #0x80316
0008032c  cmp     r4, #0
0008032e  bgt     #0x802ae
00080330  add     r1, sp, #0x188
00080332  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080336  b       #0x802ae
00080338  subs    r2, r3, #4
0008033a  ldr     r3, [r3, #-0x4]
0008033e  subs    r1, r3, #1
00080340  dmb     ish
00080344  mov     ip, r3
00080346  ldrex   r4, [r2]
0008034a  cmp     r4, r3
0008034c  beq     #0x80362
0008034e  cmp     r4, ip
00080350  mov     r3, r4
00080352  bne     #0x8033e
00080354  cmp     r4, #0
00080356  bgt     #0x802ba
00080358  add     r1, sp, #0x184
0008035a  adds    r1, #3
0008035c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080360  b       #0x802ba
00080362  strex   lr, r1, [r2]
00080366  cmp.w   lr, #0
0008036a  bne     #0x80346
0008036c  dmb     ish
00080370  b       #0x8034e
00080372  strex   lr, r2, [r1]
00080376  cmp.w   lr, #0
0008037a  bne     #0x8031e
0008037c  dmb     ish
00080380  b       #0x80326
00080382  add     r1, sp, #0x7c
00080384  add     r2, sp, #0x80
00080386  ldr     r3, [r1]
00080388  ldr     r2, [r2]
0008038a  cmp     r3, #1
0008038c  str     r2, [sp, #0x14]
0008038e  beq     #0x803d4
00080390  cmp     r3, #2
00080392  beq     #0x80494
00080394  cmp     r3, #3
00080396  beq     #0x803fe
00080398  cmp     r3, #4
0008039a  beq     #0x80416
0008039c  cmp     r3, #5
0008039e  beq     #0x803c6
000803a0  ldr     r2, [sp, #0x14]
000803a2  ldr     r3, [sp, #0x180]
000803a4  str     r2, [sp, #0x30]
000803a6  str     r3, [sp, #0x4c]
000803a8  cbz     r3, #0x803c2
000803aa  ldr     r3, [r3]
000803ac  ldr     r2, [r3, #8]
000803ae  movs    r3, #0
000803b0  str     r3, [r1]
000803b2  ldr     r0, [sp, #0x4c]
000803b4  blx     r2
000803b6  cbz     r0, #0x803c2
000803b8  ldr     r4, [sp, #0x4c]
000803ba  ldr     r3, [r4]
000803bc  mov     r0, r4
000803be  ldr     r3, [r3, #4]
000803c0  blx     r3
000803c2  ldr     r1, [sp, #0x30]
000803c4  str     r1, [sp, #0x14]
000803c6  add     r3, sp, #0x7c
000803c8  mov.w   r2, #-1
000803cc  str     r2, [r3]
000803ce  ldr     r0, [sp, #0x14]
000803d0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000803d4  ldr     r2, [sp, #0x14]
000803d6  ldr     r3, [sp, #0x58]
000803d8  str     r2, [sp, #0x34]
000803da  ldr     r3, [r3]
000803dc  str     r3, [sp, #0x60]
000803de  cbz     r3, #0x803fa
000803e0  ldr     r3, [r3]
000803e2  movs    r2, #0
000803e4  ldr     r1, [r3, #8]
000803e6  add     r3, sp, #0x7c
000803e8  str     r2, [r3]
000803ea  ldr     r0, [sp, #0x60]
000803ec  blx     r1
000803ee  cbz     r0, #0x803fa
000803f0  ldr     r4, [sp, #0x60]
000803f2  ldr     r3, [r4]
000803f4  mov     r0, r4
000803f6  ldr     r3, [r3, #4]
000803f8  blx     r3
000803fa  ldr     r1, [sp, #0x34]
000803fc  str     r1, [sp, #0x14]
000803fe  ldr     r1, [sp, #0x14]
00080400  ldr     r3, [pc, #0xd8]
00080402  add     r3, pc ; -> 0x000f3370  0x0
00080404  str     r1, [sp, #0x38]
00080406  ldr     r1, [sp, #0x178]
00080408  ldr     r3, [r3]
0008040a  sub.w   r0, r1, #0xc
0008040e  cmp     r0, r3
00080410  bne     #0x8045a
00080412  ldr     r1, [sp, #0x38]
00080414  str     r1, [sp, #0x14]
00080416  ldr     r1, [sp, #0x14]
00080418  ldr     r3, [pc, #0xc4]
0008041a  add     r3, pc ; -> 0x000f3370  0x0
0008041c  str     r1, [sp, #0x3c]
0008041e  ldr     r1, [sp, #0x17c]
00080420  ldr     r3, [r3]
00080422  sub.w   r0, r1, #0xc
00080426  cmp     r0, r3
00080428  bne     #0x80430
0008042a  ldr     r1, [sp, #0x3c]
0008042c  str     r1, [sp, #0x14]
0008042e  b       #0x803c6
00080430  ldr     r3, [r1, #-0x4]
00080434  subs    r2, r1, #4
00080436  subs    r1, r3, #1
00080438  dmb     ish
0008043c  mov     ip, r3
0008043e  ldrex   r4, [r2]
00080442  cmp     r4, r3
00080444  beq     #0x80484
00080446  cmp     r4, ip
00080448  mov     r3, r4
0008044a  bne     #0x80436
0008044c  cmp     r4, #0
0008044e  bgt     #0x8042a
00080450  add.w   r1, sp, #0x186
00080454  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080458  b       #0x8042a
0008045a  ldr     r3, [r1, #-0x4]
0008045e  subs    r2, r1, #4
00080460  subs    r1, r3, #1
00080462  dmb     ish
00080466  mov     ip, r3
00080468  ldrex   r4, [r2]
0008046c  cmp     r4, r3
0008046e  beq     #0x8049c
00080470  cmp     r4, ip
00080472  mov     r3, r4
00080474  bne     #0x80460
00080476  cmp     r4, #0
00080478  bgt     #0x80412
0008047a  add     r1, sp, #0x188
0008047c  adds    r1, #1
0008047e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080482  b       #0x80412
00080484  strex   lr, r1, [r2]
00080488  cmp.w   lr, #0
0008048c  bne     #0x8043e
0008048e  dmb     ish
00080492  b       #0x80446
00080494  ldr     r0, [sp, #0x5c]
00080496  blx     #0xdd5a8 ; -> ZdlPv
0008049a  b       #0x803fe
0008049c  strex   lr, r1, [r2]
000804a0  cmp.w   lr, #0
000804a4  bne     #0x80468
000804a6  dmb     ish
000804aa  b       #0x80470
000804ac  cmp     r7, #0x26
000804ae  movs    r7, r0
000804b0  b       #0x804cc
000804b2  movs    r6, r0
000804b4  lsls    r4, r6, #9
000804b6  movs    r0, r0
000804b8  ldrsb   r0, [r3, r3]
000804ba  movs    r7, r1
000804bc  ldrsb   r0, [r5, r3]
000804be  movs    r7, r1
000804c0  ldrsb   r6, [r3, r3]
000804c2  movs    r7, r1
000804c4  ldr     r1, [sp, #0x390]
000804c6  movs    r7, r5
000804c8  ldr     r1, [sp, #0x228]
000804ca  movs    r7, r5
000804cc  ldr     r1, [sp, #0x180]
000804ce  movs    r7, r5
000804d0  ldr     r1, [sp, #0x1a0]
000804d2  movs    r7, r5
000804d4  adds    r0, #0xcc
000804d6  movs    r7, r0
000804d8  ldr     r0, [sp, #0xb0]
000804da  movs    r7, r5
000804dc  cmp     r7, #0x6a
000804de  movs    r7, r0
000804e0  cmp     r7, #0x52
000804e2  movs    r7, r0
