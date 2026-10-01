========================================================================
ZN6Mayhem21GetLeaderboardRequest21RequestUsersFromFBIDsEv  0x00098884  480 bytes   Mayhem.mm
========================================================================

00098884  push    {r4, r5, r6, r7, lr}
00098886  add     r7, sp, #0xc
00098888  push.w  {r8, sl, fp}
0009888c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00098890  sub     sp, #0x60
00098892  ldr     r3, [pc, #0x1b8]
00098894  str     r0, [sp, #4]
00098896  add     r0, sp, #0x2c
00098898  add     r3, pc ; -> 0x000f3438  0x0
0009889a  str     r7, [sp, #0x4c]
0009889c  ldr     r3, [r3]
0009889e  str.w   sp, [sp, #0x54]
000988a2  str     r3, [sp, #0x44]
000988a4  ldr     r3, [pc, #0x1a8]
000988a6  add     r3, pc ; -> 0x000ee584  GCC_except_table105
000988a8  str     r3, [sp, #0x48]
000988aa  ldr     r3, [pc, #0x1a8]
000988ac  add     r3, pc ; -> 0x000989f0  
000988ae  orr     r3, r3, #1
000988b2  str     r3, [sp, #0x50]
000988b4  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000988b8  movs    r0, #0x78
000988ba  mov.w   r3, #-1
000988be  str     r3, [sp, #0x30]
000988c0  blx     #0xdd5c0 ; -> Znwm
000988c4  movs    r3, #3
000988c6  str     r3, [sp, #0x30]
000988c8  str     r0, [sp, #0xc]
000988ca  str     r0, [sp, #8]
000988cc  ldr     r0, [sp, #4]
000988ce  add.w   r1, r0, #0x64
000988d2  ldr     r0, [sp, #0xc]
000988d4  bl      #0x98878 ; -> ZN6Mayhem29GetUserListRequestNonThreadedC1ERKSt6vectorIxSaIxEE
000988d8  ldr     r1, [sp, #8]
000988da  ldr     r2, [sp, #0xc]
000988dc  str     r1, [sp, #0x18]
000988de  cmp     r2, #0
000988e0  beq     #0x989d8
000988e2  adds.w  r3, r1, #0x10
000988e6  str     r3, [sp, #0x1c]
000988e8  beq     #0x988f8
000988ea  ldr     r3, [r1, #0x10]
000988ec  ldr     r0, [sp, #0x1c]
000988ee  ldr     r2, [r3, #0xc]
000988f0  mov.w   r3, #-1
000988f4  str     r3, [sp, #0x30]
000988f6  blx     r2
000988f8  movs    r0, #2
000988fa  str     r0, [sp, #0x30]
000988fc  ldr     r0, [sp, #0x1c]
000988fe  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
00098902  cmp     r0, #1
00098904  beq     #0x98952
00098906  movs    r0, #2
00098908  movs    r1, #2
0009890a  str     r0, [sp, #0x30]
0009890c  ldr     r0, [sp, #4]
0009890e  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00098912  ldr     r3, [sp, #0xc]
00098914  cbz     r3, #0x9892e
00098916  ldr     r0, [sp, #0x18]
00098918  adds    r0, #0x10
0009891a  str     r0, [sp, #0x28]
0009891c  beq     #0x9892e
0009891e  ldr     r1, [sp, #0x18]
00098920  ldr     r3, [r1, #0x10]
00098922  ldr     r2, [r3, #8]
00098924  mov.w   r3, #-1
00098928  str     r3, [sp, #0x30]
0009892a  blx     r2
0009892c  cbnz    r0, #0x98946
0009892e  add     r0, sp, #0x2c
00098930  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00098934  sub.w   sp, r7, #0x58
00098938  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009893c  sub.w   sp, r7, #0x18
00098940  pop.w   {r8, sl, fp}
00098944  pop     {r4, r5, r6, r7, pc}
00098946  ldr     r2, [sp, #0x18]
00098948  ldr     r0, [sp, #0x28]
0009894a  ldr     r3, [r2, #0x10]
0009894c  ldr     r3, [r3, #4]
0009894e  blx     r3
00098950  b       #0x9892e
00098952  ldr     r2, [sp, #0x18]
00098954  ldr     r1, [sp, #4]
00098956  adds    r1, #0x58
00098958  str     r1, [sp, #0x20]
0009895a  ldr     r1, [r2, #8]
0009895c  ldr     r3, [r2, #4]
0009895e  ldr     r0, [sp, #0x20]
00098960  subs    r1, r1, r3
00098962  asrs    r1, r1, #3
00098964  bl      #0x9c76c ; -> ZNSt6vectorISsSaISsEE7reserveEm
00098968  ldr     r3, [sp, #0x18]
0009896a  ldr     r2, [r3, #4]
0009896c  ldr     r3, [r3, #8]
0009896e  subs    r3, r3, r2
00098970  lsrs    r3, r3, #3
00098972  beq     #0x98912
00098974  movs    r1, #0
00098976  str     r1, [sp, #0x10]
00098978  b       #0x989a6
0009897a  cbz     r1, #0x98988
0009897c  movs    r3, #1
0009897e  mov     r0, r1
00098980  str     r3, [sp, #0x30]
00098982  mov     r1, r2
00098984  blx     #0xdd53c ; -> ZNSsC1ERKSs
00098988  ldr     r1, [sp, #4]
0009898a  ldr     r3, [r1, #0x5c]
0009898c  adds    r3, #4
0009898e  str     r3, [r1, #0x5c]
00098990  ldr     r3, [sp, #0x18]
00098992  ldr     r0, [sp, #0x10]
00098994  adds    r1, r0, #1
00098996  adds    r0, #1
00098998  str     r0, [sp, #0x10]
0009899a  ldr     r2, [r3, #4]
0009899c  ldr     r3, [r3, #8]
0009899e  subs    r3, r3, r2
000989a0  cmp.w   r1, r3, asr #3
000989a4  bhs     #0x98912
000989a6  lsls    r3, r1, #3
000989a8  add.w   r0, r2, r3
000989ac  ldr     r3, [r2, r3]
000989ae  movs    r1, #2
000989b0  ldr     r3, [r3, #8]
000989b2  str     r1, [sp, #0x30]
000989b4  blx     r3
000989b6  ldr     r3, [r0]
000989b8  mov     r2, r0
000989ba  ldr     r3, [r3, #-0xc]
000989be  cmp     r3, #0
000989c0  beq     #0x98990
000989c2  ldr     r3, [sp, #4]
000989c4  ldr     r1, [r3, #0x5c]
000989c6  ldr     r3, [r3, #0x60]
000989c8  cmp     r1, r3
000989ca  bne     #0x9897a
000989cc  movs    r3, #2
000989ce  ldr     r0, [sp, #0x20]
000989d0  str     r3, [sp, #0x30]
000989d2  bl      #0x9c28c ; -> ZNSt6vectorISsSaISsEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPSsS1_EERKSs
000989d6  b       #0x98990
000989d8  ldr     r0, [pc, #0x7c]
000989da  ldr     r1, [pc, #0x80]
000989dc  ldr     r3, [pc, #0x80]
000989de  movs    r2, #2
000989e0  add     r0, pc ; -> 0x000e5920  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem18GetUserListRequestEEptEvE8__func__
000989e2  str     r2, [sp, #0x30]
000989e4  add     r1, pc ; -> 0x001759e4  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000989e6  add     r3, pc ; -> 0x00175a58  'm_obj'
000989e8  movw    r2, #0x109
000989ec  blx     #0xdd5cc ; -> assert_rtn
000989f0  ldr     r3, [sp, #0x30]
000989f2  ldr     r0, [sp, #0x34]
000989f4  cmp     r3, #1
000989f6  str     r0, [sp]
000989f8  beq     #0x989fe
000989fa  cmp     r3, #2
000989fc  beq     #0x98a38
000989fe  ldr     r1, [sp]
00098a00  ldr     r2, [sp, #0xc]
00098a02  str     r1, [sp, #0x14]
00098a04  cbz     r2, #0x98a28
00098a06  ldr     r3, [sp, #0x18]
00098a08  adds    r3, #0x10
00098a0a  str     r3, [sp, #0x24]
00098a0c  beq     #0x98a28
00098a0e  ldr     r0, [sp, #0x18]
00098a10  ldr     r3, [r0, #0x10]
00098a12  ldr     r0, [sp, #0x24]
00098a14  ldr     r2, [r3, #8]
00098a16  movs    r3, #0
00098a18  str     r3, [sp, #0x30]
00098a1a  blx     r2
00098a1c  cbz     r0, #0x98a28
00098a1e  ldr     r1, [sp, #0x18]
00098a20  ldr     r0, [sp, #0x24]
00098a22  ldr     r3, [r1, #0x10]
00098a24  ldr     r3, [r3, #4]
00098a26  blx     r3
00098a28  ldr     r2, [sp, #0x14]
00098a2a  mov.w   r3, #-1
00098a2e  str     r3, [sp, #0x30]
00098a30  mov     r0, r2
00098a32  str     r2, [sp]
00098a34  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00098a38  ldr     r0, [sp, #8]
00098a3a  blx     #0xdd5a8 ; -> ZdlPv
00098a3e  ldr     r0, [sp]
00098a40  mov.w   r3, #-1
00098a44  str     r3, [sp, #0x30]
00098a46  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00098a4a  nop     
00098a4c  add     r3, sp, #0x270
00098a4e  movs    r5, r0
00098a50  ldrb    r2, [r3, r3]
00098a52  movs    r5, r0
00098a54  lsls    r0, r0, #5
00098a56  movs    r0, r0
00098a58  ldm     r7!, {r2, r3, r4, r5}
00098a5a  movs    r4, r0
00098a5c  ldm     r7, {r2, r3, r4, r5, r6, r7}
00098a5e  movs    r5, r1
00098a60  beq     #0x98b40
00098a62  movs    r5, r1
