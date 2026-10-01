========================================================================
-[Facebook logout  0x000db0ec  456 bytes   Facebook.m
========================================================================

000db0ec  push    {r4, r5, r6, r7, lr}
000db0ee  add     r7, sp, #0xc
000db0f0  push.w  {r8, sl, fp}
000db0f4  sub     sp, #0x70
000db0f6  ldr     r3, [pc, #0x164]
000db0f8  str     r0, [sp, #8]
000db0fa  ldr     r1, [pc, #0x164]
000db0fc  add     r3, pc ; -> 0x000fc50c  OBJC_IVAR_$_Facebook._sessionDelegate
000db0fe  movs    r6, #0
000db100  ldr     r3, [r3]
000db102  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000db104  ldr     r1, [r1]
000db106  str     r2, [r0, r3]
000db108  ldr     r0, [pc, #0x158]
000db10a  add     r0, pc ; -> 0x000fdbf4  
000db10c  ldr     r0, [r0]
000db10e  blx     #0xddbfc ; -> objc_msgSend
000db112  ldr     r1, [pc, #0x154]
000db114  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000db116  ldr     r1, [r1]
000db118  blx     #0xddbfc ; -> objc_msgSend
000db11c  ldr     r1, [pc, #0x14c]
000db11e  ldr     r2, [pc, #0x150]
000db120  ldr     r3, [pc, #0x150]
000db122  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000db124  add     r2, pc ; -> 0x00182a44  
000db126  add     r3, pc ; -> 0x0017ea14  
000db128  ldr     r1, [r1]
000db12a  str     r3, [sp]
000db12c  str     r6, [sp, #4]
000db12e  mov     r4, r0
000db130  mov     r3, r4
000db132  ldr     r0, [sp, #8]
000db134  blx     #0xddbfc ; -> objc_msgSend
000db138  ldr     r1, [pc, #0x13c]
000db13a  mov     r0, r4
000db13c  ldr     r4, [pc, #0x13c]
000db13e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000db140  ldr     r5, [r1]
000db142  add     r4, pc ; -> 0x000fc508  OBJC_IVAR_$_Facebook._accessToken
000db144  mov     r1, r5
000db146  blx     #0xddbfc ; -> objc_msgSend
000db14a  ldr     r3, [r4]
000db14c  ldr     r1, [sp, #8]
000db14e  ldr     r0, [r1, r3]
000db150  mov     r1, r5
000db152  blx     #0xddbfc ; -> objc_msgSend
000db156  ldr     r3, [r4]
000db158  ldr     r4, [pc, #0x124]
000db15a  ldr     r2, [sp, #8]
000db15c  mov     r1, r5
000db15e  add     r4, pc ; -> 0x000fc504  OBJC_IVAR_$_Facebook._expirationDate
000db160  str     r6, [r2, r3]
000db162  ldr     r3, [r4]
000db164  ldr     r0, [r2, r3]
000db166  blx     #0xddbfc ; -> objc_msgSend
000db16a  ldr     r3, [r4]
000db16c  ldr     r1, [sp, #8]
000db16e  ldr     r0, [pc, #0x114]
000db170  str     r6, [r1, r3]
000db172  ldr     r1, [pc, #0x114]
000db174  add     r0, pc ; -> 0x000fdbdc  
000db176  add     r1, pc ; -> 0x000fcbf4  '\x04+\x0e'
000db178  ldr     r0, [r0]
000db17a  ldr     r1, [r1]
000db17c  blx     #0xddbfc ; -> objc_msgSend
000db180  ldr     r1, [pc, #0x108]
000db182  ldr     r2, [pc, #0x10c]
000db184  add     r1, pc ; -> 0x000fceac  
000db186  add     r2, pc ; -> 0x0017ece4  
000db188  ldr     r4, [r1]
000db18a  ldr     r1, [pc, #0x108]
000db18c  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000db18e  ldr     r1, [r1]
000db190  mov     fp, r0
000db192  ldr     r0, [pc, #0x104]
000db194  add     r0, pc ; -> 0x000fdb64  
000db196  ldr     r0, [r0]
000db198  blx     #0xddbfc ; -> objc_msgSend
000db19c  mov     r1, r4
000db19e  mov     r2, r0
000db1a0  mov     r0, fp
000db1a2  blx     #0xddbfc ; -> objc_msgSend
000db1a6  ldr     r1, [pc, #0xf4]
000db1a8  movs    r3, #0x10
000db1aa  add     r2, sp, #0x50
000db1ac  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000db1ae  str     r3, [sp]
000db1b0  ldr     r1, [r1]
000db1b2  add     r3, sp, r3
000db1b4  str     r6, [sp, #0x50]
000db1b6  str     r6, [sp, #0x54]
000db1b8  str     r6, [sp, #0x58]
000db1ba  str     r6, [sp, #0x5c]
000db1bc  str     r6, [sp, #0x60]
000db1be  str     r6, [sp, #0x64]
000db1c0  str     r6, [sp, #0x68]
000db1c2  str     r6, [sp, #0x6c]
000db1c4  str     r1, [sp, #0xc]
000db1c6  mov     sl, r0
000db1c8  blx     #0xddbfc ; -> objc_msgSend
000db1cc  cbz     r0, #0xdb21c
000db1ce  ldr     r1, [pc, #0xd0]
000db1d0  ldr     r3, [sp, #0x58]
000db1d2  mov     r5, r0
000db1d4  add     r1, pc ; -> 0x000fcea8  
000db1d6  ldr.w   r8, [r3]
000db1da  ldr     r6, [r1]
000db1dc  b       #0xdb1e0
000db1de  ldr     r3, [sp, #0x58]
000db1e0  movs    r4, #0
000db1e2  b       #0xdb1e6
000db1e4  ldr     r3, [sp, #0x58]
000db1e6  ldr     r3, [r3]
000db1e8  cmp     r3, r8
000db1ea  beq     #0xdb1f2
000db1ec  mov     r0, sl
000db1ee  blx     #0xddbe4 ; -> objc_enumerationMutation
000db1f2  ldr     r3, [sp, #0x54]
000db1f4  mov     r0, fp
000db1f6  mov     r1, r6
000db1f8  ldr.w   r2, [r3, r4, lsl #2]
000db1fc  adds    r4, #1
000db1fe  blx     #0xddbfc ; -> objc_msgSend
000db202  cmp     r5, r4
000db204  bhi     #0xdb1e4
000db206  movs    r3, #0x10
000db208  mov     r0, sl
000db20a  str     r3, [sp]
000db20c  ldr     r1, [sp, #0xc]
000db20e  add     r2, sp, #0x50
000db210  add     r3, sp, r3
000db212  blx     #0xddbfc ; -> objc_msgSend
000db216  mov     r5, r0
000db218  cmp     r0, #0
000db21a  bne     #0xdb1de
000db21c  ldr     r1, [pc, #0x84]
000db21e  ldr     r0, [sp, #8]
000db220  add     r1, pc ; -> 0x000fdac4  
000db222  ldr     r1, [r1]
000db224  blx     #0xddbfc ; -> objc_msgSend
000db228  ldr     r1, [pc, #0x7c]
000db22a  add     r1, pc ; -> 0x000fdac8  '(\x1b\x0f'
000db22c  ldr     r4, [r1]
000db22e  ldr     r1, [pc, #0x7c]
000db230  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db232  mov     r2, r4
000db234  ldr     r1, [r1]
000db236  blx     #0xddbfc ; -> objc_msgSend
000db23a  tst.w   r0, #0xff
000db23e  beq     #0xdb250
000db240  ldr     r3, [pc, #0x6c]
000db242  ldr     r2, [sp, #8]
000db244  mov     r1, r4
000db246  add     r3, pc ; -> 0x000fc50c  OBJC_IVAR_$_Facebook._sessionDelegate
000db248  ldr     r0, [r3]
000db24a  ldr     r0, [r2, r0]
000db24c  blx     #0xddbfc ; -> objc_msgSend
000db250  sub.w   sp, r7, #0x18
000db254  pop.w   {r8, sl, fp}
000db258  pop     {r4, r5, r6, r7, pc}
000db25a  nop     
000db25c  asrs    r4, r1, #0x10
000db25e  movs    r2, r0
000db260  adds    r6, r7, r1
000db262  movs    r2, r0
000db264  cmp     r2, #0xe6
000db266  movs    r2, r0
000db268  adds    r0, r5, r1
000db26a  movs    r2, r0
000db26c  cmp     r0, #0xae
000db26e  movs    r2, r0
000db270  ldrb    r4, [r3, #4]
000db272  movs    r2, r1
000db274  subs    r0, #0xea
000db276  movs    r2, r1
000db278  adds    r2, r7, r0
000db27a  movs    r2, r0
000db27c  asrs    r2, r0, #0xf
000db27e  movs    r2, r0
000db280  asrs    r2, r4, #0xe
000db282  movs    r2, r0
000db284  cmp     r2, #0x64
000db286  movs    r2, r0
000db288  subs    r2, r7, r1
000db28a  movs    r2, r0
000db28c  adds    r4, r4, #4
000db28e  movs    r2, r0
000db290  subs    r3, #0x5a
000db292  movs    r2, r1
000db294  subs    r0, r4, r0
000db296  movs    r2, r0
000db298  cmp     r1, #0xcc
000db29a  movs    r2, r0
000db29c  asrs    r0, r5, #0x1f
000db29e  movs    r2, r0
000db2a0  adds    r0, r2, #3
000db2a2  movs    r2, r0
000db2a4  cmp     r0, #0xa0
000db2a6  movs    r2, r0
000db2a8  cmp     r0, #0x9a
000db2aa  movs    r2, r0
000db2ac  subs    r4, r3, r1
000db2ae  movs    r2, r0
000db2b0  asrs    r2, r0, #0xb
000db2b2  movs    r2, r0
