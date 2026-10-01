========================================================================
ZN6Mayhem12getMayhemURLEv  0x0008bb28  428 bytes   Mayhem.mm
========================================================================

0008bb28  push    {r4, r5, r6, r7, lr}
0008bb2a  add     r7, sp, #0xc
0008bb2c  push.w  {r8, sl, fp}
0008bb30  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008bb34  sub     sp, #0x64
0008bb36  ldr     r3, [pc, #0x168]
0008bb38  str     r0, [sp, #4]
0008bb3a  add     r0, sp, #0x28
0008bb3c  add     r3, pc ; -> 0x000f3438  0x0
0008bb3e  str     r7, [sp, #0x48]
0008bb40  ldr     r3, [r3]
0008bb42  str.w   sp, [sp, #0x50]
0008bb46  str     r3, [sp, #0x40]
0008bb48  ldr     r3, [pc, #0x158]
0008bb4a  add     r3, pc ; -> 0x000ee228  GCC_except_table12
0008bb4c  str     r3, [sp, #0x44]
0008bb4e  ldr     r3, [pc, #0x158]
0008bb50  add     r3, pc ; -> 0x0008bc4a  
0008bb52  orr     r3, r3, #1
0008bb56  str     r3, [sp, #0x4c]
0008bb58  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008bb5c  movs    r0, #0x14
0008bb5e  mov.w   r3, #-1
0008bb62  str     r3, [sp, #0x2c]
0008bb64  blx     #0xdd5c0 ; -> Znwm
0008bb68  ldr     r1, [pc, #0x140]
0008bb6a  movs    r3, #3
0008bb6c  str     r3, [sp, #0x2c]
0008bb6e  add     r1, pc ; -> 0x00175c48  'MayhemURL'
0008bb70  str     r0, [sp, #8]
0008bb72  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0008bb76  ldr     r0, [sp, #8]
0008bb78  mov.w   r3, #-1
0008bb7c  str     r3, [sp, #0x2c]
0008bb7e  bl      #0x9d590 ; -> ZN4midp6System11getPropertyEPNS_6StringE
0008bb82  add     r2, sp, #0x5c
0008bb84  str     r2, [sp, #0x1c]
0008bb86  str     r0, [sp, #0x5c]
0008bb88  cbz     r0, #0x8bb90
0008bb8a  ldr     r3, [r0]
0008bb8c  ldr     r3, [r3, #0xc]
0008bb8e  blx     r3
0008bb90  ldr     r3, [pc, #0x11c]
0008bb92  ldr     r1, [pc, #0x120]
0008bb94  add     r3, pc ; -> 0x000fdb5c  
0008bb96  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008bb98  ldr     r3, [r3]
0008bb9a  ldr     r1, [r1]
0008bb9c  str     r3, [sp, #0xc]
0008bb9e  ldr     r0, [sp, #0xc]
0008bba0  movs    r3, #2
0008bba2  str     r3, [sp, #0x2c]
0008bba4  blx     #0xddbfc ; -> objc_msgSend
0008bba8  ldr     r1, [pc, #0x10c]
0008bbaa  ldr     r3, [sp, #0x5c]
0008bbac  add     r1, pc ; -> 0x000fcb50  '|\x1e\x0e'
0008bbae  ldr     r1, [r1]
0008bbb0  cmp     r3, #0
0008bbb2  beq     #0x8bc36
0008bbb4  ldr     r2, [r3, #8]
0008bbb6  movs    r3, #2
0008bbb8  str     r3, [sp, #0x2c]
0008bbba  blx     #0xddbfc ; -> objc_msgSend
0008bbbe  ldr     r1, [pc, #0xfc]
0008bbc0  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008bbc2  ldr     r1, [r1]
0008bbc4  blx     #0xddbfc ; -> objc_msgSend
0008bbc8  ldr     r3, [pc, #0xf4]
0008bbca  ldr     r1, [pc, #0xf8]
0008bbcc  str     r0, [sp, #0x10]
0008bbce  add     r3, pc ; -> 0x000fcf68  
0008bbd0  add     r1, pc ; -> 0x000fcf58  
0008bbd2  ldr     r3, [r3]
0008bbd4  ldr     r1, [r1]
0008bbd6  ldr     r0, [sp, #0xc]
0008bbd8  str     r3, [sp, #0x14]
0008bbda  blx     #0xddbfc ; -> objc_msgSend
0008bbde  mov     r2, r0
0008bbe0  ldr     r1, [sp, #0x14]
0008bbe2  ldr     r0, [sp, #0x10]
0008bbe4  blx     #0xddbfc ; -> objc_msgSend
0008bbe8  mov     r1, r0
0008bbea  movs    r3, #1
0008bbec  ldr     r0, [sp, #4]
0008bbee  str     r3, [sp, #0x2c]
0008bbf0  add.w   r2, sp, #0x63
0008bbf4  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008bbf8  ldr     r3, [sp, #0x1c]
0008bbfa  ldr     r3, [r3]
0008bbfc  str     r3, [sp, #0x20]
0008bbfe  cbz     r3, #0x8bc10
0008bc00  ldr     r3, [r3]
0008bc02  ldr     r0, [sp, #0x20]
0008bc04  ldr     r2, [r3, #8]
0008bc06  mov.w   r3, #-1
0008bc0a  str     r3, [sp, #0x2c]
0008bc0c  blx     r2
0008bc0e  cbnz    r0, #0x8bc2a
0008bc10  add     r0, sp, #0x28
0008bc12  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008bc16  ldr     r0, [sp, #4]
0008bc18  sub.w   sp, r7, #0x58
0008bc1c  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008bc20  sub.w   sp, r7, #0x18
0008bc24  pop.w   {r8, sl, fp}
0008bc28  pop     {r4, r5, r6, r7, pc}
0008bc2a  ldr     r2, [sp, #0x20]
0008bc2c  ldr     r3, [r2]
0008bc2e  mov     r0, r2
0008bc30  ldr     r3, [r3, #4]
0008bc32  blx     r3
0008bc34  b       #0x8bc10
0008bc36  ldr     r0, [pc, #0x90]
0008bc38  ldr.w   r1, [pc, #0x90]
0008bc3c  ldr     r3, [pc, #0x90]
0008bc3e  add     r0, pc ; -> 0x000e5960  ZZNK4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
0008bc40  add     r1, pc ; -> 0x00175b58  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0008bc42  add     r3, pc ; -> 0x00175bcc  'm__obj'
0008bc44  movs    r2, #0xbe
0008bc46  blx     #0xdd5cc ; -> assert_rtn
0008bc4a  ldr     r3, [sp, #0x2c]
0008bc4c  ldr     r2, [sp, #0x30]
0008bc4e  cmp     r3, #1
0008bc50  str     r2, [sp]
0008bc52  beq     #0x8bc58
0008bc54  cmp     r3, #2
0008bc56  beq     #0x8bc8c
0008bc58  ldr     r3, [sp]
0008bc5a  ldr     r2, [sp, #0x1c]
0008bc5c  str     r3, [sp, #0x18]
0008bc5e  ldr     r2, [r2]
0008bc60  str     r2, [sp, #0x24]
0008bc62  cbz     r2, #0x8bc7c
0008bc64  ldr     r3, [r2]
0008bc66  ldr     r0, [sp, #0x24]
0008bc68  ldr     r2, [r3, #8]
0008bc6a  movs    r3, #0
0008bc6c  str     r3, [sp, #0x2c]
0008bc6e  blx     r2
0008bc70  cbz     r0, #0x8bc7c
0008bc72  ldr     r2, [sp, #0x24]
0008bc74  ldr     r3, [r2]
0008bc76  mov     r0, r2
0008bc78  ldr     r3, [r3, #4]
0008bc7a  blx     r3
0008bc7c  ldr     r3, [sp, #0x18]
0008bc7e  str     r3, [sp]
0008bc80  ldr     r0, [sp]
0008bc82  mov.w   r3, #-1
0008bc86  str     r3, [sp, #0x2c]
0008bc88  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008bc8c  ldr     r0, [sp, #8]
0008bc8e  blx     #0xdd5a8 ; -> ZdlPv
0008bc92  ldr     r0, [sp]
0008bc94  mov.w   r3, #-1
0008bc98  str     r3, [sp, #0x2c]
0008bc9a  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008bc9e  nop     
0008bca0  ldrb    r0, [r7, #3]
0008bca2  movs    r6, r0
0008bca4  movs    r6, #0xda
0008bca6  movs    r6, r0
0008bca8  lsls    r6, r6, #3
0008bcaa  movs    r0, r0
0008bcac  adr     r0, #0x358
0008bcae  movs    r6, r1
0008bcb0  subs    r4, r0, #7
0008bcb2  movs    r7, r0
0008bcb4  lsrs    r2, r5, #0x17
0008bcb6  movs    r7, r0
0008bcb8  lsrs    r0, r4, #0x1e
0008bcba  movs    r7, r0
0008bcbc  lsrs    r4, r2, #0x1a
0008bcbe  movs    r7, r0
0008bcc0  asrs    r6, r2, #0xe
0008bcc2  movs    r7, r0
0008bcc4  asrs    r4, r0, #0xe
0008bcc6  movs    r7, r0
0008bcc8  ldr     r5, [sp, #0x78]
0008bcca  movs    r5, r0
0008bccc  ldr     r7, [sp, #0x50]
0008bcce  movs    r6, r1
0008bcd0  ldr     r7, [sp, #0x218]
0008bcd2  movs    r6, r1
