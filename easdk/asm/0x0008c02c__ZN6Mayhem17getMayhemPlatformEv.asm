========================================================================
ZN6Mayhem17getMayhemPlatformEv  0x0008c02c  428 bytes   Mayhem.mm
========================================================================

0008c02c  push    {r4, r5, r6, r7, lr}
0008c02e  add     r7, sp, #0xc
0008c030  push.w  {r8, sl, fp}
0008c034  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008c038  sub     sp, #0x64
0008c03a  ldr     r3, [pc, #0x168]
0008c03c  str     r0, [sp, #4]
0008c03e  add     r0, sp, #0x28
0008c040  add     r3, pc ; -> 0x000f3438  0x0
0008c042  str     r7, [sp, #0x48]
0008c044  ldr     r3, [r3]
0008c046  str.w   sp, [sp, #0x50]
0008c04a  str     r3, [sp, #0x40]
0008c04c  ldr     r3, [pc, #0x158]
0008c04e  add     r3, pc ; -> 0x000ee246  GCC_except_table15
0008c050  str     r3, [sp, #0x44]
0008c052  ldr     r3, [pc, #0x158]
0008c054  add     r3, pc ; -> 0x0008c14e  
0008c056  orr     r3, r3, #1
0008c05a  str     r3, [sp, #0x4c]
0008c05c  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008c060  movs    r0, #0x14
0008c062  mov.w   r3, #-1
0008c066  str     r3, [sp, #0x2c]
0008c068  blx     #0xdd5c0 ; -> Znwm
0008c06c  ldr     r1, [pc, #0x140]
0008c06e  movs    r3, #3
0008c070  str     r3, [sp, #0x2c]
0008c072  add     r1, pc ; -> 0x00175c78  'MayhemPlatform'
0008c074  str     r0, [sp, #8]
0008c076  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
0008c07a  ldr     r0, [sp, #8]
0008c07c  mov.w   r3, #-1
0008c080  str     r3, [sp, #0x2c]
0008c082  bl      #0x9d590 ; -> ZN4midp6System11getPropertyEPNS_6StringE
0008c086  add     r2, sp, #0x5c
0008c088  str     r2, [sp, #0x1c]
0008c08a  str     r0, [sp, #0x5c]
0008c08c  cbz     r0, #0x8c094
0008c08e  ldr     r3, [r0]
0008c090  ldr     r3, [r3, #0xc]
0008c092  blx     r3
0008c094  ldr     r3, [pc, #0x11c]
0008c096  ldr     r1, [pc, #0x120]
0008c098  add     r3, pc ; -> 0x000fdb5c  
0008c09a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008c09c  ldr     r3, [r3]
0008c09e  ldr     r1, [r1]
0008c0a0  str     r3, [sp, #0xc]
0008c0a2  ldr     r0, [sp, #0xc]
0008c0a4  movs    r3, #2
0008c0a6  str     r3, [sp, #0x2c]
0008c0a8  blx     #0xddbfc ; -> objc_msgSend
0008c0ac  ldr     r1, [pc, #0x10c]
0008c0ae  ldr     r3, [sp, #0x5c]
0008c0b0  add     r1, pc ; -> 0x000fcb50  '|\x1e\x0e'
0008c0b2  ldr     r1, [r1]
0008c0b4  cmp     r3, #0
0008c0b6  beq     #0x8c13a
0008c0b8  ldr     r2, [r3, #8]
0008c0ba  movs    r3, #2
0008c0bc  str     r3, [sp, #0x2c]
0008c0be  blx     #0xddbfc ; -> objc_msgSend
0008c0c2  ldr     r1, [pc, #0xfc]
0008c0c4  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008c0c6  ldr     r1, [r1]
0008c0c8  blx     #0xddbfc ; -> objc_msgSend
0008c0cc  ldr     r3, [pc, #0xf4]
0008c0ce  ldr     r1, [pc, #0xf8]
0008c0d0  str     r0, [sp, #0x10]
0008c0d2  add     r3, pc ; -> 0x000fcf68  
0008c0d4  add     r1, pc ; -> 0x000fcf58  
0008c0d6  ldr     r3, [r3]
0008c0d8  ldr     r1, [r1]
0008c0da  ldr     r0, [sp, #0xc]
0008c0dc  str     r3, [sp, #0x14]
0008c0de  blx     #0xddbfc ; -> objc_msgSend
0008c0e2  mov     r2, r0
0008c0e4  ldr     r1, [sp, #0x14]
0008c0e6  ldr     r0, [sp, #0x10]
0008c0e8  blx     #0xddbfc ; -> objc_msgSend
0008c0ec  mov     r1, r0
0008c0ee  movs    r3, #1
0008c0f0  ldr     r0, [sp, #4]
0008c0f2  str     r3, [sp, #0x2c]
0008c0f4  add.w   r2, sp, #0x63
0008c0f8  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0008c0fc  ldr     r3, [sp, #0x1c]
0008c0fe  ldr     r3, [r3]
0008c100  str     r3, [sp, #0x20]
0008c102  cbz     r3, #0x8c114
0008c104  ldr     r3, [r3]
0008c106  ldr     r0, [sp, #0x20]
0008c108  ldr     r2, [r3, #8]
0008c10a  mov.w   r3, #-1
0008c10e  str     r3, [sp, #0x2c]
0008c110  blx     r2
0008c112  cbnz    r0, #0x8c12e
0008c114  add     r0, sp, #0x28
0008c116  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008c11a  ldr     r0, [sp, #4]
0008c11c  sub.w   sp, r7, #0x58
0008c120  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008c124  sub.w   sp, r7, #0x18
0008c128  pop.w   {r8, sl, fp}
0008c12c  pop     {r4, r5, r6, r7, pc}
0008c12e  ldr     r2, [sp, #0x20]
0008c130  ldr     r3, [r2]
0008c132  mov     r0, r2
0008c134  ldr     r3, [r3, #4]
0008c136  blx     r3
0008c138  b       #0x8c114
0008c13a  ldr     r0, [pc, #0x90]
0008c13c  ldr.w   r1, [pc, #0x90]
0008c140  ldr     r3, [pc, #0x90]
0008c142  add     r0, pc ; -> 0x000e5960  ZZNK4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
0008c144  add     r1, pc ; -> 0x00175b58  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0008c146  add     r3, pc ; -> 0x00175bcc  'm__obj'
0008c148  movs    r2, #0xbe
0008c14a  blx     #0xdd5cc ; -> assert_rtn
0008c14e  ldr     r3, [sp, #0x2c]
0008c150  ldr     r2, [sp, #0x30]
0008c152  cmp     r3, #1
0008c154  str     r2, [sp]
0008c156  beq     #0x8c15c
0008c158  cmp     r3, #2
0008c15a  beq     #0x8c190
0008c15c  ldr     r3, [sp]
0008c15e  ldr     r2, [sp, #0x1c]
0008c160  str     r3, [sp, #0x18]
0008c162  ldr     r2, [r2]
0008c164  str     r2, [sp, #0x24]
0008c166  cbz     r2, #0x8c180
0008c168  ldr     r3, [r2]
0008c16a  ldr     r0, [sp, #0x24]
0008c16c  ldr     r2, [r3, #8]
0008c16e  movs    r3, #0
0008c170  str     r3, [sp, #0x2c]
0008c172  blx     r2
0008c174  cbz     r0, #0x8c180
0008c176  ldr     r2, [sp, #0x24]
0008c178  ldr     r3, [r2]
0008c17a  mov     r0, r2
0008c17c  ldr     r3, [r3, #4]
0008c17e  blx     r3
0008c180  ldr     r3, [sp, #0x18]
0008c182  str     r3, [sp]
0008c184  ldr     r0, [sp]
0008c186  mov.w   r3, #-1
0008c18a  str     r3, [sp, #0x2c]
0008c18c  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008c190  ldr     r0, [sp, #8]
0008c192  blx     #0xdd5a8 ; -> ZdlPv
0008c196  ldr     r0, [sp]
0008c198  mov.w   r3, #-1
0008c19c  str     r3, [sp, #0x2c]
0008c19e  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008c1a2  nop     
0008c1a4  strb    r4, [r6, #0xf]
0008c1a6  movs    r6, r0
0008c1a8  movs    r1, #0xf4
0008c1aa  movs    r6, r0
0008c1ac  lsls    r6, r6, #3
0008c1ae  movs    r0, r0
0008c1b0  ldr     r4, [sp, #8]
0008c1b2  movs    r6, r1
0008c1b4  subs    r0, r0, r3
0008c1b6  movs    r7, r0
0008c1b8  lsrs    r6, r4, #3
0008c1ba  movs    r7, r0
0008c1bc  lsrs    r4, r3, #0xa
0008c1be  movs    r7, r0
0008c1c0  lsrs    r0, r2, #6
0008c1c2  movs    r7, r0
0008c1c4  lsrs    r2, r2, #0x1a
0008c1c6  movs    r7, r0
0008c1c8  lsrs    r0, r0, #0x1a
0008c1ca  movs    r7, r0
0008c1cc  ldr     r0, [sp, #0x68]
0008c1ce  movs    r5, r0
0008c1d0  ldr     r2, [sp, #0x40]
0008c1d2  movs    r6, r1
0008c1d4  ldr     r2, [sp, #0x208]
0008c1d6  movs    r6, r1
