========================================================================
ZN6Mayhem22getMayhemGameNameShortEv  0x0008bcd4  428 bytes   Mayhem.mm
========================================================================

0008bcd4  push    {r4, r5, r6, r7, lr}
0008bcd6  add     r7, sp, #0xc
0008bcd8  push.w  {r8, sl, fp}
0008bcdc  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008bce0  sub     sp, #0x64
0008bce2  ldr     r3, [pc, #0x168]
0008bce4  str     r0, [sp, #4]
0008bce6  add     r0, sp, #0x28
0008bce8  add     r3, pc ; -> 0x000f3438  0x0
0008bcea  str     r7, [sp, #0x48]
0008bcec  ldr     r3, [r3]
0008bcee  str.w   sp, [sp, #0x50]
0008bcf2  str     r3, [sp, #0x40]
0008bcf4  ldr     r3, [pc, #0x158]
0008bcf6  add     r3, pc ; -> 0x000ee232  GCC_except_table13
0008bcf8  str     r3, [sp, #0x44]
0008bcfa  ldr     r3, [pc, #0x158]
0008bcfc  add     r3, pc ; -> 0x0008bdf6  
0008bcfe  orr     r3, r3, #1
0008bd02  str     r3, [sp, #0x4c]
0008bd04  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008bd08  movs    r0, #0x14
0008bd0a  mov.w   r3, #-1
0008bd0e  str     r3, [sp, #0x2c]
0008bd10  blx     #0xdd5c0 ; -> Znwm
0008bd14  ldr     r1, [pc, #0x140]
0008bd16  movs    r3, #3
0008bd18  str     r3, [sp, #0x2c]
0008bd1a  add     r1, pc ; -> 0x00175c54  'MayhemGameNameShort'
0008bd1c  str     r0, [sp, #8]
0008bd1e  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0008bd22  ldr     r0, [sp, #8]
0008bd24  mov.w   r3, #-1
0008bd28  str     r3, [sp, #0x2c]
0008bd2a  bl      #0x9d590 ; -> ZN4midp6System11getPropertyEPNS_6StringE
0008bd2e  add     r2, sp, #0x5c
0008bd30  str     r2, [sp, #0x1c]
0008bd32  str     r0, [sp, #0x5c]
0008bd34  cbz     r0, #0x8bd3c
0008bd36  ldr     r3, [r0]
0008bd38  ldr     r3, [r3, #0xc]
0008bd3a  blx     r3
0008bd3c  ldr     r3, [pc, #0x11c]
0008bd3e  ldr     r1, [pc, #0x120]
0008bd40  add     r3, pc ; -> 0x000fdb5c  
0008bd42  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008bd44  ldr     r3, [r3]
0008bd46  ldr     r1, [r1]
0008bd48  str     r3, [sp, #0xc]
0008bd4a  ldr     r0, [sp, #0xc]
0008bd4c  movs    r3, #2
0008bd4e  str     r3, [sp, #0x2c]
0008bd50  blx     #0xddbfc ; -> objc_msgSend
0008bd54  ldr     r1, [pc, #0x10c]
0008bd56  ldr     r3, [sp, #0x5c]
0008bd58  add     r1, pc ; -> 0x000fcb50  '|\x1e\x0e'
0008bd5a  ldr     r1, [r1]
0008bd5c  cmp     r3, #0
0008bd5e  beq     #0x8bde2
0008bd60  ldr     r2, [r3, #8]
0008bd62  movs    r3, #2
0008bd64  str     r3, [sp, #0x2c]
0008bd66  blx     #0xddbfc ; -> objc_msgSend
0008bd6a  ldr     r1, [pc, #0xfc]
0008bd6c  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008bd6e  ldr     r1, [r1]
0008bd70  blx     #0xddbfc ; -> objc_msgSend
0008bd74  ldr     r3, [pc, #0xf4]
0008bd76  ldr     r1, [pc, #0xf8]
0008bd78  str     r0, [sp, #0x10]
0008bd7a  add     r3, pc ; -> 0x000fcf68  
0008bd7c  add     r1, pc ; -> 0x000fcf58  
0008bd7e  ldr     r3, [r3]
0008bd80  ldr     r1, [r1]
0008bd82  ldr     r0, [sp, #0xc]
0008bd84  str     r3, [sp, #0x14]
0008bd86  blx     #0xddbfc ; -> objc_msgSend
0008bd8a  mov     r2, r0
0008bd8c  ldr     r1, [sp, #0x14]
0008bd8e  ldr     r0, [sp, #0x10]
0008bd90  blx     #0xddbfc ; -> objc_msgSend
0008bd94  mov     r1, r0
0008bd96  movs    r3, #1
0008bd98  ldr     r0, [sp, #4]
0008bd9a  str     r3, [sp, #0x2c]
0008bd9c  add.w   r2, sp, #0x63
0008bda0  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008bda4  ldr     r3, [sp, #0x1c]
0008bda6  ldr     r3, [r3]
0008bda8  str     r3, [sp, #0x20]
0008bdaa  cbz     r3, #0x8bdbc
0008bdac  ldr     r3, [r3]
0008bdae  ldr     r0, [sp, #0x20]
0008bdb0  ldr     r2, [r3, #8]
0008bdb2  mov.w   r3, #-1
0008bdb6  str     r3, [sp, #0x2c]
0008bdb8  blx     r2
0008bdba  cbnz    r0, #0x8bdd6
0008bdbc  add     r0, sp, #0x28
0008bdbe  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008bdc2  ldr     r0, [sp, #4]
0008bdc4  sub.w   sp, r7, #0x58
0008bdc8  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008bdcc  sub.w   sp, r7, #0x18
0008bdd0  pop.w   {r8, sl, fp}
0008bdd4  pop     {r4, r5, r6, r7, pc}
0008bdd6  ldr     r2, [sp, #0x20]
0008bdd8  ldr     r3, [r2]
0008bdda  mov     r0, r2
0008bddc  ldr     r3, [r3, #4]
0008bdde  blx     r3
0008bde0  b       #0x8bdbc
0008bde2  ldr     r0, [pc, #0x90]
0008bde4  ldr.w   r1, [pc, #0x90]
0008bde8  ldr     r3, [pc, #0x90]
0008bdea  add     r0, pc ; -> 0x000e5960  ZZNK4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
0008bdec  add     r1, pc ; -> 0x00175b58  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0008bdee  add     r3, pc ; -> 0x00175bcc  'm__obj'
0008bdf0  movs    r2, #0xbe
0008bdf2  blx     #0xdd5cc ; -> assert_rtn
0008bdf6  ldr     r3, [sp, #0x2c]
0008bdf8  ldr     r2, [sp, #0x30]
0008bdfa  cmp     r3, #1
0008bdfc  str     r2, [sp]
0008bdfe  beq     #0x8be04
0008be00  cmp     r3, #2
0008be02  beq     #0x8be38
0008be04  ldr     r3, [sp]
0008be06  ldr     r2, [sp, #0x1c]
0008be08  str     r3, [sp, #0x18]
0008be0a  ldr     r2, [r2]
0008be0c  str     r2, [sp, #0x24]
0008be0e  cbz     r2, #0x8be28
0008be10  ldr     r3, [r2]
0008be12  ldr     r0, [sp, #0x24]
0008be14  ldr     r2, [r3, #8]
0008be16  movs    r3, #0
0008be18  str     r3, [sp, #0x2c]
0008be1a  blx     r2
0008be1c  cbz     r0, #0x8be28
0008be1e  ldr     r2, [sp, #0x24]
0008be20  ldr     r3, [r2]
0008be22  mov     r0, r2
0008be24  ldr     r3, [r3, #4]
0008be26  blx     r3
0008be28  ldr     r3, [sp, #0x18]
0008be2a  str     r3, [sp]
0008be2c  ldr     r0, [sp]
0008be2e  mov.w   r3, #-1
0008be32  str     r3, [sp, #0x2c]
0008be34  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008be38  ldr     r0, [sp, #8]
0008be3a  blx     #0xdd5a8 ; -> ZdlPv
0008be3e  ldr     r0, [sp]
0008be40  mov.w   r3, #-1
0008be44  str     r3, [sp, #0x2c]
0008be46  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008be4a  nop     
0008be4c  strb    r4, [r1, #0x1d]
0008be4e  movs    r6, r0
0008be50  movs    r5, #0x38
0008be52  movs    r6, r0
0008be54  lsls    r6, r6, #3
0008be56  movs    r0, r0
0008be58  ldr     r7, [sp, #0xd8]
0008be5a  movs    r6, r1
0008be5c  subs    r0, r3, #0
0008be5e  movs    r7, r0
0008be60  lsrs    r6, r7, #0x10
0008be62  movs    r7, r0
0008be64  lsrs    r4, r6, #0x17
0008be66  movs    r7, r0
0008be68  lsrs    r0, r5, #0x13
0008be6a  movs    r7, r0
0008be6c  asrs    r2, r5, #7
0008be6e  movs    r7, r0
0008be70  asrs    r0, r3, #7
0008be72  movs    r7, r0
0008be74  ldr     r3, [sp, #0x1c8]
0008be76  movs    r5, r0
0008be78  ldr     r5, [sp, #0x1a0]
0008be7a  movs    r6, r1
0008be7c  ldr     r5, [sp, #0x368]
0008be7e  movs    r6, r1
