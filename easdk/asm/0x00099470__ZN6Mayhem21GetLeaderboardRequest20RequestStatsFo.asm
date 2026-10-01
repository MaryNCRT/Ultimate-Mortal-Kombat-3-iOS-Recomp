========================================================================
ZN6Mayhem21GetLeaderboardRequest20RequestStatsForUsersEv  0x00099470  504 bytes   Mayhem.mm
========================================================================

00099470  push    {r4, r5, r6, r7, lr}
00099472  add     r7, sp, #0xc
00099474  push.w  {r8, sl, fp}
00099478  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009947c  sub     sp, #0x70
0009947e  ldr     r3, [pc, #0x1d0]
00099480  str     r0, [sp, #8]
00099482  add     r0, sp, #0x34
00099484  add     r3, pc ; -> 0x000f3438  0x0
00099486  str     r7, [sp, #0x54]
00099488  ldr     r3, [r3]
0009948a  str.w   sp, [sp, #0x5c]
0009948e  str     r3, [sp, #0x4c]
00099490  ldr     r3, [pc, #0x1c0]
00099492  add     r3, pc ; -> 0x000ee5b2  GCC_except_table110
00099494  str     r3, [sp, #0x50]
00099496  ldr     r3, [pc, #0x1c0]
00099498  add     r3, pc ; -> 0x000995fc  
0009949a  orr     r3, r3, #1
0009949e  str     r3, [sp, #0x58]
000994a0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000994a4  ldr     r1, [sp, #8]
000994a6  movs    r0, #0x80
000994a8  mov.w   r3, #-1
000994ac  ldr     r1, [r1, #0xc]
000994ae  str     r3, [sp, #0x38]
000994b0  str     r1, [sp, #0xc]
000994b2  blx     #0xdd5c0 ; -> Znwm
000994b6  ldr     r3, [sp, #8]
000994b8  movs    r1, #3
000994ba  str     r1, [sp, #0x38]
000994bc  add.w   r2, r3, #0x50
000994c0  ldr     r1, [sp, #0xc]
000994c2  adds    r3, #0x58
000994c4  str     r0, [sp, #0x14]
000994c6  str     r0, [sp, #0x10]
000994c8  bl      #0x99464 ; -> ZN6Mayhem29GetStatListRequestNonThreadedC1EPNS_5TokenERKSsRKSt6vectorISsSaISsEE
000994cc  ldr     r1, [sp, #0x10]
000994ce  ldr     r2, [sp, #0x14]
000994d0  str     r1, [sp, #0x20]
000994d2  str     r1, [sp, #0x2c]
000994d4  cmp     r2, #0
000994d6  beq.w   #0x995e4
000994da  ldr     r3, [r1]
000994dc  mov     r0, r1
000994de  ldr     r2, [r3, #0xc]
000994e0  mov.w   r3, #-1
000994e4  str     r3, [sp, #0x38]
000994e6  blx     r2
000994e8  movs    r3, #2
000994ea  ldr     r0, [sp, #0x20]
000994ec  str     r3, [sp, #0x38]
000994ee  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
000994f2  cmp     r0, #1
000994f4  beq     #0x99534
000994f6  movs    r1, #2
000994f8  ldr     r0, [sp, #8]
000994fa  str     r1, [sp, #0x38]
000994fc  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00099500  ldr     r1, [sp, #0x20]
00099502  ldr     r3, [r1]
00099504  mov     r0, r1
00099506  ldr     r2, [r3, #8]
00099508  mov.w   r3, #-1
0009950c  str     r3, [sp, #0x38]
0009950e  blx     r2
00099510  cbz     r0, #0x9951c
00099512  ldr     r2, [sp, #0x20]
00099514  ldr     r3, [r2]
00099516  mov     r0, r2
00099518  ldr     r3, [r3, #4]
0009951a  blx     r3
0009951c  add     r0, sp, #0x34
0009951e  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00099522  sub.w   sp, r7, #0x58
00099526  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009952a  sub.w   sp, r7, #0x18
0009952e  pop.w   {r8, sl, fp}
00099532  pop     {r4, r5, r6, r7, pc}
00099534  ldr     r3, [sp, #0x2c]
00099536  add     r0, sp, #0x68
00099538  ldr     r2, [r3, #0x6c]
0009953a  ldr     r3, [r3, #0x68]
0009953c  rsb     r3, r3, r2
00099540  asrs    r3, r3, #3
00099542  str     r3, [sp]
00099544  bl      #0x8ad1c ; -> ZN6Mayhem4StatC1Ev
00099548  ldr     r1, [sp, #8]
0009954a  ldr     r3, [sp, #8]
0009954c  ldr.w   r1, [r1, #0x80]
00099550  str     r1, [sp, #0x24]
00099552  ldr     r2, [r3, #0x7c]
00099554  rsb     r3, r2, r1
00099558  ldr     r1, [sp]
0009955a  asrs    r3, r3, #3
0009955c  cmp     r1, r3
0009955e  bhs     #0x995ca
00099560  lsls    r3, r1, #3
00099562  adds    r2, r2, r3
00099564  ldr     r3, [sp, #0x24]
00099566  str     r2, [sp, #0x28]
00099568  cmp     r3, r2
0009956a  beq     #0x99588
0009956c  str     r2, [sp, #0x30]
0009956e  ldr     r1, [sp, #0x30]
00099570  ldr     r3, [r1]
00099572  mov     r0, r1
00099574  ldr     r2, [r3]
00099576  movs    r3, #1
00099578  str     r3, [sp, #0x38]
0009957a  blx     r2
0009957c  ldr     r2, [sp, #0x30]
0009957e  ldr     r3, [sp, #0x24]
00099580  adds    r2, #8
00099582  cmp     r3, r2
00099584  str     r2, [sp, #0x30]
00099586  bne     #0x9956e
00099588  ldr     r3, [sp, #0x28]
0009958a  ldr     r2, [sp, #8]
0009958c  str.w   r3, [r2, #0x80]
00099590  ldr     r1, [sp, #8]
00099592  ldr     r0, [r1, #0x7c]
00099594  ldr.w   r3, [r1, #0x80]
00099598  subs    r3, r3, r0
0009959a  lsrs    r3, r3, #3
0009959c  beq     #0x99500
0009959e  movs    r1, #0
000995a0  str     r1, [sp, #0x18]
000995a2  ldr     r2, [sp, #0x2c]
000995a4  lsls    r1, r1, #3
000995a6  adds    r0, r0, r1
000995a8  ldr     r3, [r2, #0x68]
000995aa  adds    r1, r1, r3
000995ac  bl      #0x8ad6c ; -> ZN6Mayhem4StataSERKS0_
000995b0  ldr     r2, [sp, #8]
000995b2  ldr     r3, [sp, #0x18]
000995b4  adds    r1, r3, #1
000995b6  adds    r3, #1
000995b8  str     r3, [sp, #0x18]
000995ba  ldr     r0, [r2, #0x7c]
000995bc  ldr.w   r3, [r2, #0x80]
000995c0  subs    r3, r3, r0
000995c2  cmp.w   r1, r3, asr #3
000995c6  blo     #0x995a2
000995c8  b       #0x99500
000995ca  ldr     r2, [sp, #8]
000995cc  ldr     r1, [sp]
000995ce  add.w   r0, r2, #0x7c
000995d2  rsb     r2, r3, r1
000995d6  movs    r3, #2
000995d8  ldr     r1, [sp, #0x24]
000995da  str     r3, [sp, #0x38]
000995dc  add     r3, sp, #0x68
000995de  bl      #0x9ac1c ; -> ZNSt6vectorIN6Mayhem4StatESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
000995e2  b       #0x99590
000995e4  ldr     r0, [pc, #0x74]
000995e6  ldr     r1, [pc, #0x78]
000995e8  ldr     r3, [pc, #0x78]
000995ea  movs    r2, #2
000995ec  add     r0, pc ; -> 0x000e592c  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem18GetStatListRequestEEptEvE8__func__
000995ee  str     r2, [sp, #0x38]
000995f0  add     r1, pc ; -> 0x001759e4  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000995f2  add     r3, pc ; -> 0x00175a58  'm_obj'
000995f4  movw    r2, #0x109
000995f8  blx     #0xdd5cc ; -> assert_rtn
000995fc  ldr     r3, [sp, #0x38]
000995fe  ldr     r1, [sp, #0x3c]
00099600  cmp     r3, #1
00099602  str     r1, [sp, #4]
00099604  beq     #0x9960a
00099606  cmp     r3, #2
00099608  beq     #0x9963c
0009960a  ldr     r3, [sp, #4]
0009960c  ldr     r1, [sp, #0x14]
0009960e  str     r3, [sp, #0x1c]
00099610  cbz     r1, #0x9962c
00099612  ldr     r2, [sp, #0x20]
00099614  ldr     r0, [sp, #0x20]
00099616  ldr     r3, [r2]
00099618  ldr     r2, [r3, #8]
0009961a  movs    r3, #0
0009961c  str     r3, [sp, #0x38]
0009961e  blx     r2
00099620  cbz     r0, #0x9962c
00099622  ldr     r1, [sp, #0x20]
00099624  ldr     r3, [r1]
00099626  mov     r0, r1
00099628  ldr     r3, [r3, #4]
0009962a  blx     r3
0009962c  ldr     r2, [sp, #0x1c]
0009962e  mov.w   r3, #-1
00099632  str     r3, [sp, #0x38]
00099634  mov     r0, r2
00099636  str     r2, [sp, #4]
00099638  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009963c  ldr     r0, [sp, #0x10]
0009963e  blx     #0xdd5a8 ; -> ZdlPv
00099642  ldr     r0, [sp, #4]
00099644  mov.w   r3, #-1
00099648  str     r3, [sp, #0x38]
0009964a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009964e  nop     
00099650  ldr     r7, [sp, #0x2c0]
00099652  movs    r5, r0
00099654  str     r4, [r3, r4]
00099656  movs    r5, r0
00099658  lsls    r0, r4, #5
0009965a  movs    r0, r0
0009965c  stm     r3!, {r2, r3, r4, r5}
0009965e  movs    r4, r0
00099660  stm     r3!, {r4, r5, r6, r7}
00099662  movs    r5, r1
00099664  stm     r4!, {r1, r5, r6}
00099666  movs    r5, r1
