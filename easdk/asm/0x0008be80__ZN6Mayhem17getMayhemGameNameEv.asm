========================================================================
ZN6Mayhem17getMayhemGameNameEv  0x0008be80  428 bytes   Mayhem.mm
========================================================================

0008be80  push    {r4, r5, r6, r7, lr}
0008be82  add     r7, sp, #0xc
0008be84  push.w  {r8, sl, fp}
0008be88  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008be8c  sub     sp, #0x64
0008be8e  ldr     r3, [pc, #0x168]
0008be90  str     r0, [sp, #4]
0008be92  add     r0, sp, #0x28
0008be94  add     r3, pc ; -> 0x000f3438  0x0
0008be96  str     r7, [sp, #0x48]
0008be98  ldr     r3, [r3]
0008be9a  str.w   sp, [sp, #0x50]
0008be9e  str     r3, [sp, #0x40]
0008bea0  ldr     r3, [pc, #0x158]
0008bea2  add     r3, pc ; -> 0x000ee23c  GCC_except_table14
0008bea4  str     r3, [sp, #0x44]
0008bea6  ldr     r3, [pc, #0x158]
0008bea8  add     r3, pc ; -> 0x0008bfa2  
0008beaa  orr     r3, r3, #1
0008beae  str     r3, [sp, #0x4c]
0008beb0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008beb4  movs    r0, #0x14
0008beb6  mov.w   r3, #-1
0008beba  str     r3, [sp, #0x2c]
0008bebc  blx     #0xdd5c0 ; -> Znwm
0008bec0  ldr     r1, [pc, #0x140]
0008bec2  movs    r3, #3
0008bec4  str     r3, [sp, #0x2c]
0008bec6  add     r1, pc ; -> 0x00175c68  'MayhemGameName'
0008bec8  str     r0, [sp, #8]
0008beca  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0008bece  ldr     r0, [sp, #8]
0008bed0  mov.w   r3, #-1
0008bed4  str     r3, [sp, #0x2c]
0008bed6  bl      #0x9d590 ; -> ZN4midp6System11getPropertyEPNS_6StringE
0008beda  add     r2, sp, #0x5c
0008bedc  str     r2, [sp, #0x1c]
0008bede  str     r0, [sp, #0x5c]
0008bee0  cbz     r0, #0x8bee8
0008bee2  ldr     r3, [r0]
0008bee4  ldr     r3, [r3, #0xc]
0008bee6  blx     r3
0008bee8  ldr     r3, [pc, #0x11c]
0008beea  ldr     r1, [pc, #0x120]
0008beec  add     r3, pc ; -> 0x000fdb5c  
0008beee  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008bef0  ldr     r3, [r3]
0008bef2  ldr     r1, [r1]
0008bef4  str     r3, [sp, #0xc]
0008bef6  ldr     r0, [sp, #0xc]
0008bef8  movs    r3, #2
0008befa  str     r3, [sp, #0x2c]
0008befc  blx     #0xddbfc ; -> objc_msgSend
0008bf00  ldr     r1, [pc, #0x10c]
0008bf02  ldr     r3, [sp, #0x5c]
0008bf04  add     r1, pc ; -> 0x000fcb50  '|\x1e\x0e'
0008bf06  ldr     r1, [r1]
0008bf08  cmp     r3, #0
0008bf0a  beq     #0x8bf8e
0008bf0c  ldr     r2, [r3, #8]
0008bf0e  movs    r3, #2
0008bf10  str     r3, [sp, #0x2c]
0008bf12  blx     #0xddbfc ; -> objc_msgSend
0008bf16  ldr     r1, [pc, #0xfc]
0008bf18  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008bf1a  ldr     r1, [r1]
0008bf1c  blx     #0xddbfc ; -> objc_msgSend
0008bf20  ldr     r3, [pc, #0xf4]
0008bf22  ldr     r1, [pc, #0xf8]
0008bf24  str     r0, [sp, #0x10]
0008bf26  add     r3, pc ; -> 0x000fcf68  
0008bf28  add     r1, pc ; -> 0x000fcf58  
0008bf2a  ldr     r3, [r3]
0008bf2c  ldr     r1, [r1]
0008bf2e  ldr     r0, [sp, #0xc]
0008bf30  str     r3, [sp, #0x14]
0008bf32  blx     #0xddbfc ; -> objc_msgSend
0008bf36  mov     r2, r0
0008bf38  ldr     r1, [sp, #0x14]
0008bf3a  ldr     r0, [sp, #0x10]
0008bf3c  blx     #0xddbfc ; -> objc_msgSend
0008bf40  mov     r1, r0
0008bf42  movs    r3, #1
0008bf44  ldr     r0, [sp, #4]
0008bf46  str     r3, [sp, #0x2c]
0008bf48  add.w   r2, sp, #0x63
0008bf4c  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008bf50  ldr     r3, [sp, #0x1c]
0008bf52  ldr     r3, [r3]
0008bf54  str     r3, [sp, #0x20]
0008bf56  cbz     r3, #0x8bf68
0008bf58  ldr     r3, [r3]
0008bf5a  ldr     r0, [sp, #0x20]
0008bf5c  ldr     r2, [r3, #8]
0008bf5e  mov.w   r3, #-1
0008bf62  str     r3, [sp, #0x2c]
0008bf64  blx     r2
0008bf66  cbnz    r0, #0x8bf82
0008bf68  add     r0, sp, #0x28
0008bf6a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008bf6e  ldr     r0, [sp, #4]
0008bf70  sub.w   sp, r7, #0x58
0008bf74  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008bf78  sub.w   sp, r7, #0x18
0008bf7c  pop.w   {r8, sl, fp}
0008bf80  pop     {r4, r5, r6, r7, pc}
0008bf82  ldr     r2, [sp, #0x20]
0008bf84  ldr     r3, [r2]
0008bf86  mov     r0, r2
0008bf88  ldr     r3, [r3, #4]
0008bf8a  blx     r3
0008bf8c  b       #0x8bf68
0008bf8e  ldr     r0, [pc, #0x90]
0008bf90  ldr.w   r1, [pc, #0x90]
0008bf94  ldr     r3, [pc, #0x90]
0008bf96  add     r0, pc ; -> 0x000e5960  ZZNK4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
0008bf98  add     r1, pc ; -> 0x00175b58  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0008bf9a  add     r3, pc ; -> 0x00175bcc  'm__obj'
0008bf9c  movs    r2, #0xbe
0008bf9e  blx     #0xdd5cc ; -> assert_rtn
0008bfa2  ldr     r3, [sp, #0x2c]
0008bfa4  ldr     r2, [sp, #0x30]
0008bfa6  cmp     r3, #1
0008bfa8  str     r2, [sp]
0008bfaa  beq     #0x8bfb0
0008bfac  cmp     r3, #2
0008bfae  beq     #0x8bfe4
0008bfb0  ldr     r3, [sp]
0008bfb2  ldr     r2, [sp, #0x1c]
0008bfb4  str     r3, [sp, #0x18]
0008bfb6  ldr     r2, [r2]
0008bfb8  str     r2, [sp, #0x24]
0008bfba  cbz     r2, #0x8bfd4
0008bfbc  ldr     r3, [r2]
0008bfbe  ldr     r0, [sp, #0x24]
0008bfc0  ldr     r2, [r3, #8]
0008bfc2  movs    r3, #0
0008bfc4  str     r3, [sp, #0x2c]
0008bfc6  blx     r2
0008bfc8  cbz     r0, #0x8bfd4
0008bfca  ldr     r2, [sp, #0x24]
0008bfcc  ldr     r3, [r2]
0008bfce  mov     r0, r2
0008bfd0  ldr     r3, [r3, #4]
0008bfd2  blx     r3
0008bfd4  ldr     r3, [sp, #0x18]
0008bfd6  str     r3, [sp]
0008bfd8  ldr     r0, [sp]
0008bfda  mov.w   r3, #-1
0008bfde  str     r3, [sp, #0x2c]
0008bfe0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008bfe4  ldr     r0, [sp, #8]
0008bfe6  blx     #0xdd5a8 ; -> ZdlPv
0008bfea  ldr     r0, [sp]
0008bfec  mov.w   r3, #-1
0008bff0  str     r3, [sp, #0x2c]
0008bff2  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008bff6  nop     
0008bff8  strb    r0, [r4, #0x16]
0008bffa  movs    r6, r0
0008bffc  movs    r3, #0x96
0008bffe  movs    r6, r0
0008c000  lsls    r6, r6, #3
0008c002  movs    r0, r0
0008c004  ldr     r5, [sp, #0x278]
0008c006  movs    r6, r1
0008c008  adds    r4, r5, #1
0008c00a  movs    r7, r0
0008c00c  lsrs    r2, r2, #0xa
0008c00e  movs    r7, r0
0008c010  lsrs    r0, r1, #0x11
0008c012  movs    r7, r0
0008c014  lsrs    r4, r7, #0xc
0008c016  movs    r7, r0
0008c018  asrs    r6, r7, #0x20
0008c01a  movs    r7, r0
0008c01c  asrs    r4, r5, #0x20
0008c01e  movs    r7, r0
0008c020  ldr     r1, [sp, #0x318]
0008c022  movs    r5, r0
0008c024  ldr     r3, [sp, #0x2f0]
0008c026  movs    r6, r1
0008c028  ldr     r4, [sp, #0xb8]
0008c02a  movs    r6, r1
