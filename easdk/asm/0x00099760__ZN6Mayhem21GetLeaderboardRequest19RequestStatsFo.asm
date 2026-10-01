========================================================================
ZN6Mayhem21GetLeaderboardRequest19RequestStatsForCodeEv  0x00099760  524 bytes   Mayhem.mm
========================================================================

00099760  push    {r4, r5, r6, r7, lr}
00099762  add     r7, sp, #0xc
00099764  push.w  {r8, sl, fp}
00099768  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009976c  sub     sp, #0x7c
0009976e  ldr     r3, [pc, #0x1e4]
00099770  str     r0, [sp, #0x14]
00099772  add     r0, sp, #0x40
00099774  add     r3, pc ; -> 0x000f3438  0x0
00099776  str     r7, [sp, #0x60]
00099778  ldr     r3, [r3]
0009977a  str.w   sp, [sp, #0x68]
0009977e  str     r3, [sp, #0x58]
00099780  ldr     r3, [pc, #0x1d4]
00099782  add     r3, pc ; -> 0x000ee5c2  GCC_except_table112
00099784  str     r3, [sp, #0x5c]
00099786  ldr     r3, [pc, #0x1d4]
00099788  add     r3, pc ; -> 0x00099900  
0009978a  orr     r3, r3, #1
0009978e  str     r3, [sp, #0x64]
00099790  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00099794  ldr     r0, [sp, #0x14]
00099796  mov.w   r3, #-1
0009979a  ldr     r0, [r0, #0xc]
0009979c  str     r3, [sp, #0x44]
0009979e  str     r0, [sp, #0x18]
000997a0  movs    r0, #0x80
000997a2  blx     #0xdd5c0 ; -> Znwm
000997a6  ldr     r1, [sp, #0x14]
000997a8  add.w   r2, r1, #0x50
000997ac  str     r0, [sp, #0x20]
000997ae  str     r0, [sp, #0x1c]
000997b0  ldr     r0, [sp, #0x14]
000997b2  ldr     r3, [r1, #0x54]
000997b4  adds    r1, #0x9c
000997b6  str     r1, [sp]
000997b8  ldr.w   r1, [r0, #0x94]
000997bc  str     r1, [sp, #4]
000997be  ldr.w   r1, [r0, #0x98]
000997c2  ldr     r0, [sp, #0x20]
000997c4  str     r1, [sp, #8]
000997c6  movs    r1, #3
000997c8  str     r1, [sp, #0x44]
000997ca  ldr     r1, [sp, #0x18]
000997cc  bl      #0x99738 ; -> ZN6Mayhem29GetStatListRequestNonThreadedC1EPNS_5TokenERKSsiS4_ii
000997d0  ldr     r1, [sp, #0x1c]
000997d2  ldr     r2, [sp, #0x20]
000997d4  str     r1, [sp, #0x2c]
000997d6  str     r1, [sp, #0x38]
000997d8  cmp     r2, #0
000997da  beq.w   #0x998e6
000997de  ldr     r3, [r1]
000997e0  mov     r0, r1
000997e2  ldr     r2, [r3, #0xc]
000997e4  mov.w   r3, #-1
000997e8  str     r3, [sp, #0x44]
000997ea  blx     r2
000997ec  movs    r3, #2
000997ee  ldr     r0, [sp, #0x2c]
000997f0  str     r3, [sp, #0x44]
000997f2  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
000997f6  cmp     r0, #1
000997f8  beq     #0x99836
000997fa  movs    r1, #2
000997fc  ldr     r0, [sp, #0x14]
000997fe  str     r1, [sp, #0x44]
00099800  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00099804  ldr     r0, [sp, #0x2c]
00099806  ldr     r3, [r0]
00099808  ldr     r2, [r3, #8]
0009980a  mov.w   r3, #-1
0009980e  str     r3, [sp, #0x44]
00099810  blx     r2
00099812  cbz     r0, #0x9981e
00099814  ldr     r1, [sp, #0x2c]
00099816  ldr     r3, [r1]
00099818  mov     r0, r1
0009981a  ldr     r3, [r3, #4]
0009981c  blx     r3
0009981e  add     r0, sp, #0x40
00099820  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00099824  sub.w   sp, r7, #0x58
00099828  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009982c  sub.w   sp, r7, #0x18
00099830  pop.w   {r8, sl, fp}
00099834  pop     {r4, r5, r6, r7, pc}
00099836  ldr     r3, [sp, #0x38]
00099838  add     r0, sp, #0x74
0009983a  ldr     r2, [r3, #0x6c]
0009983c  ldr     r3, [r3, #0x68]
0009983e  rsb     r3, r3, r2
00099842  asrs    r3, r3, #3
00099844  str     r3, [sp, #0xc]
00099846  bl      #0x8ad1c ; -> ZN6Mayhem4StatC1Ev
0009984a  ldr     r0, [sp, #0x14]
0009984c  ldr     r1, [sp, #0x14]
0009984e  ldr.w   r0, [r0, #0x80]
00099852  str     r0, [sp, #0x30]
00099854  ldr     r2, [r1, #0x7c]
00099856  rsb     r3, r2, r0
0009985a  ldr     r0, [sp, #0xc]
0009985c  asrs    r3, r3, #3
0009985e  cmp     r0, r3
00099860  bhs     #0x998cc
00099862  ldr     r1, [sp, #0x30]
00099864  lsls    r3, r0, #3
00099866  adds    r2, r2, r3
00099868  cmp     r1, r2
0009986a  str     r2, [sp, #0x34]
0009986c  beq     #0x9988a
0009986e  str     r2, [sp, #0x3c]
00099870  ldr     r2, [sp, #0x3c]
00099872  ldr     r0, [sp, #0x3c]
00099874  ldr     r3, [r2]
00099876  ldr     r2, [r3]
00099878  movs    r3, #1
0009987a  str     r3, [sp, #0x44]
0009987c  blx     r2
0009987e  ldr     r3, [sp, #0x3c]
00099880  ldr     r0, [sp, #0x30]
00099882  adds    r3, #8
00099884  cmp     r0, r3
00099886  str     r3, [sp, #0x3c]
00099888  bne     #0x99870
0009988a  ldr     r3, [sp, #0x34]
0009988c  ldr     r2, [sp, #0x14]
0009988e  str.w   r3, [r2, #0x80]
00099892  ldr     r1, [sp, #0x14]
00099894  ldr     r0, [r1, #0x7c]
00099896  ldr.w   r3, [r1, #0x80]
0009989a  subs    r3, r3, r0
0009989c  lsrs    r3, r3, #3
0009989e  beq     #0x99804
000998a0  movs    r1, #0
000998a2  str     r1, [sp, #0x24]
000998a4  ldr     r2, [sp, #0x38]
000998a6  lsls    r1, r1, #3
000998a8  adds    r0, r0, r1
000998aa  ldr     r3, [r2, #0x68]
000998ac  adds    r1, r1, r3
000998ae  bl      #0x8ad6c ; -> ZN6Mayhem4StataSERKS0_
000998b2  ldr     r2, [sp, #0x14]
000998b4  ldr     r3, [sp, #0x24]
000998b6  adds    r1, r3, #1
000998b8  adds    r3, #1
000998ba  str     r3, [sp, #0x24]
000998bc  ldr     r0, [r2, #0x7c]
000998be  ldr.w   r3, [r2, #0x80]
000998c2  subs    r3, r3, r0
000998c4  cmp.w   r1, r3, asr #3
000998c8  blo     #0x998a4
000998ca  b       #0x99804
000998cc  ldr     r2, [sp, #0x14]
000998ce  ldr     r1, [sp, #0xc]
000998d0  add.w   r0, r2, #0x7c
000998d4  rsb     r2, r3, r1
000998d8  movs    r3, #2
000998da  ldr     r1, [sp, #0x30]
000998dc  str     r3, [sp, #0x44]
000998de  add     r3, sp, #0x74
000998e0  bl      #0x9ac1c ; -> ZNSt6vectorIN6Mayhem4StatESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEmRKS1_
000998e4  b       #0x99892
000998e6  ldr     r0, [pc, #0x78]
000998e8  ldr     r1, [pc, #0x78]
000998ea  ldr.w   r3, [pc, #0x7c]
000998ee  movs    r2, #2
000998f0  add     r0, pc ; -> 0x000e592c  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem18GetStatListRequestEEptEvE8__func__
000998f2  str     r2, [sp, #0x44]
000998f4  add     r1, pc ; -> 0x001759e4  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000998f6  add     r3, pc ; -> 0x00175a58  'm_obj'
000998f8  movw    r2, #0x109
000998fc  blx     #0xdd5cc ; -> assert_rtn
00099900  ldr     r3, [sp, #0x44]
00099902  ldr     r1, [sp, #0x48]
00099904  cmp     r3, #1
00099906  str     r1, [sp, #0x10]
00099908  beq     #0x9990e
0009990a  cmp     r3, #2
0009990c  beq     #0x99940
0009990e  ldr     r3, [sp, #0x10]
00099910  ldr     r0, [sp, #0x20]
00099912  str     r3, [sp, #0x28]
00099914  cbz     r0, #0x99930
00099916  ldr     r1, [sp, #0x2c]
00099918  ldr     r3, [r1]
0009991a  mov     r0, r1
0009991c  ldr     r2, [r3, #8]
0009991e  movs    r3, #0
00099920  str     r3, [sp, #0x44]
00099922  blx     r2
00099924  cbz     r0, #0x99930
00099926  ldr     r2, [sp, #0x2c]
00099928  ldr     r3, [r2]
0009992a  mov     r0, r2
0009992c  ldr     r3, [r3, #4]
0009992e  blx     r3
00099930  ldr     r3, [sp, #0x28]
00099932  str     r3, [sp, #0x10]
00099934  ldr     r0, [sp, #0x10]
00099936  mov.w   r3, #-1
0009993a  str     r3, [sp, #0x44]
0009993c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00099940  ldr     r0, [sp, #0x1c]
00099942  blx     #0xdd5a8 ; -> ZdlPv
00099946  ldr     r0, [sp, #0x10]
00099948  mov.w   r3, #-1
0009994c  str     r3, [sp, #0x44]
0009994e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00099952  nop     
00099954  ldr     r4, [sp, #0x300]
00099956  movs    r5, r0
00099958  ldr     r6, [pc, #0xf0]
0009995a  movs    r5, r0
0009995c  lsls    r4, r6, #5
0009995e  movs    r0, r0
00099960  stm     r0!, {r3, r4, r5}
00099962  movs    r4, r0
00099964  stm     r0!, {r2, r3, r5, r6, r7}
00099966  movs    r5, r1
00099968  stm     r1!, {r1, r2, r3, r4, r6}
0009996a  movs    r5, r1
