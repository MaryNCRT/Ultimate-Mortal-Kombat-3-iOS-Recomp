========================================================================
ZN6Mayhem18GetUserListRequest15IndirectRequestEv  0x000940dc  720 bytes   Mayhem.mm
========================================================================

000940dc  push    {r4, r5, r6, r7, lr}
000940de  add     r7, sp, #0xc
000940e0  push.w  {r8, sl, fp}
000940e4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000940e8  sub     sp, #0x80
000940ea  ldr     r3, [pc, #0x29c]
000940ec  str     r0, [sp, #4]
000940ee  add     r0, sp, #0x40
000940f0  add     r3, pc ; -> 0x000f3438  0x0
000940f2  str     r7, [sp, #0x60]
000940f4  ldr     r3, [r3]
000940f6  str.w   sp, [sp, #0x68]
000940fa  str     r3, [sp, #0x58]
000940fc  ldr     r3, [pc, #0x28c]
000940fe  add     r3, pc ; -> 0x000ee496  GCC_except_table86
00094100  str     r3, [sp, #0x5c]
00094102  ldr     r3, [pc, #0x28c]
00094104  add     r3, pc ; -> 0x000942d0  
00094106  orr     r3, r3, #1
0009410a  str     r3, [sp, #0x64]
0009410c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00094110  ldr     r1, [sp, #4]
00094112  ldr     r2, [sp, #4]
00094114  ldr     r1, [r1, #0x64]
00094116  add.w   r0, r2, #0x6c
0009411a  str     r1, [sp, #0x3c]
0009411c  ldr     r3, [r2, #0x60]
0009411e  ldr     r1, [r2, #0x64]
00094120  subs    r1, r1, r3
00094122  mov.w   r3, #-1
00094126  asrs    r1, r1, #3
00094128  str     r3, [sp, #0x44]
0009412a  bl      #0x9c76c ; -> ZNSt6vectorISsSaISsEE7reserveEm
0009412e  ldr     r4, [sp, #4]
00094130  ldr     r1, [sp, #0x3c]
00094132  ldr     r3, [r4, #0x60]
00094134  cmp     r3, r1
00094136  str     r3, [sp, #0x78]
00094138  bne     #0x941b0
0009413a  b       #0x94262
0009413c  ldr     r1, [pc, #0x254]
0009413e  movs    r3, #4
00094140  add     r0, sp, #0x74
00094142  add     r1, pc ; -> 0x000e122c  
00094144  str     r3, [sp, #0x44]
00094146  add.w   r2, sp, #0x7f
0009414a  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009414e  ldr     r2, [sp, #4]
00094150  ldr     r1, [sp, #4]
00094152  adds    r1, #0x6c
00094154  str     r1, [sp, #0x2c]
00094156  ldr     r0, [r2, #0x70]
00094158  ldr     r3, [r2, #0x74]
0009415a  cmp     r0, r3
0009415c  beq     #0x94240
0009415e  cbz     r0, #0x9416a
00094160  movs    r3, #1
00094162  add     r1, sp, #0x74
00094164  str     r3, [sp, #0x44]
00094166  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009416a  ldr     r1, [sp, #0x2c]
0009416c  ldr     r3, [r1, #4]
0009416e  adds    r3, #4
00094170  str     r3, [r1, #4]
00094172  ldr     r3, [pc, #0x224]
00094174  ldr     r2, [sp, #0x74]
00094176  add     r3, pc ; -> 0x000f3370  0x0
00094178  sub.w   r0, r2, #0xc
0009417c  ldr     r3, [r3]
0009417e  cmp     r0, r3
00094180  bne.w   #0x94294
00094184  ldr     r2, [sp, #0x14]
00094186  cbz     r2, #0x941a4
00094188  ldr     r3, [sp, #0x20]
0009418a  adds    r3, #8
0009418c  str     r3, [sp, #0x34]
0009418e  beq     #0x941a4
00094190  ldr     r4, [sp, #0x20]
00094192  ldr     r0, [sp, #0x34]
00094194  ldr     r3, [r4, #8]
00094196  ldr     r2, [r3, #8]
00094198  mov.w   r3, #-1
0009419c  str     r3, [sp, #0x44]
0009419e  blx     r2
000941a0  cmp     r0, #0
000941a2  bne     #0x94236
000941a4  ldr     r1, [sp, #0x38]
000941a6  ldr     r2, [sp, #0x3c]
000941a8  add.w   r3, r1, #8
000941ac  cmp     r2, r3
000941ae  beq     #0x94262
000941b0  str     r3, [sp, #0x38]
000941b2  ldm     r3, {r2, r3}
000941b4  movs    r0, #0x68
000941b6  str     r2, [sp, #8]
000941b8  str     r3, [sp, #0xc]
000941ba  mov.w   r3, #-1
000941be  str     r3, [sp, #0x44]
000941c0  blx     #0xdd5c0 ; -> Znwm
000941c4  movs    r3, #6
000941c6  add     r1, sp, #8
000941c8  ldm     r1, {r1, r2}
000941ca  str     r3, [sp, #0x44]
000941cc  subs    r3, #5
000941ce  str     r0, [sp, #0x14]
000941d0  str     r0, [sp, #0x10]
000941d2  bl      #0x940d0 ; -> ZN6Mayhem25GetUserRequestNonThreadedC1Exb
000941d6  ldr     r4, [sp, #0x10]
000941d8  ldr     r1, [sp, #0x14]
000941da  str     r4, [sp, #0x20]
000941dc  cmp     r1, #0
000941de  beq     #0x9427a
000941e0  adds.w  r2, r4, #8
000941e4  str     r2, [sp, #0x24]
000941e6  beq     #0x941f6
000941e8  ldr     r3, [r4, #8]
000941ea  ldr     r0, [sp, #0x24]
000941ec  ldr     r2, [r3, #0xc]
000941ee  mov.w   r3, #-1
000941f2  str     r3, [sp, #0x44]
000941f4  blx     r2
000941f6  movs    r3, #5
000941f8  ldr     r0, [sp, #0x24]
000941fa  str     r3, [sp, #0x44]
000941fc  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
00094200  cmp     r0, #1
00094202  bne     #0x9413c
00094204  ldr     r4, [sp, #0x20]
00094206  ldr     r3, [r4]
00094208  mov     r0, r4
0009420a  ldr     r3, [r3, #8]
0009420c  blx     r3
0009420e  ldr     r3, [sp, #4]
00094210  ldr     r1, [sp, #4]
00094212  mov     r2, r0
00094214  adds    r1, #0x6c
00094216  str     r1, [sp, #0x28]
00094218  ldr     r0, [r3, #0x70]
0009421a  ldr     r3, [r3, #0x74]
0009421c  cmp     r0, r3
0009421e  beq     #0x94252
00094220  cbz     r0, #0x9422c
00094222  movs    r3, #2
00094224  mov     r1, r2
00094226  str     r3, [sp, #0x44]
00094228  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009422c  ldr     r4, [sp, #0x28]
0009422e  ldr     r3, [r4, #4]
00094230  adds    r3, #4
00094232  str     r3, [r4, #4]
00094234  b       #0x94184
00094236  ldr     r3, [r4, #8]
00094238  ldr     r0, [sp, #0x34]
0009423a  ldr     r3, [r3, #4]
0009423c  blx     r3
0009423e  b       #0x941a4
00094240  ldr     r2, [sp, #4]
00094242  movs    r3, #3
00094244  ldr     r0, [sp, #0x2c]
00094246  ldr     r1, [r2, #0x70]
00094248  str     r3, [sp, #0x44]
0009424a  add     r2, sp, #0x74
0009424c  bl      #0x9c28c ; -> ZNSt6vectorISsSaISsEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPSsS1_EERKSs
00094250  b       #0x94172
00094252  ldr     r3, [sp, #4]
00094254  movs    r4, #5
00094256  ldr     r0, [sp, #0x28]
00094258  ldr     r1, [r3, #0x70]
0009425a  str     r4, [sp, #0x44]
0009425c  bl      #0x9c28c ; -> ZNSt6vectorISsSaISsEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPSsS1_EERKSs
00094260  b       #0x94184
00094262  add     r0, sp, #0x40
00094264  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00094268  sub.w   sp, r7, #0x58
0009426c  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00094270  sub.w   sp, r7, #0x18
00094274  pop.w   {r8, sl, fp}
00094278  pop     {r4, r5, r6, r7, pc}
0009427a  ldr     r0, [pc, #0x120]
0009427c  ldr.w   r1, [pc, #0x120]
00094280  ldr     r3, [pc, #0x120]
00094282  movs    r2, #5
00094284  add     r0, pc ; -> 0x000e5908  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem11UserRequestEEptEvE8__func__
00094286  str     r2, [sp, #0x44]
00094288  add     r1, pc ; -> 0x001759e4  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0009428a  add     r3, pc ; -> 0x00175a58  'm_obj'
0009428c  add.w   r2, r2, #0x104
00094290  blx     #0xdd5cc ; -> assert_rtn
00094294  ldr     r3, [r2, #-0x4]
00094298  subs    r1, r2, #4
0009429a  subs    r2, r3, #1
0009429c  dmb     ish
000942a0  mov     ip, r3
000942a2  ldrex   r4, [r1]
000942a6  cmp     r4, r3
000942a8  beq     #0x942c0
000942aa  cmp     r4, ip
000942ac  mov     r3, r4
000942ae  bne     #0x9429a
000942b0  cmp     r4, #0
000942b2  bgt.w   #0x94184
000942b6  add.w   r1, sp, #0x7d
000942ba  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000942be  b       #0x94184
000942c0  strex   lr, r2, [r1]
000942c4  cmp.w   lr, #0
000942c8  bne     #0x942a2
000942ca  dmb     ish
000942ce  b       #0x942aa
000942d0  ldr     r3, [sp, #0x44]
000942d2  ldr     r4, [sp, #0x48]
000942d4  cmp     r3, #1
000942d6  str     r4, [sp]
000942d8  beq     #0x94302
000942da  cmp     r3, #2
000942dc  beq     #0x942ea
000942de  cmp     r3, #3
000942e0  beq     #0x94302
000942e2  cmp     r3, #4
000942e4  beq     #0x94302
000942e6  cmp     r3, #5
000942e8  beq     #0x9433a
000942ea  ldr     r3, [sp]
000942ec  ldr     r1, [sp, #0x74]
000942ee  str     r3, [sp, #0x18]
000942f0  ldr     r3, [pc, #0xb4]
000942f2  sub.w   r0, r1, #0xc
000942f6  add     r3, pc ; -> 0x000f3370  0x0
000942f8  ldr     r3, [r3]
000942fa  cmp     r0, r3
000942fc  bne     #0x9434c
000942fe  ldr     r1, [sp, #0x18]
00094300  str     r1, [sp]
00094302  ldr     r1, [sp]
00094304  ldr     r2, [sp, #0x14]
00094306  str     r1, [sp, #0x1c]
00094308  cbz     r2, #0x9432a
0009430a  ldr     r3, [sp, #0x20]
0009430c  adds    r3, #8
0009430e  str     r3, [sp, #0x30]
00094310  beq     #0x9432a
00094312  ldr     r4, [sp, #0x20]
00094314  ldr     r0, [sp, #0x30]
00094316  ldr     r3, [r4, #8]
00094318  ldr     r2, [r3, #8]
0009431a  movs    r3, #0
0009431c  str     r3, [sp, #0x44]
0009431e  blx     r2
00094320  cbz     r0, #0x9432a
00094322  ldr     r3, [r4, #8]
00094324  ldr     r0, [sp, #0x30]
00094326  ldr     r3, [r3, #4]
00094328  blx     r3
0009432a  ldr     r1, [sp, #0x1c]
0009432c  mov.w   r3, #-1
00094330  str     r3, [sp, #0x44]
00094332  mov     r0, r1
00094334  str     r1, [sp]
00094336  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009433a  ldr     r0, [sp, #0x10]
0009433c  blx     #0xdd5a8 ; -> ZdlPv
00094340  ldr     r0, [sp]
00094342  mov.w   r3, #-1
00094346  str     r3, [sp, #0x44]
00094348  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009434c  ldr     r3, [r1, #-0x4]
00094350  subs    r2, r1, #4
00094352  subs    r1, r3, #1
00094354  dmb     ish
00094358  mov     ip, r3
0009435a  ldrex   r4, [r2]
0009435e  cmp     r4, r3
00094360  beq     #0x94376
00094362  cmp     r4, ip
00094364  mov     r3, r4
00094366  bne     #0x94352
00094368  cmp     r4, #0
0009436a  bgt     #0x942fe
0009436c  add.w   r1, sp, #0x7e
00094370  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00094374  b       #0x942fe
00094376  strex   lr, r1, [r2]
0009437a  cmp.w   lr, #0
0009437e  bne     #0x9435a
00094380  dmb     ish
00094384  b       #0x94362
00094386  nop     
00094388  sbfx    r0, r4, #0, #6
0009438c  adr     r3, #0x250
0009438e  movs    r5, r0
00094390  lsls    r0, r1, #7
00094392  movs    r0, r0
00094394  beq     #0x94364
00094396  movs    r4, r0
