========================================================================
-[XMLElement print  0x0008b09c  572 bytes   Mayhem.mm
========================================================================

0008b09c  push    {r4, r5, r6, r7, lr}
0008b09e  add     r7, sp, #0xc
0008b0a0  push.w  {r8, sl, fp}
0008b0a4  sub     sp, #0xf4
0008b0a6  str     r0, [sp, #0xc]
0008b0a8  mov     r8, r2
0008b0aa  cmp     r2, #0
0008b0ac  beq.w   #0x8b280
0008b0b0  ldr     r3, [pc, #0x1d4]
0008b0b2  ldr     r1, [sp, #0xc]
0008b0b4  ldr.w   r0, [pc, #0x1d4]
0008b0b8  add     r3, pc ; -> 0x000f6438  OBJC_IVAR_$_XMLElement.m_name
0008b0ba  ldr     r3, [r3]
0008b0bc  add     r0, pc ; -> 0x0017efb4  
0008b0be  ldr     r2, [r1, r3]
0008b0c0  mov     r1, r8
0008b0c2  blx     #0xdd3e0 ; -> NSLog
0008b0c6  movs    r3, #0
0008b0c8  str     r3, [sp, #0xd4]
0008b0ca  str     r3, [sp, #0xd8]
0008b0cc  str     r3, [sp, #0xdc]
0008b0ce  str     r3, [sp, #0xe0]
0008b0d0  str     r3, [sp, #0xe4]
0008b0d2  str     r3, [sp, #0xe8]
0008b0d4  str     r3, [sp, #0xec]
0008b0d6  str     r3, [sp, #0xf0]
0008b0d8  ldr     r3, [pc, #0x1b4]
0008b0da  ldr     r1, [pc, #0x1b8]
0008b0dc  ldr     r2, [sp, #0xc]
0008b0de  add     r3, pc ; -> 0x000f643c  OBJC_IVAR_$_XMLElement.m_attributes
0008b0e0  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
0008b0e2  ldr     r0, [r3]
0008b0e4  ldr     r1, [r1]
0008b0e6  movs    r3, #0x10
0008b0e8  ldr     r0, [r2, r0]
0008b0ea  str     r3, [sp]
0008b0ec  add     r2, sp, #0xd4
0008b0ee  add     r3, sp, #0x74
0008b0f0  str     r0, [sp, #0x10]
0008b0f2  str     r1, [sp, #0x14]
0008b0f4  blx     #0xddbfc ; -> objc_msgSend
0008b0f8  cmp     r0, #0
0008b0fa  beq     #0x8b176
0008b0fc  ldr     r1, [pc, #0x198]
0008b0fe  ldr     r3, [sp, #0xdc]
0008b100  ldr.w   fp, [pc, #0x198]
0008b104  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
0008b106  mov     r6, r0
0008b108  ldr     r3, [r3]
0008b10a  ldr.w   sl, [r1]
0008b10e  ldr     r1, [pc, #0x190]
0008b110  add     fp, pc ; -> 0x0017efc4  
0008b112  str     r3, [sp, #0x28]
0008b114  str     r1, [sp, #8]
0008b116  movs    r5, #0
0008b118  b       #0x8b11e
0008b11a  ldr     r3, [sp, #0xdc]
0008b11c  ldr     r3, [r3]
0008b11e  ldr     r2, [sp, #0x28]
0008b120  cmp     r2, r3
0008b122  beq     #0x8b132
0008b124  ldr     r3, [pc, #0x17c]
0008b126  ldr     r1, [sp, #0xc]
0008b128  add     r3, pc ; -> 0x000f643c  OBJC_IVAR_$_XMLElement.m_attributes
0008b12a  ldr     r3, [r3]
0008b12c  ldr     r0, [r1, r3]
0008b12e  blx     #0xddbe4 ; -> objc_enumerationMutation
0008b132  ldr     r3, [sp, #8]
0008b134  ldr     r2, [sp, #0xd8]
0008b136  mov     r1, sl
0008b138  add     r3, pc
0008b13a  ldr.w   r4, [r2, r5, lsl #2]
0008b13e  ldr     r3, [r3]
0008b140  ldr     r2, [sp, #0xc]
0008b142  adds    r5, #1
0008b144  ldr     r0, [r2, r3]
0008b146  mov     r2, r4
0008b148  blx     #0xddbfc ; -> objc_msgSend
0008b14c  mov     r1, r8
0008b14e  mov     r2, r4
0008b150  mov     r3, r0
0008b152  mov     r0, fp
0008b154  blx     #0xdd3e0 ; -> NSLog
0008b158  cmp     r6, r5
0008b15a  bhi     #0x8b11a
0008b15c  movs    r3, #0x10
0008b15e  ldr     r0, [sp, #0x10]
0008b160  str     r3, [sp]
0008b162  ldr     r1, [sp, #0x14]
0008b164  add     r2, sp, #0xd4
0008b166  add     r3, sp, #0x74
0008b168  blx     #0xddbfc ; -> objc_msgSend
0008b16c  cbz     r0, #0x8b176
0008b16e  ldr     r3, [sp, #0xdc]
0008b170  mov     r6, r0
0008b172  ldr     r3, [r3]
0008b174  b       #0x8b116
0008b176  ldr     r3, [pc, #0x130]
0008b178  ldr     r1, [sp, #0xc]
0008b17a  ldr     r0, [pc, #0x130]
0008b17c  add     r3, pc ; -> 0x000f6444  OBJC_IVAR_$_XMLElement.m_text
0008b17e  ldr     r3, [r3]
0008b180  add     r0, pc ; -> 0x0017efd4  
0008b182  ldr     r2, [r1, r3]
0008b184  mov     r1, r8
0008b186  blx     #0xdd3e0 ; -> NSLog
0008b18a  movs    r3, #0
0008b18c  str     r3, [sp, #0xb4]
0008b18e  str     r3, [sp, #0xb8]
0008b190  str     r3, [sp, #0xbc]
0008b192  str     r3, [sp, #0xc0]
0008b194  str     r3, [sp, #0xc4]
0008b196  str     r3, [sp, #0xc8]
0008b198  str     r3, [sp, #0xcc]
0008b19a  str     r3, [sp, #0xd0]
0008b19c  ldr     r3, [pc, #0x110]
0008b19e  ldr     r2, [sp, #0xc]
0008b1a0  ldr     r1, [sp, #0x14]
0008b1a2  add     r3, pc ; -> 0x000f6440  OBJC_IVAR_$_XMLElement.m_children
0008b1a4  ldr     r0, [r3]
0008b1a6  movs    r3, #0x10
0008b1a8  ldr     r0, [r2, r0]
0008b1aa  str     r3, [sp]
0008b1ac  add     r2, sp, #0xb4
0008b1ae  add     r3, sp, #0x34
0008b1b0  str     r0, [sp, #0x18]
0008b1b2  blx     #0xddbfc ; -> objc_msgSend
0008b1b6  cmp     r0, #0
0008b1b8  beq     #0x8b276
0008b1ba  ldr     r1, [pc, #0xf8]
0008b1bc  ldr     r3, [sp, #0xbc]
0008b1be  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
0008b1c0  ldr     r1, [r1]
0008b1c2  ldr     r3, [r3]
0008b1c4  str     r0, [sp, #0x20]
0008b1c6  str     r1, [sp, #0x30]
0008b1c8  ldr     r1, [pc, #0xec]
0008b1ca  str     r3, [sp, #0x24]
0008b1cc  add     r1, pc ; -> 0x000fce84  '^=\x0e'
0008b1ce  ldr     r1, [r1]
0008b1d0  str     r1, [sp, #0x1c]
0008b1d2  ldr     r1, [pc, #0xe8]
0008b1d4  add     r1, pc ; -> 0x000fcfdc  
0008b1d6  ldr     r6, [r1]
0008b1d8  ldr     r1, [pc, #0xe4]
0008b1da  add     r1, pc ; -> 0x000fcfd8  'yS\x0e'
0008b1dc  ldr.w   fp, [r1]
0008b1e0  ldr     r1, [pc, #0xe0]
0008b1e2  add     r1, pc ; -> 0x000fcfe4  
0008b1e4  ldr.w   sl, [r1]
0008b1e8  ldr     r1, [pc, #0xdc]
0008b1ea  str     r1, [sp, #4]
0008b1ec  movs    r2, #0
0008b1ee  str     r2, [sp, #0x2c]
0008b1f0  ldr     r1, [sp, #0x24]
0008b1f2  cmp     r1, r3
0008b1f4  beq     #0x8b204
0008b1f6  ldr     r3, [pc, #0xd4]
0008b1f8  ldr     r2, [sp, #0xc]
0008b1fa  add     r3, pc ; -> 0x000f6440  OBJC_IVAR_$_XMLElement.m_children
0008b1fc  ldr     r3, [r3]
0008b1fe  ldr     r0, [r2, r3]
0008b200  blx     #0xddbe4 ; -> objc_enumerationMutation
0008b204  ldr     r3, [sp, #4]
0008b206  ldr     r1, [sp, #0xc]
0008b208  add     r3, pc
0008b20a  ldr     r3, [r3]
0008b20c  ldr     r0, [r1, r3]
0008b20e  ldr     r3, [sp, #0xb8]
0008b210  ldr     r1, [sp, #0x2c]
0008b212  ldr.w   r2, [r3, r1, lsl #2]
0008b216  ldr     r1, [sp, #0x30]
0008b218  blx     #0xddbfc ; -> objc_msgSend
0008b21c  ldr     r1, [sp, #0x1c]
0008b21e  blx     #0xddbfc ; -> objc_msgSend
0008b222  mov     r5, r0
0008b224  b       #0x8b23c
0008b226  ldr     r2, [pc, #0xa8]
0008b228  mov     r1, sl
0008b22a  mov     r0, r8
0008b22c  add     r2, pc ; -> 0x0017efe4  
0008b22e  blx     #0xddbfc ; -> objc_msgSend
0008b232  mov     r1, fp
0008b234  mov     r2, r0
0008b236  mov     r0, r4
0008b238  blx     #0xddbfc ; -> objc_msgSend
0008b23c  mov     r0, r5
0008b23e  mov     r1, r6
0008b240  blx     #0xddbfc ; -> objc_msgSend
0008b244  mov     r4, r0
0008b246  cmp     r0, #0
0008b248  bne     #0x8b226
0008b24a  ldr     r2, [sp, #0x2c]
0008b24c  ldr     r3, [sp, #0x20]
0008b24e  adds    r2, #1
0008b250  cmp     r3, r2
0008b252  str     r2, [sp, #0x2c]
0008b254  bls     #0x8b25c
0008b256  ldr     r3, [sp, #0xbc]
0008b258  ldr     r3, [r3]
0008b25a  b       #0x8b1f0
0008b25c  movs    r3, #0x10
0008b25e  ldr     r0, [sp, #0x18]
0008b260  str     r3, [sp]
0008b262  ldr     r1, [sp, #0x14]
0008b264  add     r2, sp, #0xb4
0008b266  add     r3, sp, #0x34
0008b268  blx     #0xddbfc ; -> objc_msgSend
0008b26c  cbz     r0, #0x8b276
0008b26e  ldr     r3, [sp, #0xbc]
0008b270  ldr     r3, [r3]
0008b272  str     r0, [sp, #0x20]
0008b274  b       #0x8b1ec
0008b276  sub.w   sp, r7, #0x18
0008b27a  pop.w   {r8, sl, fp}
0008b27e  pop     {r4, r5, r6, r7, pc}
0008b280  ldr.w   r8, [pc, #0x50]
0008b284  add     r8, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
0008b286  b       #0x8b0b0
0008b288  cbz     r4, #0x8b2ea
0008b28a  movs    r6, r0
0008b28c  subs    r6, #0xf4
0008b28e  movs    r7, r1
0008b290  cbz     r2, #0x8b2ea
0008b292  movs    r6, r0
0008b294  adds    r4, r6, r2
0008b296  movs    r7, r0
0008b298  adds    r4, r1, r7
0008b29a  movs    r7, r0
0008b29c  subs    r6, #0xb0
0008b29e  movs    r7, r1
0008b2a0  cbz     r0, #0x8b2e4
0008b2a2  movs    r6, r0
0008b2a4  cbz     r0, #0x8b2ec
0008b2a6  movs    r6, r0
0008b2a8  uxtb    r4, r0
0008b2aa  movs    r6, r0
0008b2ac  subs    r6, #0x50
0008b2ae  movs    r7, r1
0008b2b0  uxth    r2, r3
0008b2b2  movs    r6, r0
0008b2b4  adds    r2, r2, r4
0008b2b6  movs    r7, r0
0008b2b8  adds    r4, r6, #2
0008b2ba  movs    r7, r0
0008b2bc  subs    r4, r0, #0
0008b2be  movs    r7, r0
0008b2c0  adds    r2, r7, #7
0008b2c2  movs    r7, r0
0008b2c4  adds    r6, r7, #7
0008b2c6  movs    r7, r0
0008b2c8  sxth    r4, r6
0008b2ca  movs    r6, r0
0008b2cc  sxtb    r2, r0
0008b2ce  movs    r6, r0
0008b2d0  subs    r5, #0xb4
0008b2d2  movs    r7, r1
0008b2d4  adds    r0, #0x6c
0008b2d6  movs    r7, r1
