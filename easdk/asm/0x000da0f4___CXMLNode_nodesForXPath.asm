========================================================================
-[CXMLNode nodesForXPath  0x000da0f4  416 bytes   CXMLNode.m
========================================================================

000da0f4  push    {r4, r5, r6, r7, lr}
000da0f6  add     r7, sp, #0xc
000da0f8  push.w  {r8, sl, fp}
000da0fc  sub     sp, #0x28
000da0fe  mov     sl, r3
000da100  ldr     r3, [pc, #0x140]
000da102  mov     r5, r0
000da104  mov     r8, r1
000da106  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000da108  mov     r6, r2
000da10a  ldr     r3, [r3]
000da10c  ldr     r4, [r0, r3]
000da10e  cmp     r4, #0
000da110  bne     #0xda164
000da112  ldr     r0, [pc, #0x134]
000da114  ldr     r1, [pc, #0x134]
000da116  add     r0, pc ; -> 0x000fdcd4  
000da118  add     r1, pc ; -> 0x000fd860  
000da11a  ldr     r0, [r0]
000da11c  ldr     r1, [r1]
000da11e  blx     #0xddbfc ; -> objc_msgSend
000da122  ldr     r1, [pc, #0x12c]
000da124  ldr     r2, [pc, #0x12c]
000da126  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000da128  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000da12a  ldr.w   fp, [r1]
000da12e  ldr     r1, [pc, #0x128]
000da130  add     r1, pc ; -> 0x000fd77c  
000da132  ldr     r1, [r1]
000da134  str     r0, [sp, #0x20]
000da136  ldr     r0, [pc, #0x124]
000da138  add     r0, pc ; -> 0x000fdb5c  
000da13a  ldr     r0, [r0]
000da13c  blx     #0xddbfc ; -> objc_msgSend
000da140  ldr     r3, [pc, #0x11c]
000da142  mov.w   r2, #0x11a
000da146  mov     r1, fp
000da148  add     r3, pc ; -> 0x00182684  
000da14a  str     r2, [sp, #4]
000da14c  str     r3, [sp, #8]
000da14e  mov     r2, r8
000da150  mov     r3, r5
000da152  str     r4, [sp, #0xc]
000da154  str     r4, [sp, #0x10]
000da156  str     r4, [sp, #0x14]
000da158  str     r4, [sp, #0x18]
000da15a  str     r4, [sp, #0x1c]
000da15c  str     r0, [sp]
000da15e  ldr     r0, [sp, #0x20]
000da160  blx     #0xddbfc ; -> objc_msgSend
000da164  ldr     r4, [pc, #0xfc]
000da166  add     r4, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000da168  ldr     r3, [r4]
000da16a  ldr     r3, [r5, r3]
000da16c  ldr     r0, [r3, #0x20]
000da16e  blx     #0xddf20 ; -> xmlXPathNewContext
000da172  ldr     r1, [pc, #0xf4]
000da174  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000da176  ldr     r1, [r1]
000da178  mov     fp, r0
000da17a  ldr     r0, [r4]
000da17c  ldr     r0, [r5, r0]
000da17e  str.w   r0, [fp, #4]
000da182  mov     r0, r6
000da184  blx     #0xddbfc ; -> objc_msgSend
000da188  mov     r1, fp
000da18a  blx     #0xddefc ; -> xmlXPathEvalExpression
000da18e  mov     r5, r0
000da190  cbnz    r0, #0xda1ba
000da192  cmp.w   sl, #0
000da196  beq     #0xda1b6
000da198  ldr     r0, [pc, #0xd0]
000da19a  ldr     r1, [pc, #0xd4]
000da19c  ldr     r2, [pc, #0xd4]
000da19e  add     r0, pc ; -> 0x000fdc04  
000da1a0  add     r1, pc ; -> 0x000fce5c  
000da1a2  ldr     r0, [r0]
000da1a4  add     r2, pc ; -> 0x001826a4  
000da1a6  ldr     r1, [r1]
000da1a8  mov.w   r3, #-1
000da1ac  str     r5, [sp]
000da1ae  blx     #0xddbfc ; -> objc_msgSend
000da1b2  str.w   r0, [sl]
000da1b6  mov     r4, r5
000da1b8  b       #0xda238
000da1ba  ldr     r3, [r0, #4]
000da1bc  cbz     r3, #0xda1c6
000da1be  ldr     r2, [r3]
000da1c0  cbz     r2, #0xda1c6
000da1c2  ldr     r3, [r3, #8]
000da1c4  cbnz    r3, #0xda1da
000da1c6  ldr     r0, [pc, #0xb0]
000da1c8  ldr     r1, [pc, #0xb0]
000da1ca  add     r0, pc ; -> 0x000fdc14  
000da1cc  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
000da1ce  ldr     r0, [r0]
000da1d0  ldr     r1, [r1]
000da1d2  blx     #0xddbfc ; -> objc_msgSend
000da1d6  mov     r4, r0
000da1d8  b       #0xda22c
000da1da  ldr     r0, [pc, #0xa4]
000da1dc  ldr     r1, [pc, #0xa4]
000da1de  movs    r4, #0
000da1e0  add     r0, pc ; -> 0x000fdb70  
000da1e2  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
000da1e4  ldr     r0, [r0]
000da1e6  ldr     r1, [r1]
000da1e8  blx     #0xddbfc ; -> objc_msgSend
000da1ec  ldr     r1, [pc, #0x98]
000da1ee  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000da1f0  ldr.w   sl, [r1]
000da1f4  ldr     r1, [pc, #0x94]
000da1f6  add     r1, pc ; -> 0x000fd84c  
000da1f8  ldr     r6, [r1]
000da1fa  str     r0, [sp, #0x24]
000da1fc  ldr     r0, [pc, #0x90]
000da1fe  add     r0, pc ; -> 0x000fdcd8  
000da200  ldr.w   r8, [r0]
000da204  b       #0xda222
000da206  ldr     r3, [r3, #8]
000da208  mov     r1, r6
000da20a  mov     r0, r8
000da20c  ldr.w   r2, [r3, r4, lsl #2]
000da210  movs    r3, #0
000da212  blx     #0xddbfc ; -> objc_msgSend
000da216  mov     r1, sl
000da218  adds    r4, #1
000da21a  mov     r2, r0
000da21c  ldr     r0, [sp, #0x24]
000da21e  blx     #0xddbfc ; -> objc_msgSend
000da222  ldr     r3, [r5, #4]
000da224  ldr     r2, [r3]
000da226  cmp     r4, r2
000da228  blt     #0xda206
000da22a  ldr     r4, [sp, #0x24]
000da22c  mov     r0, r5
000da22e  blx     #0xddf14 ; -> xmlXPathFreeObject
000da232  mov     r0, fp
000da234  blx     #0xddf08 ; -> xmlXPathFreeContext
000da238  mov     r0, r4
000da23a  sub.w   sp, r7, #0x18
000da23e  pop.w   {r8, sl, fp}
000da242  pop     {r4, r5, r6, r7, pc}
000da244  subs    r6, r3, #4
000da246  movs    r2, r0
000da248  subs    r3, #0xba
000da24a  movs    r2, r0
000da24c  adds    r7, #0x44
000da24e  movs    r2, r0
000da250  adds    r7, #0x32
000da252  movs    r2, r0
000da254  adds    r5, #0xd4
000da256  movs    r1, r0
000da258  adds    r6, #0x48
000da25a  movs    r2, r0
000da25c  subs    r2, #0x20
000da25e  movs    r2, r0
000da260  strh    r0, [r7, #0x28]
000da262  movs    r2, r1
000da264  subs    r6, r7, #2
000da266  movs    r2, r0
000da268  cmp     r0, #0xa8
000da26a  movs    r2, r0
000da26c  subs    r2, #0x62
000da26e  movs    r2, r0
000da270  cmp     r4, #0xb8
000da272  movs    r2, r0
000da274  strh    r4, [r7, #0x26]
000da276  movs    r2, r1
000da278  subs    r2, #0x46
000da27a  movs    r2, r0
000da27c  cmp     r3, #0x54
000da27e  movs    r2, r0
000da280  subs    r1, #0x8c
000da282  movs    r2, r0
000da284  cmp     r3, #0x3e
000da286  movs    r2, r0
000da288  cmp     r0, #0x92
000da28a  movs    r2, r0
000da28c  adds    r6, #0x52
000da28e  movs    r2, r0
000da290  subs    r2, #0xd6
000da292  movs    r2, r0
