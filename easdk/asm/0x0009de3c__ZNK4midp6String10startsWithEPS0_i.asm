========================================================================
ZNK4midp6String10startsWithEPS0_i  0x0009de3c  408 bytes   JString.cpp
========================================================================

0009de3c  push    {r4, r5, r6, r7, lr}
0009de3e  add     r7, sp, #0xc
0009de40  push.w  {r8, sl, fp}
0009de44  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009de48  sub     sp, #0x64
0009de4a  ldr     r3, [pc, #0x158]
0009de4c  str     r0, [sp, #0xc]
0009de4e  add     r0, sp, #0x30
0009de50  add     r3, pc ; -> 0x000f301c  0x0
0009de52  str     r1, [sp, #8]
0009de54  ldr     r3, [r3]
0009de56  str     r2, [sp, #4]
0009de58  str     r7, [sp, #0x50]
0009de5a  str.w   sp, [sp, #0x58]
0009de5e  str     r3, [sp, #0x48]
0009de60  ldr     r3, [pc, #0x144]
0009de62  add     r3, pc ; -> 0x000ee630  GCC_except_table14
0009de64  str     r3, [sp, #0x4c]
0009de66  ldr     r3, [pc, #0x144]
0009de68  add     r3, pc ; -> 0x0009df7a  
0009de6a  orr     r3, r3, #1
0009de6e  str     r3, [sp, #0x54]
0009de70  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009de74  ldr     r1, [sp, #4]
0009de76  cmp     r1, #0
0009de78  blt     #0x9df2c
0009de7a  ldr     r2, [sp, #8]
0009de7c  cmp     r2, #0
0009de7e  beq     #0x9df60
0009de80  ldr     r3, [r2, #8]
0009de82  cmp     r3, #0
0009de84  beq     #0x9df60
0009de86  ldr     r1, [sp, #0xc]
0009de88  ldr     r3, [r1, #8]
0009de8a  cmp     r3, #0
0009de8c  beq     #0x9df46
0009de8e  ldr     r3, [sp, #8]
0009de90  ldr     r0, [sp, #8]
0009de92  str     r3, [sp, #0x2c]
0009de94  ldr     r3, [r3]
0009de96  ldr     r2, [r3, #0xc]
0009de98  mov.w   r3, #-1
0009de9c  str     r3, [sp, #0x34]
0009de9e  blx     r2
0009dea0  ldr     r1, [sp, #0xc]
0009dea2  movs    r3, #1
0009dea4  ldr     r0, [sp, #0xc]
0009dea6  ldr     r1, [r1, #8]
0009dea8  str     r3, [sp, #0x34]
0009deaa  str     r1, [sp, #0x1c]
0009deac  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
0009deb0  ldr     r2, [sp, #8]
0009deb2  str     r0, [sp, #0x20]
0009deb4  ldr     r0, [sp, #8]
0009deb6  ldr     r2, [r2, #8]
0009deb8  str     r2, [sp, #0x24]
0009deba  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
0009debe  ldr     r2, [sp, #0x20]
0009dec0  ldr     r1, [sp, #4]
0009dec2  cmp     r1, r2
0009dec4  ite     lt
0009dec6  movlt   r3, #0
0009dec8  movge   r3, #1
0009deca  cmp     r2, r0
0009decc  it      lt
0009dece  orrlt   r3, r3, #1
0009ded2  cbz     r3, #0x9df0e
0009ded4  movs    r3, #0
0009ded6  str     r3, [sp, #0x18]
0009ded8  ldr     r1, [sp, #0x2c]
0009deda  ldr     r3, [r1]
0009dedc  mov     r0, r1
0009dede  ldr     r2, [r3, #8]
0009dee0  mov.w   r3, #-1
0009dee4  str     r3, [sp, #0x34]
0009dee6  blx     r2
0009dee8  cbz     r0, #0x9def4
0009deea  ldr     r2, [sp, #0x2c]
0009deec  ldr     r3, [r2]
0009deee  mov     r0, r2
0009def0  ldr     r3, [r3, #4]
0009def2  blx     r3
0009def4  add     r0, sp, #0x30
0009def6  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009defa  ldr     r0, [sp, #0x18]
0009defc  sub.w   sp, r7, #0x58
0009df00  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009df04  sub.w   sp, r7, #0x18
0009df08  pop.w   {r8, sl, fp}
0009df0c  pop     {r4, r5, r6, r7, pc}
0009df0e  str     r1, [sp, #0x10]
0009df10  str     r0, [sp, #0x14]
0009df12  str     r3, [sp]
0009df14  ldr     r0, [sp, #0x1c]
0009df16  ldr     r1, [sp, #0x24]
0009df18  add     r2, sp, #0x10
0009df1a  ldm     r2, {r2, r3}
0009df1c  blx     #0xdd1a0 ; -> CFStringCompareWithOptions
0009df20  rsbs.w  r0, r0, #1
0009df24  it      lo
0009df26  movlo   r0, #0
0009df28  str     r0, [sp, #0x18]
0009df2a  b       #0x9ded8
0009df2c  ldr     r0, [pc, #0x80]
0009df2e  ldr     r1, [pc, #0x84]
0009df30  ldr     r3, [pc, #0x84]
0009df32  mov.w   r2, #-1
0009df36  add     r0, pc ; -> 0x000e5a9c  ZZNK4midp6String10startsWithEPS0_iE8__func__
0009df38  str     r2, [sp, #0x34]
0009df3a  add     r1, pc ; -> 0x001761f0  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/JString.cpp'
0009df3c  add     r3, pc ; -> 0x0017625c  'toffset >= 0'
0009df3e  mov.w   r2, #0x122
0009df42  blx     #0xdd5cc ; -> assert_rtn
0009df46  ldr     r0, [pc, #0x74]
0009df48  ldr     r1, [pc, #0x74]
0009df4a  ldr     r3, [pc, #0x78]
0009df4c  mov.w   r2, #-1
0009df50  add     r0, pc ; -> 0x000e5a9c  ZZNK4midp6String10startsWithEPS0_iE8__func__
0009df52  str     r2, [sp, #0x34]
0009df54  add     r1, pc ; -> 0x00176308  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/JString.cpp'
0009df56  add     r3, pc ; -> 0x00176374  'getCFString() != null'
0009df58  mov.w   r2, #0x124
0009df5c  blx     #0xdd5cc ; -> assert_rtn
0009df60  ldr     r0, [pc, #0x64]
0009df62  ldr     r1, [pc, #0x68]
0009df64  ldr     r3, [pc, #0x68]
0009df66  mov.w   r2, #-1
0009df6a  add     r0, pc ; -> 0x000e5a9c  ZZNK4midp6String10startsWithEPS0_iE8__func__
0009df6c  str     r2, [sp, #0x34]
0009df6e  add     r1, pc ; -> 0x0017626c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/JString.cpp'
0009df70  add     r3, pc ; -> 0x001762d8  'prefix != null && prefix->getCFString() != null'
0009df72  add.w   r2, r2, #0x124
0009df76  blx     #0xdd5cc ; -> assert_rtn
0009df7a  ldr     r2, [sp, #0x38]
0009df7c  ldr     r1, [sp, #0x2c]
0009df7e  str     r2, [sp, #0x28]
0009df80  ldr     r3, [r1]
0009df82  mov     r0, r1
0009df84  ldr     r2, [r3, #8]
0009df86  movs    r3, #0
0009df88  str     r3, [sp, #0x34]
0009df8a  blx     r2
0009df8c  cbz     r0, #0x9df98
0009df8e  ldr     r2, [sp, #0x2c]
0009df90  ldr     r3, [r2]
0009df92  mov     r0, r2
0009df94  ldr     r3, [r3, #4]
0009df96  blx     r3
0009df98  ldr     r0, [sp, #0x28]
0009df9a  mov.w   r3, #-1
0009df9e  str     r3, [sp, #0x34]
0009dfa0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009dfa4  str     r0, [r1, r7]
0009dfa6  movs    r5, r0
0009dfa8  lsls    r2, r1, #0x1f
0009dfaa  movs    r5, r0
0009dfac  lsls    r6, r1, #4
0009dfae  movs    r0, r0
0009dfb0  ldrb    r2, [r4, #0xd]
0009dfb2  movs    r4, r0
0009dfb4  strh    r2, [r6, #0x14]
0009dfb6  movs    r5, r1
0009dfb8  strh    r4, [r3, #0x18]
0009dfba  movs    r5, r1
0009dfbc  ldrb    r0, [r1, #0xd]
0009dfbe  movs    r4, r0
0009dfc0  strh    r0, [r6, #0x1c]
0009dfc2  movs    r5, r1
0009dfc4  strh    r2, [r3, #0x20]
0009dfc6  movs    r5, r1
0009dfc8  ldrb    r6, [r5, #0xc]
0009dfca  movs    r4, r0
0009dfcc  strh    r2, [r7, #0x16]
0009dfce  movs    r5, r1
0009dfd0  strh    r4, [r4, #0x1a]
0009dfd2  movs    r5, r1
