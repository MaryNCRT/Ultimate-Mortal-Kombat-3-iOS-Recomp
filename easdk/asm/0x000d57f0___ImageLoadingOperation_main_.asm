========================================================================
-[ImageLoadingOperation main]  0x000d57f0  324 bytes   ImageLoadingOperation.m
========================================================================

000d57f0  push    {r4, r5, r6, r7, lr}
000d57f2  add     r7, sp, #0xc
000d57f4  push.w  {r8, sl, fp}
000d57f8  sub     sp, #8
000d57fa  ldr     r1, [pc, #0xf8]
000d57fc  mov     r8, r0
000d57fe  add     r1, pc ; -> 0x000fda9c  
000d5800  ldr     r6, [r1]
000d5802  mov     r1, r6
000d5804  blx     #0xddbfc ; -> objc_msgSend
000d5808  ldr     r1, [pc, #0xec]
000d580a  ldr     r2, [pc, #0xf0]
000d580c  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d580e  add     r2, pc ; -> 0x0017d05c  OperationURLKey
000d5810  ldr.w   sl, [r1]
000d5814  ldr     r2, [r2]
000d5816  mov     r1, sl
000d5818  blx     #0xddbfc ; -> objc_msgSend
000d581c  ldr     r1, [pc, #0xe0]
000d581e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d5820  ldr     r4, [r1]
000d5822  mov     r1, r4
000d5824  mov     r5, r0
000d5826  ldr     r0, [pc, #0xdc]
000d5828  add     r0, pc ; -> 0x000fdb6c  
000d582a  ldr     r0, [r0]
000d582c  blx     #0xddbfc ; -> objc_msgSend
000d5830  ldr     r1, [pc, #0xd4]
000d5832  mov     r2, r5
000d5834  add     r1, pc ; -> 0x000fdaa0  
000d5836  ldr     r1, [r1]
000d5838  blx     #0xddbfc ; -> objc_msgSend
000d583c  mov     r1, r4
000d583e  str     r0, [sp, #4]
000d5840  ldr     r0, [pc, #0xc8]
000d5842  add     r0, pc ; -> 0x000fdba8  
000d5844  ldr     r0, [r0]
000d5846  blx     #0xddbfc ; -> objc_msgSend
000d584a  ldr     r1, [pc, #0xc4]
000d584c  ldr     r2, [sp, #4]
000d584e  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000d5850  ldr     r1, [r1]
000d5852  blx     #0xddbfc ; -> objc_msgSend
000d5856  mov     r1, r6
000d5858  mov     fp, r0
000d585a  mov     r0, r8
000d585c  blx     #0xddbfc ; -> objc_msgSend
000d5860  ldr     r1, [pc, #0xb0]
000d5862  ldr     r3, [pc, #0xb4]
000d5864  mov     r2, fp
000d5866  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000d5868  add     r3, pc ; -> 0x0017d068  OperationImageKey
000d586a  ldr     r1, [r1]
000d586c  ldr     r3, [r3]
000d586e  blx     #0xddbfc ; -> objc_msgSend
000d5872  ldr     r0, [pc, #0xa8]
000d5874  ldr     r1, [pc, #0xa8]
000d5876  add     r0, pc ; -> 0x000fdb44  
000d5878  add     r1, pc ; -> 0x000fd564  
000d587a  ldr     r5, [r0]
000d587c  ldr     r4, [r1]
000d587e  mov     r0, r8
000d5880  mov     r1, r6
000d5882  blx     #0xddbfc ; -> objc_msgSend
000d5886  mov     r1, r4
000d5888  mov     r2, r0
000d588a  mov     r0, r5
000d588c  blx     #0xddbfc ; -> objc_msgSend
000d5890  mov     r1, r6
000d5892  mov     r5, r0
000d5894  mov     r0, r8
000d5896  blx     #0xddbfc ; -> objc_msgSend
000d589a  ldr     r2, [pc, #0x88]
000d589c  mov     r1, sl
000d589e  add     r2, pc ; -> 0x0017d064  OperationSelectorKey
000d58a0  ldr     r2, [r2]
000d58a2  blx     #0xddbfc ; -> objc_msgSend
000d58a6  blx     #0xdd3f8 ; -> NSSelectorFromString
000d58aa  mov     r1, r6
000d58ac  mov     r4, r0
000d58ae  mov     r0, r8
000d58b0  blx     #0xddbfc ; -> objc_msgSend
000d58b4  ldr     r2, [pc, #0x70]
000d58b6  mov     r1, sl
000d58b8  add     r2, pc ; -> 0x0017d060  OperationTargetKey
000d58ba  ldr     r2, [r2]
000d58bc  blx     #0xddbfc ; -> objc_msgSend
000d58c0  ldr     r1, [pc, #0x68]
000d58c2  mov     r2, r4
000d58c4  movs    r3, #0
000d58c6  add     r1, pc ; -> 0x000fca38  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc0
000d58c8  str     r3, [sp]
000d58ca  ldr     r1, [r1]
000d58cc  mov     r3, r5
000d58ce  blx     #0xddbfc ; -> objc_msgSend
000d58d2  ldr     r1, [pc, #0x5c]
000d58d4  mov     r0, fp
000d58d6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d58d8  ldr     r4, [r1]
000d58da  mov     r1, r4
000d58dc  blx     #0xddbfc ; -> objc_msgSend
000d58e0  ldr     r0, [sp, #4]
000d58e2  mov     r1, r4
000d58e4  blx     #0xddbfc ; -> objc_msgSend
000d58e8  sub.w   sp, r7, #0x18
000d58ec  pop.w   {r8, sl, fp}
000d58f0  pop     {r4, r5, r6, r7, pc}
000d58f2  nop     
000d58f4  strh    r2, [r3, #0x14]
000d58f6  movs    r2, r0
000d58f8  strb    r4, [r0, #0xb]
000d58fa  movs    r2, r0
000d58fc  ldrb    r2, [r1, #1]
000d58fe  movs    r2, r1
000d5900  strb    r2, [r4, #5]
000d5902  movs    r2, r0
000d5904  strh    r0, [r0, #0x1a]
000d5906  movs    r2, r0
000d5908  strh    r0, [r5, #0x12]
000d590a  movs    r2, r0
000d590c  strh    r2, [r4, #0x1a]
000d590e  movs    r2, r0
000d5910  strb    r2, [r2, #0x18]
000d5912  movs    r2, r0
000d5914  strb    r6, [r5, #9]
000d5916  movs    r2, r0
000d5918  strb    r4, [r7, #0x1f]
000d591a  movs    r2, r1
000d591c  strh    r2, [r1, #0x16]
000d591e  movs    r2, r0
000d5920  ldrb    r0, [r5, #0x13]
000d5922  movs    r2, r0
000d5924  strb    r2, [r0, #0x1f]
000d5926  movs    r2, r1
000d5928  strb    r4, [r4, #0x1e]
000d592a  movs    r2, r1
000d592c  strb    r6, [r5, #5]
000d592e  movs    r2, r0
000d5930  strb    r2, [r4, #2]
000d5932  movs    r2, r0
