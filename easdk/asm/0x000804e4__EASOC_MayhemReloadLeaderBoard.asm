========================================================================
EASOC_MayhemReloadLeaderBoard  0x000804e4  1300 bytes   EASDK_Handler.mm
========================================================================

000804e4  push    {r4, r5, r6, r7, lr}
000804e6  add     r7, sp, #0xc
000804e8  push.w  {r8, sl, fp}
000804ec  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000804f0  sub     sp, #0x130
000804f2  str     r3, [sp, #0x10]
000804f4  ldr.w   r3, [pc, #0x494]
000804f8  str     r0, [sp, #0x1c]
000804fa  add     r0, sp, #0x80
000804fc  add     r3, pc ; -> 0x000f301c  0x0
000804fe  str     r2, [sp, #0x14]
00080500  ldr     r3, [r3]
00080502  str     r1, [sp, #0x18]
00080504  str     r7, [sp, #0xa0]
00080506  str.w   sp, [sp, #0xa8]
0008050a  str     r3, [sp, #0x98]
0008050c  ldr.w   r3, [pc, #0x480]
00080510  add     r3, pc ; -> 0x000ee126  GCC_except_table9
00080512  str     r3, [sp, #0x9c]
00080514  ldr.w   r3, [pc, #0x47c]
00080518  add     r3, pc ; -> 0x00080858  
0008051a  orr     r3, r3, #1
0008051e  str     r3, [sp, #0xa4]
00080520  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00080524  ldr.w   r0, [pc, #0x470]
00080528  mov.w   r1, #-1
0008052c  str     r1, [sp, #0x84]
0008052e  add     r0, pc ; -> 0x00175824  'RELOAD LEADERBOARDS: p = %d\n'
00080530  ldr     r1, [sp, #0x18]
00080532  blx     #0xddc38 ; -> printf
00080536  ldr.w   r3, [pc, #0x464]
0008053a  ldr     r2, [sp, #0x14]
0008053c  ldr     r4, [sp, #0x10]
0008053e  add     r3, pc ; -> 0x001758a0  lpage
00080540  ldr     r1, [sp, #0x1c]
00080542  str     r2, [r3]
00080544  ldr.w   r3, [pc, #0x458]
00080548  ldr.w   r0, [pc, #0x458]
0008054c  ldr.w   r2, [pc, #0x458]
00080550  add     r3, pc ; -> 0x001758a4  lpagesize
00080552  add     r0, pc ; -> 0x00379b50  statCodeBuffer
00080554  str     r4, [r3]
00080556  ldr.w   r3, [pc, #0x454]
0008055a  add     r2, pc ; -> 0x00175844  '%s'
0008055c  add     r3, pc ; -> 0x001758a8  lmax
0008055e  str     r1, [r3]
00080560  movs    r1, #0x64
00080562  ldr     r3, [sp, #0x190]
00080564  blx     #0xddcf8 ; -> snprintf
00080568  ldr     r2, [sp, #0x18]
0008056a  cmp     r2, #1
0008056c  beq.w   #0x807ac
00080570  cmp     r2, #5
00080572  beq.w   #0x80798
00080576  cmp     r2, #0
00080578  beq     #0x805d6
0008057a  ldr.w   r2, [pc, #0x434]
0008057e  add     r2, pc ; -> 0x0017586c  spotlight_Anim+0x264
00080580  add     r0, sp, #0xb4
00080582  movs    r1, #0x64
00080584  mov.w   r3, #-1
00080588  str     r3, [sp, #0x84]
0008058a  blx     #0xddcf8 ; -> snprintf
0008058e  ldr.w   r3, [pc, #0x424]
00080592  add     r3, pc ; -> 0x00379b34  m_leaderboards
00080594  ldr     r4, [r3]
00080596  ldr     r3, [r3, #4]
00080598  cmp     r4, r3
0008059a  str     r4, [sp, #0x40]
0008059c  str     r3, [sp, #0x38]
0008059e  beq     #0x805dc
000805a0  str     r4, [sp, #0x78]
000805a2  b       #0x805b0
000805a4  ldr     r3, [sp, #0x78]
000805a6  ldr     r4, [sp, #0x38]
000805a8  adds    r3, #4
000805aa  cmp     r4, r3
000805ac  str     r3, [sp, #0x78]
000805ae  beq     #0x805dc
000805b0  ldr     r1, [sp, #0x78]
000805b2  ldr     r1, [r1]
000805b4  str     r1, [sp, #0x3c]
000805b6  cmp     r1, #0
000805b8  beq     #0x805a4
000805ba  ldr     r3, [r1]
000805bc  mov     r0, r1
000805be  ldr     r2, [r3, #8]
000805c0  movs    r3, #2
000805c2  str     r3, [sp, #0x84]
000805c4  blx     r2
000805c6  cmp     r0, #0
000805c8  beq     #0x805a4
000805ca  ldr     r2, [sp, #0x3c]
000805cc  ldr     r3, [r2]
000805ce  mov     r0, r2
000805d0  ldr     r3, [r3, #4]
000805d2  blx     r3
000805d4  b       #0x805a4
000805d6  ldr     r2, [pc, #0x3e0]
000805d8  add     r2, pc ; -> 0x00175848  spotlight_Anim+0x240
000805da  b       #0x80580
000805dc  ldr.w   r3, [pc, #0x3dc]
000805e0  ldr     r1, [sp, #0x40]
000805e2  movs    r2, #0
000805e4  add     r3, pc ; -> 0x00379b34  m_leaderboards
000805e6  str     r2, [sp, #0x124]
000805e8  ldr     r2, [r3]
000805ea  str     r1, [r3, #4]
000805ec  str     r1, [sp, #0x44]
000805ee  rsb     r3, r2, r1
000805f2  asrs    r3, r3, #2
000805f4  cmp     r3, #5
000805f6  bls.w   #0x80782
000805fa  adds    r2, #0x14
000805fc  cmp     r1, r2
000805fe  str     r2, [sp, #0x4c]
00080600  beq     #0x80638
00080602  str     r2, [sp, #0x74]
00080604  b       #0x80612
00080606  ldr     r3, [sp, #0x74]
00080608  ldr     r4, [sp, #0x44]
0008060a  adds    r3, #4
0008060c  cmp     r4, r3
0008060e  str     r3, [sp, #0x74]
00080610  beq     #0x80638
00080612  ldr     r1, [sp, #0x74]
00080614  ldr     r1, [r1]
00080616  str     r1, [sp, #0x48]
00080618  cmp     r1, #0
0008061a  beq     #0x80606
0008061c  ldr     r3, [r1]
0008061e  mov     r0, r1
00080620  ldr     r2, [r3, #8]
00080622  movs    r3, #1
00080624  str     r3, [sp, #0x84]
00080626  blx     r2
00080628  cmp     r0, #0
0008062a  beq     #0x80606
0008062c  ldr     r2, [sp, #0x48]
0008062e  ldr     r3, [r2]
00080630  mov     r0, r2
00080632  ldr     r3, [r3, #4]
00080634  blx     r3
00080636  b       #0x80606
00080638  ldr     r3, [pc, #0x384]
0008063a  ldr     r1, [sp, #0x4c]
0008063c  add     r3, pc ; -> 0x00379b34  m_leaderboards
0008063e  str     r1, [r3, #4]
00080640  ldr     r2, [sp, #0x124]
00080642  str     r2, [sp, #0x54]
00080644  cbz     r2, #0x8065a
00080646  ldr     r3, [r2]
00080648  ldr     r0, [sp, #0x54]
0008064a  ldr     r2, [r3, #8]
0008064c  mov.w   r3, #-1
00080650  str     r3, [sp, #0x84]
00080652  blx     r2
00080654  cmp     r0, #0
00080656  bne.w   #0x807ce
0008065a  ldr.w   r3, [pc, #0x368]
0008065e  ldr.w   r1, [pc, #0x368]
00080662  add     r2, sp, #0x12c
00080664  add     r3, pc ; -> 0x00379b34  m_leaderboards
00080666  add     r1, pc ; -> 0x00379b50  statCodeBuffer
00080668  ldr     r3, [r3]
0008066a  add     r0, sp, #0x120
0008066c  adds    r2, #3
0008066e  str     r3, [sp, #0x58]
00080670  ldr     r3, [pc, #0x358]
00080672  add     r3, pc ; -> 0x00379b4c  m_mayhemToken
00080674  ldr     r3, [r3]
00080676  str     r3, [sp, #0x20]
00080678  movs    r3, #7
0008067a  str     r3, [sp, #0x84]
0008067c  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00080680  movs    r3, #6
00080682  add     r0, sp, #0x11c
00080684  str     r3, [sp, #0x84]
00080686  add     r1, sp, #0xb4
00080688  add.w   r2, sp, #0x12e
0008068c  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00080690  movs    r3, #5
00080692  movs    r0, #0xa0
00080694  str     r3, [sp, #0x84]
00080696  blx     #0xdd5c0 ; -> Znwm
0008069a  ldr     r1, [sp, #0x14]
0008069c  ldr     r2, [sp, #0x10]
0008069e  add     r3, sp, #0x11c
000806a0  str     r0, [sp, #0x60]
000806a2  str     r3, [sp]
000806a4  str     r1, [sp, #4]
000806a6  movs    r3, #4
000806a8  str     r2, [sp, #8]
000806aa  str     r3, [sp, #0x84]
000806ac  str     r0, [sp, #0x24]
000806ae  ldr     r1, [sp, #0x20]
000806b0  add     r2, sp, #0x120
000806b2  ldr     r3, [sp, #0x1c]
000806b4  bl      #0x9803c ; -> ZN6Mayhem21GetLeaderboardRequestC1EPNS_5TokenERKSsiS4_ii
000806b8  ldr     r4, [sp, #0x60]
000806ba  ldr     r1, [sp, #0x24]
000806bc  add     r3, sp, #0x118
000806be  str     r3, [sp, #0x5c]
000806c0  str     r4, [sp, #0x118]
000806c2  cbz     r1, #0x806d0
000806c4  ldr     r3, [r4]
000806c6  mov     r0, r4
000806c8  ldr     r2, [r3, #0xc]
000806ca  movs    r3, #5
000806cc  str     r3, [sp, #0x84]
000806ce  blx     r2
000806d0  ldr     r2, [sp, #0x118]
000806d2  str     r2, [sp, #0x70]
000806d4  cbz     r2, #0x806e2
000806d6  ldr     r3, [r2]
000806d8  ldr     r0, [sp, #0x70]
000806da  ldr     r2, [r3, #0xc]
000806dc  movs    r3, #3
000806de  str     r3, [sp, #0x84]
000806e0  blx     r2
000806e2  ldr     r3, [sp, #0x58]
000806e4  ldr     r1, [sp, #0x70]
000806e6  ldr     r4, [sp, #0x58]
000806e8  ldr     r3, [r3]
000806ea  str     r3, [sp, #0x7c]
000806ec  str     r1, [r4]
000806ee  cbz     r3, #0x80702
000806f0  ldr     r2, [sp, #0x7c]
000806f2  ldr     r0, [sp, #0x7c]
000806f4  ldr     r3, [r2]
000806f6  ldr     r2, [r3, #8]
000806f8  movs    r3, #3
000806fa  str     r3, [sp, #0x84]
000806fc  blx     r2
000806fe  cmp     r0, #0
00080700  bne     #0x807da
00080702  ldr     r1, [sp, #0x5c]
00080704  ldr     r1, [r1]
00080706  str     r1, [sp, #0x68]
00080708  cbz     r1, #0x8071c
0008070a  ldr     r2, [sp, #0x68]
0008070c  ldr     r0, [sp, #0x68]
0008070e  ldr     r3, [r2]
00080710  ldr     r2, [r3, #8]
00080712  movs    r3, #5
00080714  str     r3, [sp, #0x84]
00080716  blx     r2
00080718  cmp     r0, #0
0008071a  bne     #0x807c2
0008071c  ldr     r3, [pc, #0x2b0]
0008071e  ldr     r2, [sp, #0x11c]
00080720  add     r3, pc ; -> 0x000f3370  0x0
00080722  sub.w   r0, r2, #0xc
00080726  ldr     r3, [r3]
00080728  cmp     r0, r3
0008072a  str     r3, [sp, #0x6c]
0008072c  bne     #0x807e6
0008072e  ldr     r3, [sp, #0x120]
00080730  ldr     r1, [sp, #0x6c]
00080732  sub.w   r0, r3, #0xc
00080736  cmp     r1, r0
00080738  bne     #0x8080e
0008073a  ldr.w   r3, [pc, #0x298]
0008073e  ldr     r1, [sp, #0x18]
00080740  add     r3, pc ; -> 0x000f336c  currentLeaderboard
00080742  ldr     r2, [r3]
00080744  movs    r3, #0
00080746  cmp     r1, #5
00080748  str     r3, [r2]
0008074a  bne     #0x80756
0008074c  ldr     r3, [pc, #0x288]
0008074e  add     r3, pc ; -> 0x000f3364  collateLeaderboards
00080750  ldr     r2, [r3]
00080752  movs    r3, #1
00080754  str     r3, [r2]
00080756  ldr     r0, [pc, #0x284]
00080758  mov.w   r3, #-1
0008075c  ldr     r1, [sp, #0x1c]
0008075e  str     r3, [sp, #0x84]
00080760  add     r0, pc ; -> 0x0017e694  
00080762  ldr     r2, [sp, #0x14]
00080764  ldr     r3, [sp, #0x10]
00080766  blx     #0xdd3e0 ; -> NSLog
0008076a  add     r0, sp, #0x80
0008076c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00080770  sub.w   sp, r7, #0x58
00080774  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00080778  sub.w   sp, r7, #0x18
0008077c  pop.w   {r8, sl, fp}
00080780  pop     {r4, r5, r6, r7, pc}
00080782  ldr     r0, [pc, #0x25c]
00080784  rsb.w   r2, r3, #5
00080788  ldr     r1, [sp, #0x40]
0008078a  movs    r3, #8
0008078c  add     r0, pc ; -> 0x00379b34  m_leaderboards
0008078e  str     r3, [sp, #0x84]
00080790  add     r3, sp, #0x124
00080792  bl      #0x81e24 ; -> ZNSt6vectorIN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEESaIS4_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS4_S6_EEmRKS4_
00080796  b       #0x80640
00080798  ldr     r2, [pc, #0x248]
0008079a  mov.w   r1, #-1
0008079e  add     r0, sp, #0xb4
000807a0  str     r1, [sp, #0x84]
000807a2  add     r2, pc ; -> 0x0017585c  '&period=week:0'
000807a4  adds    r1, #0x65
000807a6  blx     #0xddcf8 ; -> snprintf
000807aa  b       #0x8058e
000807ac  ldr     r2, [pc, #0x238]
000807ae  add     r0, sp, #0xb4
000807b0  movs    r1, #0x64
000807b2  add     r2, pc ; -> 0x0017584c  '&period=week:%d'
000807b4  ldr     r3, [sp, #0x18]
000807b6  mov.w   r4, #-1
000807ba  str     r4, [sp, #0x84]
000807bc  blx     #0xddcf8 ; -> snprintf
000807c0  b       #0x8058e
000807c2  ldr     r4, [sp, #0x68]
000807c4  ldr     r3, [r4]
000807c6  mov     r0, r4
000807c8  ldr     r3, [r3, #4]
000807ca  blx     r3
000807cc  b       #0x8071c
000807ce  ldr     r4, [sp, #0x54]
000807d0  ldr     r3, [r4]
000807d2  mov     r0, r4
000807d4  ldr     r3, [r3, #4]
000807d6  blx     r3
000807d8  b       #0x8065a
000807da  ldr     r4, [sp, #0x7c]
000807dc  ldr     r3, [r4]
000807de  mov     r0, r4
000807e0  ldr     r3, [r3, #4]
000807e2  blx     r3
000807e4  b       #0x80702
000807e6  ldr     r3, [r2, #-0x4]
000807ea  subs    r1, r2, #4
000807ec  subs    r2, r3, #1
000807ee  dmb     ish
000807f2  mov     ip, r3
000807f4  ldrex   r4, [r1]
000807f8  cmp     r4, r3
000807fa  beq     #0x80848
000807fc  cmp     r4, ip
000807fe  mov     r3, r4
00080800  bne     #0x807ec
00080802  cmp     r4, #0
00080804  bgt     #0x8072e
00080806  add     r1, sp, #0x12c
00080808  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008080c  b       #0x8072e
0008080e  subs    r2, r3, #4
00080810  ldr     r3, [r3, #-0x4]
00080814  subs    r1, r3, #1
00080816  dmb     ish
0008081a  mov     ip, r3
0008081c  ldrex   r4, [r2]
00080820  cmp     r4, r3
00080822  beq     #0x80838
00080824  cmp     r4, ip
00080826  mov     r3, r4
00080828  bne     #0x80814
0008082a  cmp     r4, #0
0008082c  bgt     #0x8073a
0008082e  add     r1, sp, #0x128
00080830  adds    r1, #3
00080832  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080836  b       #0x8073a
00080838  strex   lr, r1, [r2]
0008083c  cmp.w   lr, #0
00080840  bne     #0x8081c
00080842  dmb     ish
00080846  b       #0x80824
00080848  strex   lr, r2, [r1]
0008084c  cmp.w   lr, #0
00080850  bne     #0x807f4
00080852  dmb     ish
00080856  b       #0x807fc
00080858  ldr     r3, [sp, #0x84]
0008085a  ldr.w   lr, [sp, #0x88]
0008085e  cmp     r3, #1
00080860  str.w   lr, [sp, #0xc]
00080864  beq     #0x80904
00080866  cmp     r3, #2
00080868  beq     #0x808ac
0008086a  cmp     r3, #3
0008086c  beq     #0x8094a
0008086e  cmp     r3, #4
00080870  beq     #0x808d4
00080872  cmp     r3, #5
00080874  beq     #0x808ec
00080876  cmp     r3, #6
00080878  beq     #0x80904
0008087a  ldr     r2, [sp, #0xc]
0008087c  ldr     r3, [sp, #0x124]
0008087e  str     r2, [sp, #0x28]
00080880  str     r3, [sp, #0x50]
00080882  cbz     r3, #0x8089c
00080884  ldr     r3, [r3]
00080886  ldr     r0, [sp, #0x50]
00080888  ldr     r2, [r3, #8]
0008088a  movs    r3, #0
0008088c  str     r3, [sp, #0x84]
0008088e  blx     r2
00080890  cbz     r0, #0x8089c
00080892  ldr     r4, [sp, #0x50]
00080894  ldr     r3, [r4]
00080896  mov     r0, r4
00080898  ldr     r3, [r3, #4]
0008089a  blx     r3
0008089c  ldr     r1, [sp, #0x28]
0008089e  mov.w   r3, #-1
000808a2  str     r3, [sp, #0x84]
000808a4  mov     r0, r1
000808a6  str     r1, [sp, #0xc]
000808a8  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000808ac  ldr     r2, [sp, #0xc]
000808ae  ldr     r3, [sp, #0x5c]
000808b0  str     r2, [sp, #0x2c]
000808b2  ldr     r3, [r3]
000808b4  str     r3, [sp, #0x64]
000808b6  cbz     r3, #0x808d0
000808b8  ldr     r3, [r3]
000808ba  ldr     r0, [sp, #0x64]
000808bc  ldr     r2, [r3, #8]
000808be  movs    r3, #0
000808c0  str     r3, [sp, #0x84]
000808c2  blx     r2
000808c4  cbz     r0, #0x808d0
000808c6  ldr     r4, [sp, #0x64]
000808c8  ldr     r3, [r4]
000808ca  mov     r0, r4
000808cc  ldr     r3, [r3, #4]
000808ce  blx     r3
000808d0  ldr     r1, [sp, #0x2c]
000808d2  str     r1, [sp, #0xc]
000808d4  ldr     r1, [sp, #0xc]
000808d6  ldr     r3, [pc, #0x114]
000808d8  add     r3, pc ; -> 0x000f3370  0x0
000808da  str     r1, [sp, #0x30]
000808dc  ldr     r1, [sp, #0x11c]
000808de  ldr     r3, [r3]
000808e0  sub.w   r0, r1, #0xc
000808e4  cmp     r0, r3
000808e6  bne     #0x80952
000808e8  ldr     r1, [sp, #0x30]
000808ea  str     r1, [sp, #0xc]
000808ec  ldr     r3, [pc, #0x100]
000808ee  ldr     r1, [sp, #0x120]
000808f0  ldr     r2, [sp, #0xc]
000808f2  add     r3, pc ; -> 0x000f3370  0x0
000808f4  sub.w   r0, r1, #0xc
000808f8  ldr     r3, [r3]
000808fa  str     r2, [sp, #0x34]
000808fc  cmp     r0, r3
000808fe  bne     #0x80910
00080900  ldr     r1, [sp, #0x34]
00080902  str     r1, [sp, #0xc]
00080904  ldr     r0, [sp, #0xc]
00080906  mov.w   r3, #-1
0008090a  str     r3, [sp, #0x84]
0008090c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00080910  ldr     r3, [r1, #-0x4]
00080914  subs    r2, r1, #4
00080916  subs    r1, r3, #1
00080918  dmb     ish
0008091c  mov     ip, r3
0008091e  ldrex   r4, [r2]
00080922  cmp     r4, r3
00080924  beq     #0x8093a
00080926  cmp     r4, ip
00080928  mov     r3, r4
0008092a  bne     #0x80916
0008092c  cmp     r4, #0
0008092e  bgt     #0x80900
00080930  add.w   r1, sp, #0x12a
00080934  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00080938  b       #0x80900
0008093a  strex   lr, r1, [r2]
0008093e  cmp.w   lr, #0
00080942  bne     #0x8091e
00080944  dmb     ish
00080948  b       #0x80926
0008094a  ldr     r0, [sp, #0x60]
0008094c  blx     #0xdd5a8 ; -> ZdlPv
00080950  b       #0x808d4
00080952  ldr     r3, [r1, #-0x4]
00080956  subs    r2, r1, #4
00080958  subs    r1, r3, #1
0008095a  dmb     ish
0008095e  mov     ip, r3
00080960  ldrex   r4, [r2]
00080964  cmp     r4, r3
00080966  beq     #0x8097c
00080968  cmp     r4, ip
0008096a  mov     r3, r4
0008096c  bne     #0x80958
0008096e  cmp     r4, #0
00080970  bgt     #0x808e8
00080972  add     r1, sp, #0x12c
00080974  adds    r1, #1
00080976  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0008097a  b       #0x808e8
0008097c  strex   lr, r1, [r2]
00080980  cmp.w   lr, #0
00080984  bne     #0x80960
00080986  dmb     ish
0008098a  b       #0x80968
0008098c  cmp     r3, #0x1c
0008098e  movs    r7, r0
00080990  bgt     #0x809b8
00080992  movs    r6, r0
00080994  lsls    r4, r7, #0xc
00080996  movs    r0, r0
00080998  strh    r2, [r6, r3]
0008099a  movs    r7, r1
0008099c  strh    r6, [r3, r5]
0008099e  movs    r7, r1
000809a0  strh    r0, [r2, r5]
000809a2  movs    r7, r1
000809a4  str     r5, [sp, #0x3e8]
000809a6  movs    r7, r5
000809a8  strh    r6, [r4, r3]
000809aa  movs    r7, r1
000809ac  strh    r0, [r1, r5]
000809ae  movs    r7, r1
000809b0  strh    r2, [r5, r3]
000809b2  movs    r7, r1
000809b4  str     r5, [sp, #0x278]
000809b6  movs    r7, r5
000809b8  strh    r4, [r5, r1]
000809ba  movs    r7, r1
000809bc  str     r5, [sp, #0x130]
000809be  movs    r7, r5
000809c0  str     r4, [sp, #0x3d0]
000809c2  movs    r7, r5
000809c4  str     r4, [sp, #0x330]
000809c6  movs    r7, r5
000809c8  str     r4, [sp, #0x398]
000809ca  movs    r7, r5
000809cc  str     r4, [sp, #0x358]
000809ce  movs    r7, r5
000809d0  cmp     r4, #0x4c
000809d2  movs    r7, r0
000809d4  cmp     r4, #0x28
000809d6  movs    r7, r0
000809d8  cmp     r4, #0x12
000809da  movs    r7, r0
000809dc  svc     #0x30
000809de  movs    r7, r1
000809e0  str     r3, [sp, #0x290]
000809e2  movs    r7, r5
000809e4  str     r6, [r6, r2]
000809e6  movs    r7, r1
000809e8  str     r6, [r2, r2]
000809ea  movs    r7, r1
000809ec  cmp     r2, #0x94
000809ee  movs    r7, r0
000809f0  cmp     r2, #0x7a
000809f2  movs    r7, r0
000809f4  nop     
000809f6  nop     
