========================================================================
-[SBJsonWriter appendString  0x000d5610  324 bytes   SBJsonWriter.mm
========================================================================

000d5610  push    {r4, r5, r6, r7, lr}
000d5612  add     r7, sp, #0xc
000d5614  push.w  {r8, sl, fp}
000d5618  sub     sp, #0x14
000d561a  ldr     r1, [pc, #0xfc]
000d561c  mov     r5, r3
000d561e  ldr     r3, [pc, #0xfc]
000d5620  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d5622  mov     r8, r2
000d5624  ldr     r6, [r1]
000d5626  add     r3, pc ; -> 0x00181934  
000d5628  mov     r0, r5
000d562a  mov     r2, r3
000d562c  mov     r1, r6
000d562e  str     r3, [sp]
000d5630  blx     #0xddbfc ; -> objc_msgSend
000d5634  ldr     r2, [pc, #0xe8]
000d5636  ldr     r3, [pc, #0xec]
000d5638  add     r0, sp, #8
000d563a  add     r2, pc ; -> 0x000fd900  
000d563c  add     r3, pc ; -> 0x006bc15c  ZL12kEscapeChars
000d563e  ldr     r2, [r2]
000d5640  ldr     r3, [r3]
000d5642  mov     r1, r8
000d5644  blx     #0xddc14 ; -> objc_msgSend_stret
000d5648  ldr     r3, [sp, #0xc]
000d564a  cbnz    r3, #0xd5658
000d564c  mov     r0, r5
000d564e  mov     r1, r6
000d5650  mov     r2, r8
000d5652  blx     #0xddbfc ; -> objc_msgSend
000d5656  b       #0xd5702
000d5658  ldr     r1, [pc, #0xcc]
000d565a  mov     r0, r8
000d565c  movs    r4, #0
000d565e  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d5660  ldr     r1, [r1]
000d5662  blx     #0xddbfc ; -> objc_msgSend
000d5666  ldr     r1, [pc, #0xc4]
000d5668  add     r1, pc ; -> 0x000fcf24  
000d566a  ldr.w   fp, [r1]
000d566e  ldr     r1, [pc, #0xc0]
000d5670  add     r1, pc ; -> 0x000fce9c  
000d5672  ldr     r1, [r1]
000d5674  str     r1, [sp, #4]
000d5676  mov     sl, r0
000d5678  b       #0xd56fe
000d567a  mov     r0, r8
000d567c  mov     r1, fp
000d567e  mov     r2, r4
000d5680  blx     #0xddbfc ; -> objc_msgSend
000d5684  cmp     r0, #0xc
000d5686  mov     r3, r0
000d5688  strh.w  r0, [sp, #0x12]
000d568c  beq     #0xd56d8
000d568e  bhi     #0xd569e
000d5690  cmp     r0, #9
000d5692  beq     #0xd56c0
000d5694  cmp     r0, #0xa
000d5696  beq     #0xd56c6
000d5698  cmp     r0, #8
000d569a  bne     #0xd56de
000d569c  b       #0xd56d2
000d569e  cmp     r0, #0x22
000d56a0  beq     #0xd56ac
000d56a2  cmp     r0, #0x5c
000d56a4  beq     #0xd56b2
000d56a6  cmp     r0, #0xd
000d56a8  bne     #0xd56de
000d56aa  b       #0xd56cc
000d56ac  ldr     r2, [pc, #0x84]
000d56ae  add     r2, pc ; -> 0x001822c4  
000d56b0  b       #0xd56b6
000d56b2  ldr     r2, [pc, #0x84]
000d56b4  add     r2, pc ; -> 0x001822d4  
000d56b6  mov     r0, r5
000d56b8  mov     r1, r6
000d56ba  blx     #0xddbfc ; -> objc_msgSend
000d56be  b       #0xd56fc
000d56c0  ldr     r2, [pc, #0x78]
000d56c2  add     r2, pc ; -> 0x001822e4  
000d56c4  b       #0xd56b6
000d56c6  ldr     r2, [pc, #0x78]
000d56c8  add     r2, pc ; -> 0x001822f4  
000d56ca  b       #0xd56b6
000d56cc  ldr     r2, [pc, #0x74]
000d56ce  add     r2, pc ; -> 0x00182304  
000d56d0  b       #0xd56b6
000d56d2  ldr     r2, [pc, #0x74]
000d56d4  add     r2, pc ; -> 0x00182314  
000d56d6  b       #0xd56b6
000d56d8  ldr     r2, [pc, #0x70]
000d56da  add     r2, pc ; -> 0x00182324  
000d56dc  b       #0xd56b6
000d56de  cmp     r3, #0x1f
000d56e0  bhi     #0xd56f0
000d56e2  ldr     r2, [pc, #0x6c]
000d56e4  mov     r0, r5
000d56e6  ldr     r1, [sp, #4]
000d56e8  add     r2, pc ; -> 0x00182334  
000d56ea  blx     #0xddbfc ; -> objc_msgSend
000d56ee  b       #0xd56fc
000d56f0  mov     r0, r5
000d56f2  add.w   r1, sp, #0x12
000d56f6  movs    r2, #1
000d56f8  blx     #0xdd188 ; -> CFStringAppendCharacters
000d56fc  adds    r4, #1
000d56fe  cmp     r4, sl
000d5700  bne     #0xd567a
000d5702  mov     r0, r5
000d5704  mov     r1, r6
000d5706  ldr     r2, [sp]
000d5708  blx     #0xddbfc ; -> objc_msgSend
000d570c  movs    r0, #1
000d570e  sub.w   sp, r7, #0x18
000d5712  pop.w   {r8, sl, fp}
000d5716  pop     {r4, r5, r6, r7, pc}
000d5718  ldrb    r0, [r3, #1]
000d571a  movs    r2, r0
000d571c  stm     r3!, {r1, r3}
000d571e  movs    r2, r1
000d5720  strh    r2, [r0, #0x16]
000d5722  movs    r2, r0
000d5724  ldr     r4, [r3, #0x30]
000d5726  lsls    r6, r3, #1
000d5728  strb    r6, [r2, #0x10]
000d572a  movs    r2, r0
000d572c  ldrb    r0, [r7, #2]
000d572e  movs    r2, r0
000d5730  ldrb    r0, [r5]
000d5732  movs    r2, r0
000d5734  ldm     r4, {r1, r4}
000d5736  movs    r2, r1
000d5738  ldm     r4, {r2, r3, r4}
000d573a  movs    r2, r1
000d573c  ldm     r4, {r1, r2, r3, r4}
000d573e  movs    r2, r1
000d5740  ldm     r4!, {r3, r5}
000d5742  movs    r2, r1
000d5744  ldm     r4, {r1, r4, r5}
000d5746  movs    r2, r1
000d5748  ldm     r4, {r2, r3, r4, r5}
000d574a  movs    r2, r1
000d574c  ldm     r4!, {r1, r2, r6}
000d574e  movs    r2, r1
000d5750  ldm     r4!, {r3, r6}
000d5752  movs    r2, r1
