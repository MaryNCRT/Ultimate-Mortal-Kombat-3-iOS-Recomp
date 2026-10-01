========================================================================
-[SBJsonWriter appendArray  0x000d543c  468 bytes   SBJsonWriter.mm
========================================================================

000d543c  push    {r4, r5, r6, r7, lr}
000d543e  add     r7, sp, #0xc
000d5440  push.w  {r8, sl, fp}
000d5444  sub     sp, #0x80
000d5446  mov     r8, r3
000d5448  ldr     r3, [pc, #0x184]
000d544a  str     r2, [sp, #4]
000d544c  mov     r6, r0
000d544e  add     r3, pc ; -> 0x000f32d8  OBJC_IVAR_$_SBJsonBase.maxDepth
000d5450  ldr     r1, [r3]
000d5452  ldr     r3, [r1]
000d5454  ldr     r3, [r0, r3]
000d5456  cmp     r3, #0
000d5458  beq.w   #0xd5584
000d545c  ldr     r3, [pc, #0x174]
000d545e  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d5460  ldr     r3, [r3]
000d5462  ldr     r3, [r3]
000d5464  ldr     r2, [r0, r3]
000d5466  adds    r2, #1
000d5468  str     r2, [r0, r3]
000d546a  ldr     r3, [r1]
000d546c  ldr     r3, [r0, r3]
000d546e  cmp     r2, r3
000d5470  bls.w   #0xd5584
000d5474  ldr.w   r1, [pc, #0x160]
000d5478  ldr.w   r3, [pc, #0x160]
000d547c  movs    r2, #7
000d547e  add     r1, pc ; -> 0x000fd91c  
000d5480  add     r3, pc ; -> 0x00182244  
000d5482  ldr     r1, [r1]
000d5484  blx     #0xddbfc ; -> objc_msgSend
000d5488  movs    r0, #0
000d548a  b       #0xd55c6
000d548c  ldr     r1, [pc, #0x150]
000d548e  ldr     r3, [sp, #0x68]
000d5490  mov     sl, r0
000d5492  add     r1, pc ; -> 0x000fd754  
000d5494  ldr     r1, [r1]
000d5496  ldr     r2, [r3]
000d5498  str     r4, [sp, #0x18]
000d549a  str     r1, [sp, #0x10]
000d549c  ldr     r1, [pc, #0x144]
000d549e  str     r2, [sp, #0x1c]
000d54a0  add     r1, pc ; -> 0x000fd904  
000d54a2  ldr     r1, [r1]
000d54a4  str     r1, [sp, #0x14]
000d54a6  ldr     r1, [pc, #0x140]
000d54a8  add     r1, pc ; -> 0x000fd924  
000d54aa  ldr.w   fp, [r1]
000d54ae  b       #0xd54b2
000d54b0  ldr     r3, [sp, #0x68]
000d54b2  movs    r4, #0
000d54b4  b       #0xd54b8
000d54b6  ldr     r3, [sp, #0x68]
000d54b8  ldr     r3, [r3]
000d54ba  ldr     r2, [sp, #0x1c]
000d54bc  cmp     r3, r2
000d54be  beq     #0xd54c6
000d54c0  ldr     r0, [sp, #4]
000d54c2  blx     #0xddbe4 ; -> objc_enumerationMutation
000d54c6  ldr     r2, [sp, #0x64]
000d54c8  ldr     r3, [sp, #0x18]
000d54ca  ldr.w   r5, [r2, r4, lsl #2]
000d54ce  cbnz    r3, #0xd54d6
000d54d0  movs    r2, #1
000d54d2  str     r2, [sp, #0x18]
000d54d4  b       #0xd54e2
000d54d6  ldr     r2, [pc, #0x114]
000d54d8  mov     r0, r8
000d54da  ldr     r1, [sp, #8]
000d54dc  add     r2, pc ; -> 0x0017fe54  
000d54de  blx     #0xddbfc ; -> objc_msgSend
000d54e2  mov     r0, r6
000d54e4  ldr     r1, [sp, #0x10]
000d54e6  blx     #0xddbfc ; -> objc_msgSend
000d54ea  tst.w   r0, #0xff
000d54ee  beq     #0xd5502
000d54f0  ldr     r1, [sp, #0x14]
000d54f2  mov     r0, r6
000d54f4  blx     #0xddbfc ; -> objc_msgSend
000d54f8  ldr     r1, [sp, #8]
000d54fa  mov     r2, r0
000d54fc  mov     r0, r8
000d54fe  blx     #0xddbfc ; -> objc_msgSend
000d5502  mov     r0, r6
000d5504  mov     r1, fp
000d5506  mov     r2, r5
000d5508  mov     r3, r8
000d550a  blx     #0xddbfc ; -> objc_msgSend
000d550e  uxtb    r0, r0
000d5510  cmp     r0, #0
000d5512  beq     #0xd55c6
000d5514  adds    r4, #1
000d5516  cmp     sl, r4
000d5518  bhi     #0xd54b6
000d551a  movs    r3, #0x10
000d551c  ldr     r0, [sp, #4]
000d551e  str     r3, [sp]
000d5520  ldr     r1, [sp, #0xc]
000d5522  add     r2, sp, #0x60
000d5524  add     r3, sp, #0x20
000d5526  blx     #0xddbfc ; -> objc_msgSend
000d552a  mov     sl, r0
000d552c  cmp     r0, #0
000d552e  bne     #0xd54b0
000d5530  ldr     r3, [pc, #0xbc]
000d5532  ldr     r1, [pc, #0xc0]
000d5534  mov     r0, r6
000d5536  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d5538  add     r1, pc ; -> 0x000fd754  
000d553a  ldr     r3, [r3]
000d553c  ldr     r1, [r1]
000d553e  ldr     r2, [r3]
000d5540  ldr     r3, [r6, r2]
000d5542  subs    r3, #1
000d5544  str     r3, [r6, r2]
000d5546  blx     #0xddbfc ; -> objc_msgSend
000d554a  tst.w   r0, #0xff
000d554e  beq     #0xd5574
000d5550  ldr     r1, [pc, #0xa4]
000d5552  ldr     r0, [sp, #4]
000d5554  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d5556  ldr     r1, [r1]
000d5558  blx     #0xddbfc ; -> objc_msgSend
000d555c  cbz     r0, #0xd5574
000d555e  ldr     r1, [pc, #0x9c]
000d5560  mov     r0, r6
000d5562  add     r1, pc ; -> 0x000fd904  
000d5564  ldr     r1, [r1]
000d5566  blx     #0xddbfc ; -> objc_msgSend
000d556a  ldr     r1, [sp, #8]
000d556c  mov     r2, r0
000d556e  mov     r0, r8
000d5570  blx     #0xddbfc ; -> objc_msgSend
000d5574  ldr     r2, [pc, #0x88]
000d5576  mov     r0, r8
000d5578  ldr     r1, [sp, #8]
000d557a  add     r2, pc ; -> 0x001822a4  
000d557c  blx     #0xddbfc ; -> objc_msgSend
000d5580  movs    r0, #1
000d5582  b       #0xd55c6
000d5584  ldr     r1, [pc, #0x7c]
000d5586  ldr     r2, [pc, #0x80]
000d5588  mov     r0, r8
000d558a  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d558c  add     r2, pc ; -> 0x001822b4  
000d558e  ldr     r1, [r1]
000d5590  movs    r4, #0
000d5592  str     r1, [sp, #8]
000d5594  blx     #0xddbfc ; -> objc_msgSend
000d5598  ldr     r1, [pc, #0x70]
000d559a  movs    r3, #0x10
000d559c  ldr     r0, [sp, #4]
000d559e  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d55a0  str     r3, [sp]
000d55a2  ldr     r1, [r1]
000d55a4  add     r2, sp, #0x60
000d55a6  add     r3, sp, #0x20
000d55a8  str     r4, [sp, #0x60]
000d55aa  str     r4, [sp, #0x64]
000d55ac  str     r4, [sp, #0x68]
000d55ae  str     r4, [sp, #0x6c]
000d55b0  str     r4, [sp, #0x70]
000d55b2  str     r4, [sp, #0x74]
000d55b4  str     r4, [sp, #0x78]
000d55b6  str     r4, [sp, #0x7c]
000d55b8  str     r1, [sp, #0xc]
000d55ba  blx     #0xddbfc ; -> objc_msgSend
000d55be  cmp     r0, #0
000d55c0  bne.w   #0xd548c
000d55c4  b       #0xd5530
000d55c6  sub.w   sp, r7, #0x18
000d55ca  pop.w   {r8, sl, fp}
000d55ce  pop     {r4, r5, r6, r7, pc}
000d55d0  udf     #0x86
000d55d2  movs    r1, r0
000d55d4  udf     #0x7a
000d55d6  movs    r1, r0
000d55d8  strh    r2, [r3, #0x24]
000d55da  movs    r2, r0
000d55dc  ldm     r5!, {r6, r7}
000d55de  movs    r2, r1
000d55e0  strh    r6, [r7, #0x14]
000d55e2  movs    r2, r0
000d55e4  strh    r0, [r4, #0x22]
000d55e6  movs    r2, r0
000d55e8  strh    r0, [r7, #0x22]
000d55ea  movs    r2, r0
000d55ec  add     r1, sp, #0x1d0
000d55ee  movs    r2, r1
000d55f0  ble     #0xd5538
000d55f2  movs    r1, r0
000d55f4  strh    r0, [r3, #0x10]
000d55f6  movs    r2, r0
000d55f8  strb    r0, [r5, #0x14]
000d55fa  movs    r2, r0
000d55fc  strh    r6, [r3, #0x1c]
000d55fe  movs    r2, r0
000d5600  ldm     r5, {r1, r2, r5}
000d5602  movs    r2, r1
000d5604  ldrb    r6, [r5, #3]
000d5606  movs    r2, r0
000d5608  ldm     r5, {r2, r5}
000d560a  movs    r2, r1
000d560c  strb    r6, [r6, #0xf]
000d560e  movs    r2, r0
