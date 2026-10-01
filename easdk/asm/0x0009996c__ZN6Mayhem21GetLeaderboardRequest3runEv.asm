========================================================================
ZN6Mayhem21GetLeaderboardRequest3runEv  0x0009996c  384 bytes   Mayhem.mm
========================================================================

0009996c  push    {r4, r5, r6, r7, lr}
0009996e  add     r7, sp, #0xc
00099970  push.w  {r8, sl, fp}
00099974  sub     sp, #0x1c
00099976  ldr     r2, [r0, #0x68]
00099978  ldr     r3, [r0, #0x64]
0009997a  mov     sl, r0
0009997c  rsb     r3, r3, r2
00099980  lsrs    r3, r3, #3
00099982  bne.w   #0x99adc
00099986  mov     r0, sl
00099988  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
0009998c  cmp     r0, #2
0009998e  beq.w   #0x99ac0
00099992  ldr.w   r2, [sl, #0x5c]
00099996  ldr.w   r3, [sl, #0x58]
0009999a  rsb     r3, r3, r2
0009999e  lsrs    r3, r3, #2
000999a0  bne.w   #0x99aca
000999a4  mov     r0, sl
000999a6  bl      #0x99760 ; -> ZN6Mayhem21GetLeaderboardRequest19RequestStatsForCodeEv
000999aa  mov     r0, sl
000999ac  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
000999b0  cmp     r0, #2
000999b2  beq     #0x999ba
000999b4  mov     r0, sl
000999b6  bl      #0x98b34 ; -> ZN6Mayhem21GetLeaderboardRequest20RequestUsersForStatsEv
000999ba  mov     r0, sl
000999bc  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
000999c0  cmp     r0, #2
000999c2  beq     #0x99ac0
000999c4  ldr.w   r3, [sl, #0x80]
000999c8  ldr.w   r1, [sl, #0x7c]
000999cc  str     r3, [sp, #4]
000999ce  add.w   r3, sl, #0x70
000999d2  str     r3, [sp]
000999d4  ldr     r3, [sp, #4]
000999d6  ldr     r0, [sp]
000999d8  rsb     r1, r1, r3
000999dc  asrs    r1, r1, #3
000999de  bl      #0x9a830 ; -> ZNSt6vectorIPN6Mayhem13UserStatTupleESaIS2_EE7reserveEm
000999e2  ldr.w   r0, [sl, #0x7c]
000999e6  ldr     r3, [sp, #4]
000999e8  mov     fp, r0
000999ea  str     r0, [sp, #0x18]
000999ec  ldr.w   r0, [sl, #0x88]
000999f0  cmp     fp, r3
000999f2  str     r0, [sp, #0x14]
000999f4  beq     #0x99a7e
000999f6  mov     r8, r0
000999f8  b       #0x99a16
000999fa  cbz     r1, #0x99a02
000999fc  str     r4, [r1]
000999fe  ldr.w   r1, [sl, #0x74]
00099a02  adds    r1, #4
00099a04  str.w   r1, [sl, #0x74]
00099a08  ldr     r3, [sp, #4]
00099a0a  add.w   fp, fp, #8
00099a0e  add.w   r8, r8, #8
00099a12  cmp     r3, fp
00099a14  beq     #0x99a7e
00099a16  ldr.w   r3, [r8]
00099a1a  mov     r0, r8
00099a1c  ldr     r3, [r3, #8]
00099a1e  blx     r3
00099a20  mov     r6, r0
00099a22  mov     r0, fp
00099a24  bl      #0x8ad48 ; -> ZNK6Mayhem4Stat11GetMayhemIDEv
00099a28  ldr     r3, [r6]
00099a2a  ldr     r5, [r3, #-0xc]
00099a2e  str     r5, [sp, #0xc]
00099a30  ldr     r3, [r0]
00099a32  mov     r1, r0
00099a34  ldr     r4, [r3, #-0xc]
00099a38  cmp     r5, r4
00099a3a  ite     hi
00099a3c  addhi   r2, sp, #8
00099a3e  addls   r2, sp, #0xc
00099a40  str     r4, [sp, #8]
00099a42  ldr     r0, [r6]
00099a44  ldr     r1, [r1]
00099a46  ldr     r2, [r2]
00099a48  blx     #0xddb90 ; -> memcmp
00099a4c  cmp     r0, #0
00099a4e  bne     #0x99ad2
00099a50  cmp     r5, r4
00099a52  bhi     #0x99ad2
00099a54  blo     #0x99ad2
00099a56  movs    r0, #8
00099a58  blx     #0xdd5c0 ; -> Znwm
00099a5c  mov     r1, r8
00099a5e  mov     r2, fp
00099a60  mov     r4, r0
00099a62  bl      #0x8ad7c ; -> ZN6Mayhem13UserStatTupleC1ERKNS_4UserERKNS_4StatE
00099a66  ldr.w   r1, [sl, #0x74]
00099a6a  ldr.w   r3, [sl, #0x78]
00099a6e  str     r4, [sp, #0x10]
00099a70  cmp     r1, r3
00099a72  bne     #0x999fa
00099a74  ldr     r0, [sp]
00099a76  add     r2, sp, #0x10
00099a78  bl      #0x9a8dc ; -> ZNSt6vectorIPN6Mayhem13UserStatTupleESaIS2_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS2_S4_EERKS2_
00099a7c  b       #0x99a08
00099a7e  ldr.w   r5, [sl, #0x70]
00099a82  ldr.w   r4, [sl, #0x74]
00099a86  cmp     r5, r4
00099a88  beq     #0x99ab8
00099a8a  rsb     r3, r5, r4
00099a8e  asrs    r3, r3, #2
00099a90  cmp     r3, #1
00099a92  beq     #0x99ae2
00099a94  movs    r2, #0
00099a96  asrs    r3, r3, #1
00099a98  adds    r2, #1
00099a9a  cmp     r3, #1
00099a9c  bne     #0x99a96
00099a9e  lsls    r2, r2, #1
00099aa0  ldr     r6, [pc, #0x44]
00099aa2  mov     r0, r5
00099aa4  mov     r1, r4
00099aa6  add     r6, pc ; -> 0x0008ad89  Z17UserStatTupleCompPKN6Mayhem13UserStatTupleES2_
00099aa8  mov     r3, r6
00099aaa  bl      #0x9aa00 ; -> ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiPFbPKS3_SB_EEvT_SE_T0_T1_
00099aae  mov     r0, r5
00099ab0  mov     r1, r4
00099ab2  mov     r2, r6
00099ab4  bl      #0x9ab3c ; -> ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_
00099ab8  mov     r0, sl
00099aba  movs    r1, #1
00099abc  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00099ac0  sub.w   sp, r7, #0x18
00099ac4  pop.w   {r8, sl, fp}
00099ac8  pop     {r4, r5, r6, r7, pc}
00099aca  mov     r0, sl
00099acc  bl      #0x99470 ; -> ZN6Mayhem21GetLeaderboardRequest20RequestStatsForUsersEv
00099ad0  b       #0x999aa
00099ad2  mov     r0, sl
00099ad4  movs    r1, #2
00099ad6  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00099ada  b       #0x99ac0
00099adc  bl      #0x98884 ; -> ZN6Mayhem21GetLeaderboardRequest21RequestUsersFromFBIDsEv
00099ae0  b       #0x99986
00099ae2  movs    r2, #0
00099ae4  b       #0x99aa0
00099ae6  nop     
00099ae8  asrs    r7, r3, #0xb
