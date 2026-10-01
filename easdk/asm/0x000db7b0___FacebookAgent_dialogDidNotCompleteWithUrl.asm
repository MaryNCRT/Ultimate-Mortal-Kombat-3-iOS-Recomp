========================================================================
-[FacebookAgent dialogDidNotCompleteWithUrl  0x000db7b0  288 bytes   FacebookAgent.mm
========================================================================

000db7b0  push    {r4, r5, r6, r7, lr}
000db7b2  add     r7, sp, #0xc
000db7b4  str     r8, [sp, #-0x4]!
000db7b8  ldr     r3, [pc, #0xd4]
000db7ba  mov     r4, r0
000db7bc  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db7be  ldr     r3, [r3]
000db7c0  ldr     r3, [r0, r3]
000db7c2  cmp     r3, #5
000db7c4  beq     #0xdb81c
000db7c6  cmp     r3, #6
000db7c8  beq     #0xdb7d0
000db7ca  cmp     r3, #4
000db7cc  bne     #0xdb854
000db7ce  b       #0xdb7e4
000db7d0  ldr     r5, [pc, #0xc0]
000db7d2  ldr     r1, [pc, #0xc4]
000db7d4  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db7d6  add     r1, pc ; -> 0x000fd978  'n\x0b\x0f'
000db7d8  ldr     r3, [r5]
000db7da  ldr     r6, [r1]
000db7dc  ldr     r1, [pc, #0xbc]
000db7de  ldr     r0, [r0, r3]
000db7e0  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db7e2  b       #0xdb866
000db7e4  ldr     r3, [pc, #0xb8]
000db7e6  ldr     r1, [pc, #0xbc]
000db7e8  ldr     r5, [pc, #0xbc]
000db7ea  add     r3, pc ; -> 0x000fc8c0  OBJC_IVAR_$_FacebookAgent.hasPublishPermission
000db7ec  add     r1, pc ; -> 0x000fd974  
000db7ee  ldr     r3, [r3]
000db7f0  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db7f2  ldr     r6, [r1]
000db7f4  ldr     r1, [pc, #0xb4]
000db7f6  mov.w   r8, #0
000db7fa  strb.w  r8, [r0, r3]
000db7fe  ldr     r3, [r5]
000db800  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db802  mov     r2, r6
000db804  ldr     r1, [r1]
000db806  ldr     r0, [r0, r3]
000db808  blx     #0xddbfc ; -> objc_msgSend
000db80c  tst.w   r0, #0xff
000db810  beq     #0xdb87e
000db812  ldr     r3, [r5]
000db814  mov     r1, r6
000db816  mov     r2, r8
000db818  ldr     r0, [r4, r3]
000db81a  b       #0xdb84e
000db81c  ldr     r3, [pc, #0x90]
000db81e  ldr     r1, [pc, #0x94]
000db820  ldr     r5, [pc, #0x94]
000db822  add     r3, pc ; -> 0x000fc8c4  OBJC_IVAR_$_FacebookAgent.hasOfflinePermission
000db824  add     r1, pc ; -> 0x000fd974  
000db826  ldr     r3, [r3]
000db828  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db82a  ldr     r6, [r1]
000db82c  ldr     r1, [pc, #0x8c]
000db82e  movs    r2, #0
000db830  strb    r2, [r0, r3]
000db832  ldr     r3, [r5]
000db834  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db836  mov     r2, r6
000db838  ldr     r1, [r1]
000db83a  ldr     r0, [r0, r3]
000db83c  blx     #0xddbfc ; -> objc_msgSend
000db840  tst.w   r0, #0xff
000db844  beq     #0xdb87e
000db846  ldr     r3, [r5]
000db848  movs    r2, #1
000db84a  mov     r1, r6
000db84c  ldr     r0, [r4, r3]
000db84e  blx     #0xddbfc ; -> objc_msgSend
000db852  b       #0xdb87e
000db854  ldr     r5, [pc, #0x68]
000db856  ldr     r1, [pc, #0x6c]
000db858  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db85a  add     r1, pc ; -> 0x000fd970  '\\\x0b\x0f'
000db85c  ldr     r3, [r5]
000db85e  ldr     r6, [r1]
000db860  ldr     r1, [pc, #0x64]
000db862  ldr     r0, [r0, r3]
000db864  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db866  ldr     r1, [r1]
000db868  mov     r2, r6
000db86a  blx     #0xddbfc ; -> objc_msgSend
000db86e  tst.w   r0, #0xff
000db872  beq     #0xdb87e
000db874  ldr     r3, [r5]
000db876  mov     r1, r6
000db878  ldr     r0, [r4, r3]
000db87a  blx     #0xddbfc ; -> objc_msgSend
000db87e  ldr     r3, [pc, #0x4c]
000db880  movs    r2, #0
000db882  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db884  ldr     r3, [r3]
000db886  str     r2, [r4, r3]
000db888  ldr     r8, [sp], #4
000db88c  pop     {r4, r5, r6, r7, pc}
000db88e  nop     
000db890  asrs    r0, r1, #4
000db892  movs    r2, r0
000db894  asrs    r0, r3, #3
000db896  movs    r2, r0
000db898  movs    r1, #0x9e
000db89a  movs    r2, r0
000db89c  asrs    r4, r5, #0x12
000db89e  movs    r2, r0
000db8a0  asrs    r2, r2, #3
000db8a2  movs    r2, r0
000db8a4  movs    r1, #0x84
000db8a6  movs    r2, r0
000db8a8  asrs    r4, r7, #2
000db8aa  movs    r2, r0
000db8ac  asrs    r4, r1, #0x12
000db8ae  movs    r2, r0
000db8b0  asrs    r6, r3, #2
000db8b2  movs    r2, r0
000db8b4  movs    r1, #0x4c
000db8b6  movs    r2, r0
000db8b8  asrs    r4, r0, #2
000db8ba  movs    r2, r0
000db8bc  asrs    r0, r3, #0x11
000db8be  movs    r2, r0
000db8c0  asrs    r4, r2, #1
000db8c2  movs    r2, r0
000db8c4  movs    r1, #0x12
000db8c6  movs    r2, r0
000db8c8  asrs    r0, r5, #0x10
000db8ca  movs    r2, r0
000db8cc  asrs    r2, r0, #1
000db8ce  movs    r2, r0
